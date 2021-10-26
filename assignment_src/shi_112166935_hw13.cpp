/*
Program:    shi_112166935_hw13
Purpose:    Create a class for 3-D vectors, with methods:
            -output (print function)
            -addition
            -subtraction
            -norm
            -dot product
            -cross product
            -constructor to initialize components
            -default constructor (creates zero vector)
Author:     Henry Shi
Date:       12/04/2019
Version:    1.0
 */

# include <iostream>
using namespace std;

class Vec3d{
public:
  // main methods
  Vec3d();                               // default constructor
  Vec3d(double a, double b, double c);   // constructor with params
  
  void output();                         // output (print) function
  Vec3d add(Vec3d v);                    // add vectors
  Vec3d subtract(Vec3d v);               // subtract vectors
  Vec3d norm();                          // norm function
  double dotProduct(Vec3d v);            // dot product
  Vec3d crossProduct(Vec3d v);           // cross product

  // accessor and mutator methods to help us
  void setVec3d(double a, double b, double c);
  void setX(double a);
  void setY(double b);
  void setZ(double c);
  double getX();
  double getY();
  double getZ();

private:
  // components of vector
  double x;
  double y;
  double z;
};

// Driver program
int main() {
  
  return 0;
}

// default constructor makes zero vector
Vec3d::Vec3d() {
  x = 0.0;
  y = 0.0;
  z = 0.0;
}

// constructor with parameters
Vec3d::Vec3d(double a, double b, double c) {
  x = a;
  y = b;
  z = c;
}

// print function
void Vec3d::output() {
  cout
}
