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
      SUBROUTINE DBL2SNG (N, XDBL, XSNG)
C=======================================================================

C   --*** DBL2SNG *** Convert double precision to single precision
C   --   Written by Amy Gilkey - revised 02/18/96
C   --
C   --DBL2SNG converts a double precision array to single precision.
C   --
C   --Parameters:
C   --   N - IN - the number of array values
C   --   XDBL - IN - the double precision array
C   --   XSNG - OUT - the single precision array

      IMPLICIT NONE

      INTEGER N
      DOUBLE PRECISION XDBL(N)
      REAL XSNG(N)

      INTEGER I

      DO 100 I = 1, N
         XSNG(I) = XDBL(I)
  100 CONTINUE

      RETURN
      END
C CMS REPLACEMENT HISTORY, Element STP_DBL2SNG.FOR
C *1     3-MAR-1996 11:35:56 APGILKE "Convert to double precision"
C CMS REPLACEMENT HISTORY, Element STP_DBL2SNG.FOR
