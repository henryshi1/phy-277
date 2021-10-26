! Program:     shi_112166935_hw09
! Purpose:     Evaluate Simpson's Rule but with double precision
! Author:      Henry Shi (section 1)
! Date:        11/07/19
! Version:     1.10

! -------------------------- Sample values ---------------------------
! Lower limit: 1.0
! Upper limit: 20.0
! Number of subintervals     Value of integral
! 5                          281.87397473018319
! 10                         2148.7255605868791
! 20                         750.64110074156349
! 50                         883.34115286824522
! 100                        1023.9408866276460
! 200                        993.62351775168509
! 500                        993.63147788943047
! 1000                       993.63147786634681
! 10000                      993.63147786507909
! 100000                     993.63147786499769
! 1000000                    993.63147786492289

! ------------------------------ Module ------------------------------

! This module contains the DOUBLE kind and the a,b,c parameters
module params
  implicit none
  integer,parameter :: DOUBLE=kind(1.0d0)
  real(kind=DOUBLE), parameter :: a = 4.0d3   ! constant a = 4000
  real(kind=DOUBLE), parameter :: b = 1.515d1 ! constant b = 15.15
  real(kind=DOUBLE), parameter :: c = 1.0d-2  ! constant c = 0.01

end module params

! -------------------------- Main program ----------------------------

program shi_112166935_hw09
  use params                          ! add the module with a,b,c defined
  implicit none

  ! -- Variable dictionary --
  real(kind=DOUBLE) :: dx             ! step size
  real(kind=DOUBLE) :: low            ! value of lower bound of integral
  real(kind=DOUBLE) :: high           ! value of higher bound of integral
  integer :: i                        ! counter for the loop
  integer :: n                        ! number of intervals
  real(kind=DOUBLE) :: xi             ! ith value of x
  real(kind=DOUBLE) :: sum=0.0d0      ! value of the sum
  real(kind=DOUBLE) :: term=0.0d0     ! current value of the integrand (term)
  real(kind=DOUBLE) :: f              ! value of function f(x)

  ! Tell user what the program does
  write(*,*) "This program implements Simpson's Rule."

  ! Ask user for input limits of integration
  call limits(low,high)
  
  ! Ask user for input number of intervals
  write(*,*) "Enter number of intervals:"
  read(*,*) n

  ! Calculate step size
  dx = (high - low) / (1.0d0*n)
  write(*,*) "interval size:", dx

  ! Calculate the sum
  xi = low + dx/2.0d0                 ! initialize the ith value of x
  sum = 0.0d0                         ! initialize the sum
  do i=1, n, 1                        ! Sum until you finish all intervals
     term = 1.0d0/6.0d0 * ( f(xi-dx/2.0d0) + 4.0d0*f(xi) + f(xi+dx/2.0d0) )
     sum = sum + term*dx              ! multiply each term by dx and add to sum
     xi = xi + dx                     ! increment xi
  enddo

  write(*,*) "Value of integral is", sum, "for", n, "intervals"
    
  stop 0
end program shi_112166935_hw09

! ---------------- Define subroutines and subprograms ----------------

! take user input for limits of integration
subroutine limits(low, high)
  implicit none

  ! Define local variables for limits of integration
  real(kind=kind(1.0d0)), intent(out) :: low, high    ! output

  ! Ask for user input
  write(*,*) "Enter lower limit and upper limit of integration:"
  read(*,*) low, high

  return
end subroutine limits

! evaluate integrant as a function of x at each point within subinterval
function f(x) result(fout)
  use params
  implicit none

  ! Define local variables
  real(kind=DOUBLE), intent(in) :: x        ! input variable x
  real(kind=DOUBLE) :: fout                 ! output variable f(x)

  fout = ( (x + cos(x)) * exp(cos(x)) + a * exp(-(x-b)**2 / c) )
  
  return
end function f
