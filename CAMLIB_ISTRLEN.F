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
      INTEGER FUNCTION ISTRLEN (STRING)
C=======================================================================

C   --*** ISTRLEN *** (CAMCON_LIB) Return string length
C   --   Written by Amy Gilkey - revised 03/26/93
C   --
C   --ISTRLEN returns the length of a given string.  There can be blanks
C   --embedded within the string.
C   --
C   --Parameters:
C   --   STRING - IN char*(*) - the string

      IMPLICIT NONE

C   --Parameter Definitions:
      CHARACTER*(*) STRING

      INTEGER N

      ISTRLEN = LEN (STRING)
C   --Check for invalid string
      IF (ISTRLEN .LE. 0) RETURN

      IF (STRING(ISTRLEN:ISTRLEN) .EQ. ' ') THEN
         N = INDEX (STRING, ' ')
  100    CONTINUE
         IF (STRING(N:) .NE. ' ') THEN
            N = N + INDEX (STRING(N+1:), ' ')
            GOTO 100
         END IF
         ISTRLEN = N-1
      END IF

      RETURN
      END
