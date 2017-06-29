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
      SUBROUTINE EXCMDLIN (LINE)
C=======================================================================
C     FORTRAN EXTENSION LIBRARY - UNIX

C   --*** EXCMDLIN *** (CAMSUPES_LIB) Get command line
C   --   Written by Amy Gilkey - revised 09/02/94
C   --
C   --EXCMDLIN reads the arguments from the command line and appends
C   --them into a single line.
C   --
C   --Parameters:
C   --   LINE - OUT char*(*) - the returned command line
C
C   --Machine Dependencies:
C   --   IARGC and GETARG and LNBLNK are called.

      USE DFLIB
      IMPLICIT NONE

C   --Parameter Definitions:
      CHARACTER LINE*(*)
     
      INTEGER IARGC, LNBLNK

      CHARACTER STR*132
      INTEGER NNARGS, I, L

      NNARGS = IARGC ()

      IF (NNARGS .GT. 0) THEN

         LINE = ' '

         DO 100 I = 1, NNARGS
            CALL GETARG (I, STR)
            IF (I .LE. 1) THEN
               LINE = STR
            ELSE
               L = LNBLNK (LINE)
               LINE(L+1:) = ' ' // STR
            END IF
  100    CONTINUE

      ELSE
         LINE = ' '
      END IF

      RETURN
      END
