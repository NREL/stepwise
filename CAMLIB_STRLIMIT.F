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
      SUBROUTINE STRLIMIT (STRING, ILEFT, IRIGHT)
C=======================================================================

C   --*** STRLIMIT *** (CAMCON_LIB) Return indices of non-blank part of string
C   --   Written by Amy Gilkey - revised 03/26/93
C   --
C   --STRLIMIT returns the starting and ending indices of a string once the
C   --leading and trailing blanks have been stripped.  It does not modify
C   --the string, but simply returns the location of the first and last
C   --non-blank characters.  If the string is completely blank, ILEFT>IRIGHT.
C   --
C   --Parameters:
C   --   STRING - IN char*(*) - the string
C   --   ILEFT - OUT integer - the index of the first non-blank character
C   --   IRIGHT - OUT integer - the index of the last non-blank character

      IMPLICIT NONE

C   --Parameter Definitions:
      CHARACTER*(*) STRING
      INTEGER ILEFT, IRIGHT

C   --Definitions for functions called:
      INTEGER ISTRLEN

      INTEGER N

C   --Find the last non-blank character
      IRIGHT = ISTRLEN (STRING)
      ILEFT = 1
C   --Check for empty or invalid string
      IF (ILEFT .GT. IRIGHT) RETURN

C   --Find the first non-blank character

      DO 100 N = 1, IRIGHT
         IF (STRING(N:N) .NE. ' ') GOTO 110
  100 CONTINUE
  110 CONTINUE
      ILEFT = N

      RETURN
      END
