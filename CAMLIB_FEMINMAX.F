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
      SUBROUTINE FEMINMAX (NPTS, PTS, VMIN, VMAX)
C=======================================================================

C   --*** FEMINMAX *** (CAMCON_LIB) Calculate min/max value
C   --   Written by Amy Gilkey - revised 02/27/93
C   --
C   --FEMINMAX calculates the minimum and maximum of the data.
C   --
C   --Parameters:
C   --   NPTS - IN integer - the number of points
C   --   PTS - IN real array - the points
C   --   VMIN, VMAX - OUT real - the minimum and maximum value of the points

      IMPLICIT NONE

C   --Parameter Definitions:
      INTEGER NPTS
      REAL PTS(NPTS)
      REAL VMIN, VMAX

      INTEGER I

      IF (NPTS .LE. 0) THEN
         VMIN =  1.0E+30
         VMAX = -1.0E+30
      ELSE
         VMIN = PTS(1)
         VMAX = PTS(1)
      END IF
      DO 100 I = 1, NPTS
         VMIN = MIN (VMIN, PTS(I))
         VMAX = MAX (VMAX, PTS(I))
  100 CONTINUE

      RETURN
      END
