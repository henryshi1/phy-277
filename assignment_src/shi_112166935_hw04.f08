! Program:     shi_112166935_hw04
! Purpose:     Prompt user for the coordinates of ship and target,
!              and give:
!              1) range (distance) of target
!              2) bearing (direction) of target
!              3) quadrant (N, NE, E, SE, etc) of target
! Author:      Henry Shi (section 1)
! Date:        9/16/19
! Version:     1.0

program shi_112166935_hw04
  implicit none

  ! -- Variable dictionary --
  real :: x_s, y_s                         ! x and y coordinates of ship
  real :: x_t, y_t                         ! x and y coordinates of target
  real :: range                            ! range of target        
  real :: bearing                          ! bearing of target
  character(len=3) :: quadrant             ! quadrant of target
  ! -- Constants --
  real, parameter :: pi = 3.1415927        ! value of pi
  write(*,*) pi
  
  ! Get coordinates of ship
  write(*,*) "Enter ship coordinates in km (x,y):"
  read(*,*) x_s, y_s
  ! Get coordinates of target
  write(*,*) "Enter target coordinates in km (x,y):"
  read(*,*) x_t, y_t

  ! 1) Calculate range
  range = sqrt( (x_s-x_t)**2 + (y_s-y_t)**2 )

  ! Case-by-case quadrants
  
  ! Start with right two quadrants (NE, E, SE)
  if (x_t > x_s) then
     ! Quadrant Northeast
     if (y_t > y_s) then
        bearing = atan( (x_t-x_s) / (y_t-y_s) )
        quadrant = "NE"
     else
        ! Quadrant Southeast
        if (y_t < y_s) then
           bearing = pi + atan( (x_t-x_s) / (y_t-y_s) )
           quadrant = "SE"
        ! Due East
        else
           bearing = 0.5*pi
           quadrant = "E"
        endif
     endif
  ! Move onto left two quadrants (NW, W, SW)
  else
     if (x_t < x_s) then
        ! Quadrant Northwest
        if (y_t > y_s) then
           bearing = 2.0*pi + atan( (x_t-x_s) / (y_t-y_s) )
           quadrant = "NW"
        else
           ! Quadrant Southwest
           if (y_t < y_s) then
              bearing = pi + atan( (x_t-x_s) / (y_t-y_s) )
              quadrant = "SW"
           ! Due West
           else
              bearing = 1.5*pi
              quadrant = "W"
           endif
        endif
     ! x_t = x_s in this case. i.e. along y-axis (N, S)
     else
        ! Due North
        if (y_t > y_s) then
           bearing = 0
           quadrant = "N"
        else
           ! Due South
           if (y_t < y_s) then
              bearing = pi
              quadrant = "S"
           ! Right on ship
           else
              bearing = 0
              quadrant = "N/A"
              write(*,*) "WARNING: Target and Ship coordinates coincide!"
           endif
        endif
     endif
  endif
  
  ! Convert bearing to degrees
  bearing = bearing * 180.0 / pi

  ! Display the range
  write(*,*) "Range: ", range, " km"
  ! Display the bearing
  write(*,*) "Bearing: ", bearing, " degrees"
  ! Display the quadrant
  write(*,*) "Quadrant: ", quadrant
  
  stop 0
end program shi_112166935_hw04
