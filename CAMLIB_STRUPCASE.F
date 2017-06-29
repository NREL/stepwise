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
      SUBROUTINE STRUPCASE (STRING)
C=======================================================================

C   --*** STRUPCASE *** (CAMCON_LIB) Convert string to upper-case
C   --   Written by Amy Gilkey - revised 02/27/93
C   --
C   --STRUPCASE converts the passed string to upper-case letters.
C   --
C   --Parameters:
C   --   STRING - IN/OUT char*(*) - the input string; the returned upper-case
C   --      string

      IMPLICIT NONE

C   --Parameter Definitions:
      CHARACTER*(*) STRING

C   --Definitions for functions called:
      INTEGER ISTRLEN

      INTEGER I, K

      CHARACTER*26 UPPER, LOWER
      SAVE UPPER, LOWER

      DATA UPPER / 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' /
      DATA LOWER / 'abcdefghijklmnopqrstuvwxyz' /

      DO 100 I = 1, ISTRLEN (STRING)
         K = INDEX (LOWER, STRING(I:I))
         IF (K .GE. 1) STRING(I:I) = UPPER(K:K)
  100 CONTINUE

      RETURN
      END
