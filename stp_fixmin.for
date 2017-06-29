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
      SUBROUTINE FIXMIN (XMIN, XMAX, XMINNW)
C=======================================================================

C   --*** FIXMIN *** (STEPWISE) Find minimum slightly about axis minimum
C   --   Written by Amy Gilkey - revised 08/20/92
C   --
C   --FIXMIN finds a logarithm minimum slightly above the axis minimum.
C   --
C   --Parameters:
C   --   XMIN - IN - the axis minimum
C   --   XMAX - IN - the axis maximum
C   --   XMINNW - OUT - the returned minimum

      IMPLICIT NONE

      REAL XMIN, XMAX
      REAL XMINNW

      INTEGER ISIGMN, ISIGMX
      INTEGER MAGMIN, MAGMAX
      INTEGER IDIF
      REAL SMN

      CALL GETMAG (XMIN, ISIGMN, MAGMIN)
      CALL GETMAG (XMAX, ISIGMX, MAGMAX)

      IDIF = MAGMAX - MAGMIN
      IF (IDIF .GT. 4) THEN
         SMN = 1.1
      ELSE IF (IDIF .GT. 2) THEN
         SMN = 1.03
      ELSE
         SMN = 1.01
      END IF
      ISIGMN = INT (SMN * 100.0)
      MAGMIN = MAGMIN - 2

      CALL SETMAG (ISIGMN, MAGMIN, XMINNW)

      RETURN
      END
C CMS REPLACEMENT HISTORY, Element STP_FIXMIN.FOR
C *1     1-NOV-1995 11:24:03 APGILKE "Initial load - Source code"
C CMS REPLACEMENT HISTORY, Element STP_FIXMIN.FOR
