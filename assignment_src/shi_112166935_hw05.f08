! Program:     shi_112166935_hw05
! Purpose:     Use an iterative do loop to calculate the sum
!              C_i * ( x^(2i) ) / (2i!)
!              from i=0 to i=N
! Author:      Henry Shi (section 1)
! Date:        10/02/19
! Version:     1.0

program shi_112166935_hw05
  implicit none

  ! -- Variable dictionary --
  real :: x                     ! x value that the user enters
  integer :: n                  ! n value that the user enters
  integer :: i = 0              ! counter variable for the loop, intialized as 0
  integer :: two_i_fact = 1     ! the quantity (2i)! initialized as 1, to be defined recursively
                                   ! per iteration as (2i)*(2i-1)* ( previous (2i)! )
  real :: term                  ! the current term of series
  real :: sum = 0               ! the sum of terms

  ! Tell user what the program does
  write(*,*) "This program calculates the sum from i=0 to i=n of C_i * ( x^(2i) ) / (2i!)"

  ! Ask user for input x and n
  write(*,*) "Enter x > 0 (real):"
  read(*,*) x
  write(*,*) "Enter n > 0 (integer):"
  read(*,*) n

  ! Calculate the sum for i=0 (i.e. i goes from 0 to 0) and initial two_i_fact is 1
  term = (-1)**i * ( x**(2*i) ) / ( two_i_fact )
  sum = sum + term

  ! Calculate the sum for i=1 all the way to i=n
  do i=1, n, 1
     ! Define (2i)! recursively as (2i) * (2i-1) * ( previous (2i)! )
     two_i_fact = (2*i) * (2*i - 1) * two_i_fact
     term = (-1)**i * ( x**(2*i) ) / ( two_i_fact )
     sum = sum + term
  enddo

  write(*,*) "sum is ", sum
    
  stop 0
end program shi_112166935_hw05
