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
      SUBROUTINE SNG2DBL (N, XSNG, XDBL)
C=======================================================================

C   --*** SNG2DBL *** Convert single precision to double precision
C   --   Written by Amy Gilkey - revised 02/18/96
C   --
C   --SNG2DBL converts a single precision array to double precision.
C   --
C   --Parameters:
C   --   N - IN - the number of array values
C   --   XSNG - IN - the single precision array
C   --   XDBL - OUT - the double precision array

      IMPLICIT NONE

      INTEGER N
      REAL XSNG(N)
      DOUBLE PRECISION XDBL(N)

      INTEGER I

      DO 100 I = 1, N
         XDBL(I) = XSNG(I)
  100 CONTINUE

      RETURN
      END
C CMS REPLACEMENT HISTORY, Element STP_SNG2DBL.FOR
C *2     9-APR-1996 13:10:23 APGILKE "REMOVE MULTIPLE COPIES OF SNG2DBL, DBL2SNG"
C *1     3-MAR-1996 11:35:58 APGILKE "Convert to double precision"
C CMS REPLACEMENT HISTORY, Element STP_SNG2DBL.FOR
