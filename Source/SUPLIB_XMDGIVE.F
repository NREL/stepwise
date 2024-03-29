      SUBROUTINE XMDGIVE (MYLOC, DPOINT, LDICT, NNAMES, VOID, LVOID,
     &   NVOIDS, CHRCOL, LASTER)
C
      IMPLICIT INTEGER (A-Z)
      INCLUDE 'SUPLIB_MEMORY_PARAMS.H'
C
C***********************************************************************
C
C     MYLOC    Internal reference array address
C     DPOINT   Dictionary pointer table
C     LDICT    Dimension of dictionary
C     NNAMES   Number of names in the dictionary
      DIMENSION DPOINT(LDICT,CHRCOL,2), NNAMES(2)
C     VOID     Void table
C     LVOID    Dimension of void table
C     NVOIDS   Number of voids
      DIMENSION VOID(LVOID,CHRCOL,2), NVOIDS(2)
C     CHRCOL   Column for character tables
C     LASTER   Error return
C
C***********************************************************************
C
      LASTER = SUCESS
C
C     Look for a void that is not followed by a dictionary entry.
C     If one is found, release the space to the system.
C     NOTE: In previous versions of SUPES, the memory manager
C           attempted to release memory in the middle of a
C           user's program space.  This was OK most of the
C           time since the memory release was rarely done---even
C           if it was requested to do it.  I've changed this to
C           only allow release from the top of the user's program
C           space.  jrr, 3/5/90.
C           (For reference, the old code had this line:
C
C           IF (VADDR .EQ. DPOINT(IDICT,1,1)
C
C           I've changed it to:
C
C           IF (VADDR .LE. DPOINT(IDICT,1,1)
C
C
      DO 120 IVOID = 1, NVOIDS(1)
         VADDR = VOID(IVOID,1,1) + VOID(IVOID,1,2)
         DO 100 IDICT = 1, NNAMES(1)
            IF (VADDR .LE. DPOINT(IDICT,1,1)
     &         .AND. DPOINT(IDICT,1,2) .GE. 0) GOTO 110
  100    CONTINUE
C
C        Release this void.
C
         CALL EXMEMY (-VOID(IVOID,1,2), VOID(IVOID,1,1)+MYLOC-1, MEMRET)
         IF (MEMRET .LT. 0 .OR. MEMRET .GT. VOID(IVOID,1,2)) THEN
C
C           Illegal memory block size.
C
            LASTER = ILBLK
            RETURN
C
         END IF
C
C        Update void table.
C
         VOID(IVOID,1,2) = MEMRET
  110    CONTINUE
  120 CONTINUE
C
C     Update void table to reflect zero length voids.
C
      CALL XMVTABLE(1, 0, VOID, LVOID, NVOIDS(1), CHRCOL, LASTER)
C
      RETURN
      END
