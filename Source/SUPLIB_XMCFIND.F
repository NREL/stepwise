      SUBROUTINE XMCFIND (NAME1, DICT, DPOINT, LDICT, NNAMES,
     &   CHRCOL, LASTER, ROW)
C
      IMPLICIT INTEGER (A-Z)
      INCLUDE 'SUPLIB_MEMORY_PARAMS.H'
C
C***********************************************************************
C
C     NAME1    Name to be found
      CHARACTER*8 NAME1
C     DICT     Dictionary name table
C     DPOINT   Dictionary pointer table
C     LDICT
      CHARACTER*8 DICT(LDICT,CHRCOL)
      DIMENSION DPOINT(LDICT,CHRCOL,3)
C     NNAMES   Number of names in the dictionary
      DIMENSION NNAMES(2)
C     CHRCOL   Column number for character array names.
C     LASTER   Error return
C     ROW      Location of found name or place to insert new name
C
C***********************************************************************
C
      CALL XMSRCHC (DICT, 1, NNAMES(1), NAME1, ERR, ROW)
      IF (ERR .EQ. 1) THEN
         IF (DPOINT(ROW,1,3) .NE. -1) THEN
C
C           The found name is a name for a character array.
            LASTER = SUCESS
C
         ELSE
C
C           The names was found and is of numeric type.
            LASTER = WRTYPE
         END IF
C
      ELSE IF (CHRCOL .EQ. 1) THEN
C
C        ENTRY NOT FOUND.
C
         LASTER = NONAME
C
      ELSE
         CALL XMSRCHC (DICT(1,2), 1, NNAMES(2), NAME1, ERR, ROW)
         IF (ERR .EQ. 1) THEN
            LASTER = SUCESS
         ELSE
            LASTER = NONAME
         END IF
      END IF
C
      RETURN
      END
