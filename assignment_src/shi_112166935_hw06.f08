! Program:     shi_112166935_hw05
! Purpose:     Evaluate Simpson's Rule
! Author:      Henry Shi (section 1)
! Date:        10/07/19
! Version:     1.0
! Number of subintervals         Value of integral
! 5                              322.705841
! 10                             307.916687
! 20                             1696.48328
! 50                             967.238098
! 100                            905.883057
! 200                            995.217590
! 500                            993.094116
! 1000                           993.946228
! 5000                           993.515198
! 10000                          993.754578
! Actual value                   993.631

program shi_112166935_hw06
  implicit none

  ! -- Variable dictionary --
  real, parameter :: a = 4000             ! constant a = 4000
  real, parameter :: b = 15.15            ! constant b = 15.15
  real, parameter :: c = 0.01             ! constant c = 0.01
  integer :: num_intervals                   ! number of intervals
  real :: step_size                       ! step size, calculated as (high - low) / num_intervals
  real, parameter :: low = 1              ! value of lower bound of integral = 1
  real, parameter :: high = 20            ! value of higher bound of integral = 20
  real :: i = low                         ! counter for the loop
  real :: integral = 0                    ! value of the integral
  real :: current                         ! current value of the integrand (argument)
  
  ! Tell user what the program does
  write(*,*) "This program implements Simpson's Rule to calculate the integral from 1 to 20 of a particular function"

  ! Ask user for input x
  ! Ask user for input number of intervals
  write(*,*) "Enter number of intervals:"
  read(*,*) num_intervals

  ! Calculate step size
  step_size = (high - low) / (1.0*num_intervals)
  write(*,*) "interval size:", step_size

  ! Calculate the sum
  do while (i < high .or. abs(i-high) < 1.0e-5)       ! Sum until you reach high. Note: floating-point comparison
     current = ( (i + cos(i)) * exp(cos(i)) + a * exp(-(i-b)**2 / c) ) * step_size
     integral = integral + current
     i = i + step_size
  enddo

  write(*,*) "Value of integral is", integral, "for", num_intervals, "intervals"
    
  stop 0
end program shi_112166935_hw06
