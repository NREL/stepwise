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

      SUBROUTINE XMSHFTC (IARAY, N, ISTRT, IEND, INT)
C
C     THIS SUBROUTINE SHIFTS THE ROWS IN A CHARACTER ARRAY. IF INT>0
C     THEN ALL ROWS ISTRT TO IEND ARE SHIFTED UP "INT" ROWS. IF INT<0
C     THEN ALL ROWS ISTRT TO IEND ARE SHIFTED DOWN "INT" ROWS.
C
C     MODIFIED JAN 1986 BY BILL MILLS-CURRAN
C     THE CHARACTER ARRAY IS NOW 1-D RATHER THAN 2-D.
C
      IMPLICIT NONE
C
      INTEGER N
      CHARACTER*(*) IARAY(N)
      INTEGER ISTRT
      INTEGER IEND
      INTEGER INT
C
      INTEGER I1, I2, ID
      INTEGER I
C
C  CALCULATE RANGE AND INCREMENT OF DO LOOP
C
      IF (INT.LT.0) THEN
C
C  SHIFT DOWN
C
         I1 = IEND
         I2 = ISTRT
         ID = -1
      ELSE IF (INT.GT.0) THEN
C
C  SHIFT UP
C
         I1 = ISTRT
         I2 = IEND
         ID = 1
      ELSE
         RETURN
      END IF
C
C  PERFORM SHIFT
C
      DO 100 I = I1,I2,ID
         IARAY(I-INT) = IARAY(I)
  100 CONTINUE
      RETURN
      END
