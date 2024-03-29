      SUBROUTINE XMDLOOK (MNGET, VOID, LVOID, NVOIDS, VROW, LASTER)
C
      IMPLICIT INTEGER (A-Z)
      INCLUDE 'SUPLIB_MEMORY_PARAMS.H'
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
