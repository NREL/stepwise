# About
STEPWISE is one library of Sandia National Laboratory's [Dakota](https://dakota.sandia.gov/content/packages/stepwise) package.

# To Build STEPWISE on Windows:
1. download mingw at http://www.mingw.org/wiki/Getting_Started
2. install and add the "bin" folder in mingw installation to path setting (e.g. set path = %PATH%;c:\mingw\bin)
3. install gfortran per "mingw-get install fortran gdb"
4. open a command window in the stepwise folder
5. run "mingw32-make" and stepwise.exe should be made in the current folder
6. copy stepwise.exe to deploy\runtime\bin folder in the SAM executable distribution

#To Build STEPWISE on Linux and OSX
1. make sure gcc and gfortran are installed on your system
2. run "make" and stepwise.bin should be made in the current folder
3. the stepwise.bin file will be copied to the SAM distribution when make is issued in SAMnt
