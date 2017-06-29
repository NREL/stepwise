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
      INTEGER FUNCTION ISTRFIND (STR, LENLST, STRLST)
C=======================================================================

C   --*** ISTRFIND *** (CAMCON_LIB) Find string in list
C   --   Written by Amy Gilkey - revised 03/26/93
C   --
C   --ISTRFIND returns the index of the given string in a list of strings.
C   --If the string is not in the list, ISTRFIND returns 0.
C   --
C   --Parameters:
C   --   STR - IN char*(*) - the string to be searched for
C   --   LENLST - IN integer - the number of strings in the list
C   --   STRLST - IN char*(*) array - the list of strings to be searched

      IMPLICIT NONE

C   --Parameter Definitions:
      CHARACTER*(*) STR
      INTEGER LENLST
      CHARACTER*(*) STRLST(LENLST)

      DO 100 ISTRFIND = 1, LENLST
         IF (STR .EQ. STRLST(ISTRFIND)) GOTO 110
  100 CONTINUE
      ISTRFIND = 0

  110 CONTINUE
      RETURN
      END
