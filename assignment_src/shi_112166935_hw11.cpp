/* Program:       shi_112166935_hw11
   Purpose:       Use the Newton-Raphson algorithm to find
                      roots of f(x) = x + 3 sin(2x)
   Author:        Henry Shi (section 1)
   Date:          11/21/19
   Version:       1.3
 */

/* 5 roots found
   Root value        Guess(es)
   -2.61298          -4.0,  -3.5,  -3.0,  -2.6,  -2.5,  -2.3,  -1.0
   -1.9175           -2.2,  -2.0,  -1.8,  -1.5,  -1.2
   0                 -0.5,  -0.3,  -0.1,   0.0,   0.1,   0.3,   0.5
   1.9175             1.2,   1.5,   1.8,   1.9,   2.0,   2.2
   2.61298            1.0,   2.3,   2.5,   2.6,   3.0,   3.5,   4.0
 */

# include <iostream>
using namespace std;
# include <cmath>

// -------------- Function declarations -------------

double f(double x);
double fprime(double x);


// ------------------ Main program ------------------

int main() {

  // ---------------- Variable dictionary ----------------
  double guess = 0.0;          // initial value the user guesses
  double x = 0.0, x0 = 0.0;    // x0 is the current value, x is the next value

  // Read in the user guess
  cout << "Input a guess x for a root of f(x) = x+3sin(2x)" << endl;
  cin >> guess;
  
  // ---------------- Newton-Raphson implementation ----------------

  // Initialize x0
  x0 = guess;
  
  // Repeat until f(x0) is close to zero
  while (abs(f(x0)) > 1.0e-12) {
    // Determine the next value
    x = x0 - f(x0)/fprime(x0);

    // Update your current value and repeat
    x0 = x;
  }

  // Print the root
  cout << "x = " << x0 << " (root)" << endl;
  cout << "y = " << f(x0) << endl;

  // end the program
  return 0;
}

// -------------- Function definitions --------------

// f(x) = x + 3sin(2x)
double f(double x) {
  double f = x + 3.0 * sin(2.0*x);
  return f;
}

// f'(x) = 1 + 6cos(2x)
double fprime(double x) {
  double fprime = 1.0 + 6.0*cos(2.0*x);
  return fprime;
}
