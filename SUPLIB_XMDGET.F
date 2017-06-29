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

      SUBROUTINE XMDGET (MYLOC, MNGET, VOID, LVOID, NVOIDS,
     &   CHRCOL, LASTER, VROW)
C
      IMPLICIT INTEGER (A-Z)
      INCLUDE 'suplib_memory_params.h'
C
C     This subroutine returns the location (row number) of a void with
C     sufficient space for the memory request.  If necessary, memory is
C     acquired from the system.  The memory is contiguous.
C
C
C***********************************************************************
C
C     MYLOC    Address of internal reference array
C     MNGET    Memory request in numerical storage units
C     VOID     Void table
C     LVOID    Dimension of void table
C     NVOIDS   Number of voids
      DIMENSION VOID(LVOID,CHRCOL,2), NVOIDS(2)
C     CHRCOL   Column for character tables.
C     LASTER   Error return
C     VROW     Row number of void which satisfies the memory request
C
C***********************************************************************
C
C     IS THE MEMORY REQUEST SENSIBLE?
C
      IF (MNGET .LT. 0) THEN
         LASTER = BADLEN
         RETURN
      ELSE IF (MNGET .EQ. 0) THEN
         LASTER = SUCESS
         RETURN
      END IF
C
      CALL XMDLOOK (MNGET, VOID, CHRCOL*LVOID, NVOIDS(1), VROW, LASTER)
      IF (LASTER .EQ. SUCESS) RETURN
C
C     CALL EXTENSION LIBRARY ROUTINE TO GET SPACE FROM SYSTEM.
C
      CALL EXMEMY (MNGET, LOC, MEMRET)
      LOC = LOC - MYLOC + 1
C
C  On return from exmemy, memret is set equal to -1 on an invalid
C  memory request (at least that's the plan under the new C code
C  extension library).  Therefore, I've made the change that should
C  test the appropriate condition.
C
      IF (MEMRET .LT. 0) THEN
C
C        ILLEGAL MEMORY REQUEST.
C
         LASTER = ILBLK
         RETURN
C
      END IF
C
C     UPDATE VOID TABLE.
C
      CALL XMVTABLE (LOC, MEMRET, VOID, LVOID, NVOIDS(1), CHRCOL,
     &   LASTER)
      IF (LASTER .NE. SUCESS) RETURN
C
      CALL XMDLOOK (MNGET, VOID, CHRCOL*LVOID, NVOIDS(1), VROW, LASTER)
C
      RETURN
      END
