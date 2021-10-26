/* Program:             shi_112166935_hw12
   Purpose:             Use the Runge-Kutta method to solve a differential equation
                            to calculate the horizontal distance of a cannonball
   Author:              Henry Shi (section 1)
   Date:                12/2/19
   Version:             1.0
 */

/* Range found (m):     21805
   Timestep dt (s):     0.001
 */

// -------------- Inclusion statements --------------

# include <iostream>
using namespace std;
# include <cmath>

// -------------- Function declarations -------------

double get_dx(double vx, double dt);                  // function for dx
double get_dy(double vy, double dt);                  // function for dy
double get_dvx(double vx, double vy, double dt);    // function for dv_x
double get_dvy(double vx, double vy, double dt);    // function for dv_y
double get_v(double vx, double vy);                   // function for v

// ----------- Global variable declaration ----------

const double g = 9.81;              // g = 9.81 m/s^2
const double alpha = 5.0e-5;        // alpha = 5 * 10^-5 m^-1

// ------------------ Main program ------------------

int main() {

  // ---------------- Variable dictionary ----------------
  double x = 0.0, y = 0.0;          // x and y, position of cannonball (m)
  double dx = 0.0, dy = 0.0;        // dx and dy, changes in x and y respectively (m)
  double vx = 0.0, vy = 0.0;        // vx and vy, velocity components (m/s)
  double v = 0.0;                   // v = sqrt(vx^2 + vy^2), velocity (m/s)
  double dvx = 0.0, dvy = 0.0;      // dvx and dvy, change in velocity components (m/s)
  double dt = 0.0;                  // dt, timestep (s)
  int i = 0;                        // number of loop iterations
  
  // Read in the timestep dt
  cout << "Input a timestep dt: ";
  cin >> dt;
  cout << "dt=" << dt << endl << "-----------------" << endl;
  
  // Initialize v, vx, vy for v = 800 m/s and 30 degrees
  v = 800.0;
  vx = 400*sqrt(3.0);
  vy = 400.0;

  // Repeat the program as long as the height y is greater than 0
  do {
    // Determine the values of dx, dy, dvx, dvy
    dx = get_dx(vx, dt);
    dy = get_dy(vy, dt);
    dvx = get_dvx(vx, vy, dt);
    dvy = get_dvy(vx, vy, dt);
    
    // Increment x, y by dx, dy
    cout << endl << "x = " << x << ",\ty = " << y << endl;
    cout << "dx = " << dx << ",\tdy = " << dy << endl;
    x += dx;
    y += dy;
    cout << "x = " << x << ",\ty = " << y << endl;

    // Increment vx, vy by dvx, dvy
    cout << endl << "vx = " << vx << ",\tvy = " << vy << endl;
    cout << "dvx = " << dvx << ",\tdvy = " << dvy << endl;
    vx += dvx;
    vy += dvy;
    cout << "vx = " << vx << ",\tvy = " << vy << endl;

    // Display the number of iterations so far
    i++;
    cout << endl << "after " << i << " iterations" << endl;
    cout << endl << "-------------------" << endl;
  }
  while (y > 0);
  
  // Print the results
  cout << "Timestep: dt = " << dt << " s" << endl;
  cout << "Range: x = " << x << " m" << endl;

  // end the program
  return 0;
}

// -------------- Function definitions --------------

// dx = vx*dt
double get_dx(double vx, double dt){
  double dx = vx * dt;
  return dx;
}

// dy = vy*dt
double get_dy(double vy, double dt){
  double dy = vy * dt;
  return dy;
}

// v = sqrt( (vx)^2+(vy)^2 )
double get_v(double vx, double vy){
  double v = sqrt(pow(vx,2) + pow(vy,2));
  return v;
}

// dv_x = -alpha * v * vx
double get_dvx(double vx, double vy, double dt){
  double v = get_v(vx, vy);
  double dvx = -alpha * v * vx * dt;
  return dvx;
}

// dv_y = (-alpha * v * vy - g) * dt
double get_dvy(double vx, double vy, double dt){
  double v = get_v(vx, vy);
  double dvy = (-alpha * v * vy - g) * dt;
  return dvy;
}
