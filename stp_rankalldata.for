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
      SUBROUTINE RANKALLDATA (NUMOBS, NUMVAR, XYRAW, XYRNK, IWORK)
C=======================================================================

C   --*** RANKALLDATA *** (STEPWISE) Rank variable values over all observations
C   --   Modified by Amy Gilkey - revised 01/08/91
C   --
C   --RANKALLDATA ranks the values over all observations for each variable.
C   --
C   --Parameters:
C   --   NUMOBS - IN - the number of observations
C   --   NUMVAR - IN - the number of variables
C   --   XYRAW - IN - the variable data
C   --   XYRNK - OUT - the variable data (rank)
C   --   IWORK - SCRATCH - size = NUMOBS

      IMPLICIT NONE

      INTEGER NUMOBS
      INTEGER NUMVAR
      REAL XYRAW(NUMOBS,NUMVAR)
      REAL XYRNK(NUMOBS,NUMVAR)
      INTEGER IWORK(NUMOBS)

      INTEGER IV

      DO 100 IV = 1, NUMVAR
         CALL RANKER (NUMOBS, XYRAW(1,IV), XYRNK(1,IV), IWORK)
  100 CONTINUE

      RETURN
      END
C CMS REPLACEMENT HISTORY, Element STP_RANKALLDATA.FOR
C *1     1-NOV-1995 11:24:08 APGILKE "Initial load - Source code"
C CMS REPLACEMENT HISTORY, Element STP_RANKALLDATA.FOR
