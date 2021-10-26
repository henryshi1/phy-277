! Program:     shi_112166935_hw07
! Purpose:     Calculate the mean and standard deviation
!              of a list of values in an input file
! Author:      Henry Shi (section 1)
! Date:        10/23/19
! Version:     1.0

program shi_112166935_hw07
  implicit none

  ! -- Variable dictionary --
  character(len=100) :: filename             ! file name, input by user
  character(len=:),allocatable :: ierr_msg   ! file reading error message
  real, allocatable :: x(:)                  ! data array
  integer :: flun                            ! file logical unit number
  integer :: ierr                            ! error status
  integer :: i, j                            ! loop indices
  integer :: n=0                             ! number of points
  real :: mean=0.0                           ! mean
  real :: stdev=0.0                          ! standard deviation
  real :: datapoint                          ! data point being read in
  
  ! Tell user what the program does
  write(*,*) "This program calculates the mean and standard deviation", &
       " of a list of numbers in a file."

  ! Prompt user for filename
  write(*,*) "Enter input filename:"
  read(*,*) filename
  filename = trim(filename)

  ! open the file
  open(file=filename, newunit=flun, status='OLD', action='READ', iostat=ierr)
  ! end program if filename is invalid
  if (ierr /= 0) then
     ierr_msg = "Could not open file named " // filename
     write(*,*) ierr_msg, ierr
     stop 1
  endif

  write(*,*) "List of values:"
  ! find number of values and determine how to allocate array
  do while(ierr == 0)
     read(flun,*,iostat=ierr) datapoint
     if (ierr /= 0) then
         exit
     else
        n = n+1
     endif
  enddo

  ! allocate the array
  allocate(x(n))
  rewind(flun)

  ! re-read the file and fill the array. Also print each value on a line
  do i=1,n,1
     read (flun,*) x(i)
     write(*,*) x(i)
  enddo

  ! close the file
  close(unit=flun)

  ! loop through the array and calculate mean
  do i=1,n,1
     mean = mean + 1.0*x(i)
  enddo
  mean = mean / (1.0*n)

  write(*,*) "mean: ", mean

  ! loop through the array again and calculate standard deviation
  do i=1,n,1
     stdev = stdev + (x(i)-mean)**2
  enddo
  stdev = sqrt( stdev / (1.0*n - 1.0) )

  write(*,*) "standard deviation: ", stdev

  deallocate(x)
  
  stop 0
end program shi_112166935_hw07
