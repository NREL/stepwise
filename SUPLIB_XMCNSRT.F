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

      SUBROUTINE XMCNSRT (NAME1, NEWLOC, NUMLEN, CLEN,
     &   DICT, DPOINT, LDICT,
     &   NNAMES, CHRCOL, LASTER)
C
      IMPLICIT INTEGER (A-Z)
      INCLUDE 'suplib_memory_params.h'
C
C     This routine updates the dictionary with a new name (if it is new)
C     and updates the location and length tables.  The length of the
C     dictionary is checked before the new name is added.  If LASTER is
C     not returned with a value of SUCESS, the tables are unchanged.
C
C***********************************************************************
C
C     NAME1    Name to be inserted
      CHARACTER*8 NAME1
C     NEWLOC   Location of storage
C     NUMLEN   Numeric length of storage
C     CLEN     Character length of storage
C     DICT     Dictionary name table
C     DPOINT   Dictionary pointer table
C     LDICT    Dimensioned size of dictionary
C     NNAMES   Number of entries in the dictionary
      CHARACTER*8 DICT(LDICT,CHRCOL)
      DIMENSION DPOINT(LDICT,CHRCOL,3), NNAMES(2)
C     CHRCOL   Number of column for character names.
C     LASTER   Error return
C
C***********************************************************************
C
C     IS THERE ROOM IN THE DICTIONARY?
C
      IF (NNAMES(CHRCOL) .GE. LDICT) THEN
         LASTER = DFULL
         RETURN
      END IF
C
C     FIND NAME1 IN DICTIONARY
C
      CALL XMCFIND (NAME1, DICT, DPOINT, LDICT, NNAMES,
     &   CHRCOL, LASTER, ROW)
      IF (LASTER .EQ. WRTYPE) THEN
         RETURN
      ELSE IF (LASTER .EQ. SUCESS) THEN
         LASTER = BDNAME
         RETURN
      ELSE IF (LASTER .EQ. NONAME) THEN
         LASTER = SUCESS
      END IF
C
C     UPDATE DICTIONARY.
C
      CALL XMSHFTC (DICT(1,CHRCOL), CHRCOL*LDICT, ROW,
     &   NNAMES(CHRCOL), -1)
      CALL XMSHFTI (DPOINT(1,CHRCOL,1), CHRCOL*LDICT, 3, ROW,
     &   NNAMES(CHRCOL), -1)
      NNAMES(CHRCOL) = NNAMES(CHRCOL) + 1
      DICT(ROW,CHRCOL) = NAME1
      DPOINT(ROW,CHRCOL,1) = NEWLOC
      DPOINT(ROW,CHRCOL,2) = NUMLEN
      DPOINT(ROW,CHRCOL,3) = CLEN
      RETURN
      END
