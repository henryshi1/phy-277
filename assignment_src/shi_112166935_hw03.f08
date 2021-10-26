! Program:     shi_112166935_hw03
! Purpose:     Use a single if-else block to evaluate the piecewise
!              define function f(x,y)
! f(x,y)   =   x + ln(x) + y^(6/7)                 if x>0 and y>0
!          =   x^3 + ln(2x) + e^y                  if x>0 and y<=0
!          =   4x^5 + ln(-x+1/7) + e^(sin(2y))     if x<=0 and y>0
!          =   4x^5 + ln(-x+1/7) + e^(cos(2y))     otherwise
! Author:      Henry Shi (section 1)
! Date:        9/18/19
! Version:     1.0

program shi_112166935_hw03
  implicit none

  ! -- Variable dictionary --
  real :: x, y               ! user-input values for x and y
  real :: f_xy               ! f(x,y) is the output
  
  ! read in the value of x
  write(*,*) "Enter x:"
  read(*,*) x
  
  ! read in the value of y
  write(*,*) "Enter y:"
  read(*,*) y

  ! calculate f(x,y)
  if ((x > 0.0) .and. (y > 0.0)) then
     f_xy = x + log(x) + y**(6.0/7.0)
     
  elseif ((x > 0.0) .and. (y <= 0.0)) then
     f_xy = x**3 + log(2.0*x) + exp(y)

  elseif ((x <= 0.0) .and. (y > 0.0)) then
     f_xy = 4.0*x**5 + log(-x + 1.0/7.0) + exp(sin(2.0*y))

  else
     f_xy = 4.0*x**5 + log(-x + 1.0/7.0) + exp(cos(2.0*y))
  endif

  ! print the value of f(x,y)
  write(*,*) "f(x,y)=",f_xy
  
  stop 0
end program shi_112166935_hw03
