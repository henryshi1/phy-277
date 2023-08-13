# PHY 277 (Fall 2019), Stony Brook University
Programming course for Physics major. Emphasis on Numerical Analysis in FORTRAN and C++. 
All code edited in GNU Emacs and compiled using GCC compilers in Linux Ubuntu terminal environment.
Full assignment descriptions are given in the folder **assignment_desc**.

Assignments 1-9 are in FORTRAN. Assignments 10-14 are in C++. Source code is in the folder **assignment_src** and has the filename `shi_112166935_hw(number).(ext)` unless otherwise indicated.

# Assignment 1
Write your own version of the “Hello World!” program in Fortran (you may use the example in the lecture notes as a guide). Your code may output a message other than “Hello World!” provided that it is not an offensive messsage.

# Assignment 2
The relativistic kinetic energy of a particle is given by $K = (\gamma - 1) mc^2$

where $$\gamma = \left(1 - \frac{v^2}{c^2} \right)^{-1/2}$$

and $m$ is the particle mass, $v$ is the particle speed, and $c$ is the speed of light. Write a Fortran program that calculates the energy of a particle in MKS units. The program should prompt the user prompts the user to enter the particle mass and speed in and output the particle kinetic energy to the terminal screen. In the header block include a statement (in the comments) indicating what kinetic energy you found for a particle mass of 1 kilogram and a speed of 10,000,000 meters per second. Also state if you are certain that your program is giving a correct result for the particle kinetic energy.

# Assignment 3
Write a program that uses a single block `if` construct to evaluate the following function. (See `assignment03.pdf` in the **assignment_desc** folder.)

Your program should prompt the user to enter values for x and y and should output the value of the
function. You may assume that the variables of x and y have units of radians. Your code should use
intrinsic functions to evaluate the mathematical expressions (where possible).

# Assignment 4
Assume that a ship with position given by real Cartesian coordinates (x1,y1) using it's radar system sees an unknown target with real Cartesian coordinates (x2,y2). Write a Fortran program that prompts the user for the coordinates of the ship and target (in units of kilometers) and which calculates the range (distance), in kilometers, between the ship and the target and the bearing (the direction relative to true north), in degrees, of the target . The program should also tell the user what quadrant the target is in, i.e. northwest, northeast, southwest, or southeast, as well as if the target is exactly due north, south, east, or west of the ship. Finally, warn the user if the target and ship coordinates coincide. 

**USE NESTED IF CONSTRUCTS IN THIS PROGRAM. DO NOT USE ELSEIFS.**

Hint: You can assume that the y-axis is the north-south axis. Make use of the `atan` function and
classify all of the possible cases. It's OK to test for equality of floating point variables in this case to
determine if the bearing is due north, south, east or west. Don't forget to convert radians to degrees!
There is a helpful diagram on the next page. Make sure to put your user ID number in the filename
(see instruction # 3 below).

# Assignment 5
Use an iterative `do` loop to evaluate the sum

$$\sum^N_{i=0} \left(C_i \frac{x^{2i}}{(2i)!} \right)$$

where

* $C_i = -1$ if $i$ is odd

* $C_i = 1$ if $i$ is even

Your code should prompt the user to enter a real value for x > 0 and an integer value for n. It should
also output the value of the sum to STDOUT. **For full credit your code should use only a single loop.**

Challenge: It is possible to complete this assignment without using any `if` constructs, `if` statements,
or conditional constructs of any kind.

# Assignment 6
Use an `do while` loop in Fortran program to implement Simpson’s rule to evaluate the integral.

$$\int^{20}_1 \left\[ \left( x + \cos(x) \right) e^{\cos(x)} + ae^{-\frac{(x-b)^2}{c}} \right\] dx$$

Where $a=4000$, $b=15.15$, and $c=0.01$. Indicate in the comment block (at the beginning of your code) what value you obtained for the integral as a function of the number of subintervals used, i.e. put a table of the value of the integral versus the number of subintervals in the comments of the header block. Clearly indicate in the header block comments what you think is the most accurate value for the integral and why you think it is the most accurate value. 

# Assignment 7
Write a Fortran program that reads in and arbitrary number of real values (one per line of the file) from a file and stores those values in a rank-1 array. The program should prompt the user to enter the file name. In addition, the program should compute the mean and standard deviation of the values and output those results to STDOUT. The mean and the corrected sample standard deviation are given by

$$\mu = \frac{1}{N} \sum^N_{i=1} x_i$$

$$\sigma = \sqrt{\frac{1}{N-1} \sum^N_{i=1} (x_i - \mu)^2}$$

where $x_i$ is the i-th data point and $N$ is the total number of data points.

Hints: You may find the `trim()` intrinsic function useful to get rid of trailing blank spaces stored in a character variable that you use to hold the file name. 

The input filename is `hw07input.dat`.

# Assignment 8
Suppose there are two square charges located inside a 2-D 10cm x 10cm grounded conducting box that has electrical potential U=0 everywhere on the boundary. If the interior of the box is divided into 100 square cells in each direction ($10^4$ cells total) (each of size 0.1cm x 0.1cm) then that can be described by the partial differential equation for the potential, U,

$$\frac{\partial^2 U}{\partial x^2} + \frac{\partial^2 U}{\partial y^2} = 4\pi q$$

where q is the charge density. This can be discretized and solved via relaxation by the iterative equation

$$U^{new}_{i,j} = \frac{1}{4}$$


$$U^{new}_{i,j} = \frac{ U^{old}_{i+1,j} + U^{old}_{i-1,j} + U^{old}_{i,j+1} + U^{old}_{i,j-1} - 4\pi h^2 q_{i,j} }{4}$$

Assume that the charge density in cell (25,25) is -4 in CGS units and that the charge density in cell (75,75) is equal to -4 in CGS units. Write a Fortran program that uses rank 2 arrays to solve this equation iteratively and which writes out the electrical potential data in Gnuplot form. You may look at the Poisson program in the notes as a guide to help you but write your own code, don't just copy mine! What is the electrical potential of the cell (25,50)? (Indicate your answer in the header comment-block of the code).

# Assignment 9
Convert your Simpson's Rule code (from Assignment 6) to use double precision for all real variables
and constants. You should also modify your code to use a subroutine to supply the limits of integration
and a user defined function subprogram to evaluate the integrand as a function of x at each point
within the subinterval as needed to evaluate Simpson's Rule (note: you should invoke the function
subprogram three times with three different arguments. The code should compute the x abcissas
directly (see examples in the Lecture 22 notes) as opposed to incrementing the location of the abcissas.

Do not create three different function subprograms!) For simplicity package all of your code in one
file. Finally repeat the convergence study you did and note, in comments in the header block, how the
converged value you find for the integral compares to the value you found using single precision reals
in Assignment 6.

