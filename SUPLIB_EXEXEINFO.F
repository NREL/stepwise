C_______________________________________________________________________________
C     STEPWISE 2.21 is an updated version of the WIPP STEPWISE program configured to run on Windows
C     STEPWISE 2.21a is identical to STEPWISE 2.21 except it has a wrapper to allow it to be more easily called from within a code
C     See the STEPWISE User Manual (stp_220_um.pdf) in the ZIP file for more information
C
C     Copyright 2017 National Technology & Engineering Solutions of Sandia, LLC (NTESS).
C     Under the terms of Contract DE-NA0003525 with NTESS, the U.S. Government retains certain rights in this software.
C
C     Stepwise 2.21 is distributed under the GNU Lesser General Public License (see LICENSE.TXT)
C_______________________________________________________________________________

C=======================================================================
      SUBROUTINE EXEXEINFO (EXEFULL,
     &   EXENAM, EXEDAT, EXETYP, EXECLASS, EXEVERS, IERROR)
C=======================================================================
C     FORTRAN EXTENSION LIBRARY - UNIX ### NOT DONE ###

C   --*** EXEXEINFO *** (CAMSUPES_LIB) Get information about executable
C   --   Written by Amy Gilkey - revised 09/04/98
C   --
C   --EXEXEINFO spawns a process to get information about the current
C   --or supplied executable.  Most of the information is supplied by a
C   --CMS build, so executables not linked in this way will not have
C   --this information
C   --
C   --Parameters:
C   --   EXEFULL - IN/OUT char*(*) - the full path file name of the executable;
C   --      if blank, the current executable will be used and EXEFULL set
C   --   EXENAM - OUT char*(*) - the build name of the executable
C   --   EXEDAT - OUT char*(*) - the build link date in the format
C   --      mm/dd/yyyy (if EXEDAT 10 or 11 characters) or mm/dd/yy
C   --   EXETYP - OUT char*(*) - the build type (PROD, etc.)
C   --   EXECLASS - OUT char*(*) - the build class
C   --   EXEVERS - OUT char*(*) - the build version
C   --   IERROR - OUT integer - the returned error code
C   --      0 - no error
C   --      1 - executable was not linked with CMS build
C   --      2 - executable does not exist or other serious problem

C   --Machine Dependencies:
C   --   ###

      IMPLICIT NONE

C   --Parameter Definitions:
      CHARACTER*(*) EXEFULL, EXENAM, EXEDAT, EXETYP, EXECLASS, EXEVERS
      INTEGER IERROR

C   --Initialize parameters
      EXENAM = ' '
      EXEDAT = ' '
      EXETYP = ' '
      EXECLASS = ' '
      EXEVERS = ' '
      IERROR = 2

      RETURN
      END
