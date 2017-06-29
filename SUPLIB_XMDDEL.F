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

      SUBROUTINE XMDDEL (NAME1, DICT, DPOINT, LDICT, NNAMES, VOID,
     &   LVOID, NVOIDS, CHRCOL, LASTER)
C
      IMPLICIT INTEGER (A-Z)
      INCLUDE 'suplib_memory_params.h'
C
C     This routine removes a name from the dictionary and returns the
C     available space to the void table.
C
C***********************************************************************
C
C     NAME1    Name to be deleted
      CHARACTER*8 NAME1
C     DICT     Dictionary name table
C     DPOINT   Dictionary pointer table
C     LDICT    Dimension of dictionary tables
C     NNAMES   Number of names in the dictionary
      CHARACTER*8 DICT(LDICT,CHRCOL)
      DIMENSION DPOINT(LDICT,CHRCOL,3), NNAMES(2)
C     VOID     Void table
C     LVOID    Dimension of void table
C     NVOIDS   Number of voids
      DIMENSION VOID(LVOID,CHRCOL,2), NVOIDS(2)
C     CHRCOL   Number of column for character names.
C     LASTER   Error return
C
C***********************************************************************
C
C     FIND NAME1 IN DICTIONARY.
C
      CALL XMDFIND (NAME1, DICT, DPOINT, LDICT, NNAMES,
     &   CHRCOL, LASTER, ROW)
      IF (LASTER .NE. SUCESS) RETURN
C
      LOC = DPOINT(ROW,1,1)
      LEN = DPOINT(ROW,1,2)
C
C     DELETE DICTIONARY ENTRY.
C
      CALL XMSHFTC (DICT, CHRCOL*LDICT, ROW+1, NNAMES(1), 1)
      CALL XMSHFTI (DPOINT, LDICT*CHRCOL, 3, ROW+1, NNAMES(1), 1)
      NNAMES(1) = NNAMES(1) - 1
      IF (LEN .LE. 0) RETURN
C
C     MAKE AN ENTRY IN THE VOID TABLE.
C
      CALL XMVTABLE (LOC, LEN, VOID, LVOID, NVOIDS(1), CHRCOL, LASTER)
      RETURN
      END