# Assignment 10
Write (in C++) a program that solves that uses the quadratic formula to find the solutions, in double precision, of the quadratic equation

$ax^2 + bx + c = 0$

where a, b, and c are real numbers. Your code should hand the case where a=0 as well as the case where
the roots are complex (by writing out the real and imaginary parts separately). Your code should also prompt the user to enter values for a, b, and c.

# Assignment 11
Write (in C++) a program that solves that uses Newton-Raphson iteration to find the roots of the function

$f(x) = x + 3\sin(2x)$

Your code should prompt the user to enter an initial guess for the root. In the header block note how many
roots you found, what the approximate values of the roots are, and what initial guesses you used to find each root.

# Assignment 12
Write (in C++) a program that implements the 4th order Runge-Kutta algorithm to solve the following problem:
Assume the trajectory of a cannonball, including the effects of atmospheric drag, is given by the equations

$\frac{dx}{dt} = v_x$

$\frac{dy}{dt} = v_y$

$\frac{dv_x}{dt} = -\alpha v v_x$

$\frac{dv_y}{dt} = -\alpha v v_y - g$

where $g = 9.81 m/s$, $\alpha = 5 \times 10^{-5} m^{-1}$, and $v = \sqrt{v_x^2 + v_y^2}$. Suppose we launch a cannonball at an
angle of $30^\circ$ above the horizon with a speed of $v = 800 m/s$. How far does the cannonball travel
horizontally and what timestep size ($\Delta t$) did you have to use to find your answer? <em>You should put your answers in comment statements in your header block along with the results of a convergence test. <strong>See page 2 for an important suggestions on how to proceed in developing this code. Submit only a single source code file containing all code.</strong></em>

Note: The program should use C++ functions for the problem specific parts (initial conditions, number of
equations, the right-hand-sides of the ODEs) and dynamic arrays so that the main driver program is generic (no problem specific information in the main program!). <strong><em>Failure to use C++ functions to implement the problem specific parts of the code will mean an automatic score of zero for your grade on this problem.</em></strong>

# Assignment 13
Develop an encapsulated C++ class for 3-d vectors (look at the Fortran example of a vector class in the notes for lecture 32) that implements methods for the following operations: vector output (a print function), vector addition, vector subtraction, a vector norm, vector dot product, and a vector cross product. All member variables should be defined as private. The class should also have a class constructor that allows the initialization of the three components of each vector as well as a default constructor. The class should be packaged in a namespace. Also provide a driver program that demonstrates how each of the methods works by exercising them on instances of this class. <strong>All the code for this assignment should be packaged into a single file.</strong>

# Assignment 14
Using the code you produced for Assignment 8 make a 2-D Gnuplot heat map image (output in encapsulated Postscript form) that depicts your converged solution to the 2-D conducting box electrical potential problem. Using LaTeX produce a short document that describes the partial differential equation that was solved, the finite-difference form of the equation, an enumerated step-by-step description of the iterative algorithm that was used to solve the equation, and the final result that you obtained. Your code will be graded on how well you typeset your equations and how clearly you
describe the algorithm and your results! 

For simplicity, name the heatmap image file (which your are to include into the LaTeX document using the `epsfig` package) \<yourlastnamehere\>\_heatmap.eps

<strong>You should submit both the LaTeX file and the EPS file (just upload one at a time). Your LaTeX file must be processed by LaTeX on the Mathlab machines without errors or you will receive a zero on this assignment!</strong>

Output file `hw08.dat` gives box coordinates and potential values for each coordinate. Image `hw08.png` created by Gnuplot.