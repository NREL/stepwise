      SUBROUTINE XMCRSRV (MYCV, NAME1, NEWLEN, NEWLOC, MYLOC, MYCLOC,
     &   UCLOC, OFFSET, COFFST, VOID, LVOID,
     &   NVOIDS, DICT, DPOINT, LDICT, NNAMES, CHRCOL, CHRNUM,
     &   DEFER, CFILL, CFDATA, MAXSIZ,
     &   LASTER)
C
      IMPLICIT INTEGER (A-Z)
      INCLUDE 'SUPLIB_MEMORY_PARAMS.H'
C
C     This routine finds space to service a non-negative space request.
C     If zero space is requested, a valid pointer of 1 will be
C     generated.
C
C***********************************************************************
C
C     MYCV     Internal reference array.
      CHARACTER MYCV(*)
C     NAME1    Name to be inserted in the dictionary
      CHARACTER*8 NAME1
C     NEWLEN   Length of requested storage (character units)
C     NEWLOC   Pointer of new storage (returned)
C     MYLOC    Reference address of internal numeric array
C     MYCLOC   Address of internal character array.
C     UCLOC    Address of user's character array.
C     OFFSET   Offset between internal numeric array and user's
C              numeric array.
C     COFFST   Offset between internal numeric array and user's
C              character array.
C     VOID     Void table
C     LVOID    Dimension of void table
C     NVOIDS   Number of voids
      DIMENSION VOID(LVOID,CHRCOL,2)
      DIMENSION NVOIDS(2)
C     DICT     Dictionary name table
C     DPOINT   Dictionary pointer table
C     LDICT    Dimension of dictionary tables
C     NNAMES   Number of names
C     Redefine character into character*8 to be consistant with 
C     XMCFIND  C.S. 05/25/2010
      CHARACTER*8 DICT(LDICT,CHRCOL)
      DIMENSION DPOINT(LDICT,CHRCOL,3)
      DIMENSION NNAMES(2)
C     CHRCOL   Number of column for character names.
C     CHRNUM   Number of characters per numeric storage unit.
C     DEFER    Flag for deferred mode.
      LOGICAL DEFER
C     CFILL    Flag for character data fill.
C     CFDATA   Data for fill.
      LOGICAL CFILL
      CHARACTER*1 CFDATA
C     MAXSIZ   Dimension of static character array.
C     LASTER   Error return
C
C***********************************************************************
C
      LASTER = SUCESS
      INTLEN = (NEWLEN + CHRNUM - 1) / CHRNUM
C
      IF (NEWLEN .EQ. 0) THEN
C
C        Zero length entry.
C
         NEWLOC = 1 - COFFST / CHRNUM
      ELSE
C
         CALL XMDLOOK (INTLEN, VOID(1,CHRCOL,1), CHRCOL*LVOID,
     &      NVOIDS(CHRCOL), VROW, LASTER)
C
         IF (LASTER .EQ. SUCESS) THEN
            NEWLOC = VOID(VROW,1,1)
         ELSE IF (DEFER .AND. CHRCOL .EQ. 1) THEN
C
C           A good void was not found - defer the space request.
C
            NEWLOC = IXLNUM(NEWLOC)
            INTLEN = - INTLEN
            LASTER = SUCESS
C
         ELSE IF (CHRCOL .EQ. 1) THEN
C
C           Get space.
C
            CALL XMDGET (MYLOC, INTLEN, VOID, LVOID,
     &         NVOIDS, CHRCOL, LASTER, VROW)
            IF (LASTER .NE. SUCESS) RETURN
            NEWLOC = VOID(VROW,1,1)
C
         ELSE
C
C           CHRCOL .EQ. 2
C
            CALL XMCGET (MYCLOC, NEWLEN, VOID, LVOID,
     &         NVOIDS, CHRCOL, MAXSIZ, LASTER, VROW)
            IF (LASTER .NE. SUCESS) RETURN
            NEWLOC = VOID(VROW,2,1)
C
         END IF
      END IF
C
C     Update dictionary.
C
      CALL XMCNSRT (NAME1, NEWLOC, INTLEN, NEWLEN, DICT, DPOINT, LDICT,
     &   NNAMES, CHRCOL, LASTER)
      IF (LASTER .EQ. WRTYPE) LASTER = BDNAME
      IF (LASTER .NE. SUCESS) RETURN
C
      IF (INTLEN .GT. 0) THEN
C
C        Data fill pattern.
C
         IF (CFILL) THEN
            TLOC = (VOID(VROW,CHRCOL,1) - 1) * CHRNUM + 1 + COFFST
     &         + UCLOC - MYCLOC
            DO 100 I = TLOC, TLOC + NEWLEN - 1
               MYCV(I) = CFDATA
  100       CONTINUE
         END IF
C
C        Update void table.
C
         VOID(VROW,CHRCOL,1) = VOID(VROW,CHRCOL,1) + INTLEN
         VOID(VROW,CHRCOL,2) = VOID(VROW,CHRCOL,2) - INTLEN
         CALL XMVTABLE (1, 0, VOID(1,CHRCOL,1), LVOID, NVOIDS(CHRCOL),
     &      CHRCOL, LASTER)
         NEWLOC = (NEWLOC - 1) * CHRNUM + 1 + COFFST
      ELSE
         NEWLOC = - UCLOC
      END IF
C
      RETURN
      END
