  ! Purpose: multiply two numbers
  ! Author:  Henry Shi
  ! Date:    9/4/19

program multiply
  implicit none

  real :: x,y,z,w
  integer :: i

  write(*,*) "Enter x and y as reals:"
  read(*,*) x,y

  write(*,*) "x=",x
  write(*,*) "y=",y

  write(*,*) "term 1 =",47.33*x**3
  write(*,*) "term 2 =",25.2*y**(-4.5)
  w = 47.33*x**3 + 25.2*y**(-4.5)

  write(*,*) "w=",w
  
  z = w**2 + w
  
  write(*,*) "z = ",z
  
  stop 0                
end program multiply
