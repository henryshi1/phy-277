! Program:     shi_112166935_hw02
! Purpose:     Calculate the energy of a particle in MKS units
  !            based on its mass and speed
! Author:      Henry Shi (section 1)
! Date:        9/11/19
! Version:     1.0
! Example (mass = 1 kg, speed = 10000000 m/s): KE = 5.00449E+13 joules
program shi_112166935_hw02
  implicit none

  ! -- Variable dictionary --
  real :: mass                  ! mass of particle (kg)
  real :: speed                    ! speed of particle (m/s)
  real :: kinetic_energy           ! kinetic energy of particle (J)
  real, parameter :: c=2.99792e8   ! speed of light (299,792 m/s)
  real :: gamma                    ! Lorentz factor, denoted by gamma

  ! read in the mass
  write(*,*) "Enter mass of particle (in kilograms):"
  read(*,*) mass

  ! read in the speed
  write(*,*) "Enter speed of particle (in meters per second):"
  read(*,*) speed

  ! calculate the Lorentz factor
  gamma = 1.0/sqrt(1-speed**2/c**2)
  
  ! calculate the kinetic energy
  kinetic_energy = (gamma-1.0)*mass*(c**2)

  ! print out the kinetic energy
  write(*,*) "Kinetic energy of particle is ",kinetic_energy," J"

  stop 0
end program shi_112166935_hw02
