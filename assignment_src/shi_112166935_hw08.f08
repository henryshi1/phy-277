! Program:     shi_112166935_hw08
! Purpose:     There are two square (25,25) and (75,75) charges in a 100 x 100 box.
!              This program solves for electric potential at cell (25,50).
!              Iterative equation is Unew(i,j) = ( Uold(i+1,j)+Uold(i-1,j)+Uold(i,j+1)+Uold(i,j-1)-4pi*h^2*q(i,j) ) / 4
! Author:      Henry Shi (section 1)
! Date:        1/1/19
! Version:     1.8

! Result:      U(25,50) =    5.46263754E-02


program shi_112166935_hw08
  implicit none

  ! -- Variable dictionary --
  integer,parameter :: XLEN=100              ! length of box in the x-direction
  integer,parameter :: YLEN=100              ! length of box in the y-direction
  real,dimension(0:YLEN+1,0:XLEN+1) :: u     ! initial electric potential (old)
  real,dimension(0:YLEN+1,0:XLEN+1) :: unew  ! final electric potential (new)
  real,dimension(0:YLEN+1,0:XLEN+1) :: q     ! charge distribution
  real,parameter :: H=0.1                    ! unit cell size
  integer :: i, j                            ! loop indices for box
  integer :: k=0                             ! number of iterations, k
  real :: error=1.0                          ! max change between the electric potential arrays
  real,parameter :: PI=3.14159265            ! value of pi

  real :: x,y                                ! x and y coordinates for gnuplot
  integer :: LUN1=33                         ! logical unit number for plot I/O
    
    
  ! initialize all arrays to zero
  u = 0.0
  unew = u
  
  q = 0.0
  q(25,25) = -4.0                            ! Charge is -4 esu at (25,25)
  q(75,75) = -4.0                            ! Charge is -4 esu at (75,75)

  
  ! iterate the equation until the final result approaches a limit

  do while (error > 1.0e-5)

     do i=1,YLEN
        do j=1,XLEN
           unew(i,j) = (u(i+1,j)+u(i-1,j)+u(i,j+1)+ &
                        u(i,j-1)-4.0*PI*H*H*q(i,j))*0.25
        enddo        
     enddo

     ! calculate the error
     error = maxval(abs(u-unew))

     ! update the array
     u = unew

     ! write out the iteration number and electrical potential in cell (25,50)
     k = k+1
     write(*,*) "k = ",k
     write(*,*) "U(25,50) = ", u(25,50)
     write(*,*) "error = ",error
     write(*,*) " "               ! blank line

     
  enddo

  ! open a .dat file to feed into gnuplot
  open(unit=LUN1,file="hw08.dat",status="replace")

  ! generate the .dat file
  y = -0.5*H                     ! initialize the first cell y-coordinate
  do j=0, XLEN+1                 ! Loop over columns
     x = -0.5*H                  ! initialize the first cell x-coordinate for each column
     do i=0, YLEN+1              ! Loop over each row
        write(LUN1,*) x,y,u(i,j) ! write each row of the .dat file:     x     y      u(i,j)
        x = x + H                ! increment x-coordinate
     enddo
     write(LUN1,*) " "            ! write blank line after each row
     y = y + H                   ! increment y-coordinate to next row
  enddo
  close(unit=LUN1)               ! close the .dat file
  
  stop 0
end program shi_112166935_hw08
