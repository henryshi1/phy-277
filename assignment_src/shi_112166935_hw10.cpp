# include <iostream>
using namespace std;
# include <cmath>

int main() {

  // ---------------- Variable dictionary ----------------
  double a=0, b=0, c=0;               // a,b,c of quadratic ax^2+bx+c=0
  double disc=0;                      // the discriminant b^2-4ac
  // real and imaginary parts of roots
  double x1_real=0, x1_imag=0, x2_real=0, x2_imag=0;

  // -------------------- User input ---------------------
  cout << "ax^2 + bx + c = 0" << endl;
  cout << "Enter value for a: ";
  cin >> a;
  cout << "Enter value for b: ";
  cin >> b;
  cout << "Enter value for c: ";
  cin >> c;

  cout << "a=" << a << endl << "b=" << b << endl << "c=" << c << endl;

  // -------------- Calculating solution(s) --------------
  
  // if a == 0, it's just a linear equation with 1 solution
  if (a == 0) {
    x1_real = -c/b;
    x1_imag = 0;
  }
  
  // otherwise, it's a quadratic equation
  else {

    // calculate discriminant
    disc = pow(b,2) - 4.0*a*c;

    // if disc > 0, there are two real roots
    if (disc > 0) {
      x1_real = (-b + sqrt(disc)) / (2.0*a);
      x1_imag = 0;
      x2_real = (-b - sqrt(disc)) / (2.0*a);
      x2_imag = 0;
    }
    // if disc < 0, there are two imaginary roots
    else if (disc < 0) {
      x1_real = -b / (2.0*a);
      x2_real = -b / (2.0*a);

      x1_imag = sqrt(-disc) / (2.0*a);
      x2_imag = -sqrt(-disc) / (2.0*a);
    }
    // if disc == 0, then the 1 solution is -b/2a
    else {
      x1_real = -b / (2.0*a);
      x1_imag = 0;
    }
  }

  // --------------- Printing solution(s) ----------------
  
  cout << "x1 = " << x1_real << " + " << x1_imag << "i" << endl;
  if (x2_real != 0 || x2_imag != 0) {
    cout << "x2 = " << x2_real << " + " << x2_imag << "i" << endl;
  }
  
  // end the program
  return 0;
}
