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

      SUBROUTINE XMDLOOK (MNGET, VOID, LVOID, NVOIDS, VROW, LASTER)
C
      IMPLICIT INTEGER (A-Z)
      INCLUDE 'suplib_memory_params.h'
C
C     This routine looks for space in the void table.
C
C***********************************************************************
C
C     MNGET    Amount of space requested.
C     VOID     Void table.
C     LVOID    Dimension of void table.
C     NVOIDS   Number of voids.
      DIMENSION VOID(LVOID,2)
C     VROW     Row number that contains void to satisfy space request.
C     LASTER   Error return.
C
C***********************************************************************
C
C     CHECK TO SEE IF A VOID WILL CONTAIN THE MEMORY REQUEST.
C
      VROW = 0
      VLEN = 0
      DO 100 I = 1, NVOIDS
         IF (VOID(I,2) .GE. MNGET) THEN
C
C           THIS VOID HAS ENOUGH ROOM - FIND THE SMALLEST VOID THAT
C           IS LARGE ENOUGH.
C
            IF (VLEN .EQ. 0 .OR. VOID(I,2) .LT. VLEN) THEN
               VROW = I
               VLEN = VOID(I,2)
            END IF
         END IF
  100 CONTINUE
      IF (VROW .NE. 0) THEN
         LASTER = SUCESS
      ELSE
         LASTER = NOGET
      END IF
      RETURN
      END
