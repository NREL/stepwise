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

      SUBROUTINE XMCMEMY( MEMREQ, LOCBLK, MEMRTN, MAXSIZ )
      IMPLICIT NONE
      INTEGER MEMREQ
      INTEGER LOCBLK
      INTEGER MEMRTN
      INTEGER MAXSIZ
      INTEGER NUSED
      SAVE NUSED
      DATA NUSED /0/
C
************************************************************************
C
C     FORTRAN Extension Library - ANSI FORTRAN - USER INTERFACE ROUTINE
C
C     DESCRIPTION:
C     This routine requests the operating system to allocate or release
C     numeric storage. A postive MEMREQ indicates a request for memory,
C     while a negative MEMREQ indicates a release. All locations and
C     sizes are measured in numeric storage units.
C
C     In memory request mode, MEMRTN .LT. MEMREQ indicates an error.
C
C     In memory release mode, MEMRTN .LE. -MEMREQ. Furthermore, memory
C     must be released from the top down, i.e., LOCBLK must not change.
C
C     This version actually allocates storage from a static pool, whose
C     size is defined by the parameter MAXSIZ. If system dependent
C     support for the function IXLNUM is not implemented, the PARAMETER
C     and COMMON statements above must be duplicated in the caller.
C
C     FORMAL PARAMETERS:
C     MEMREQ    INTEGER         Number of numeric units
C     LOCBLK    INTEGER         Location of memory block
C     MEMRTN    INTEGER         Size of memory block at routine completion
C     MAXSIZ    INTEGER         Size of character memory - dimension in
C                               MDINIT.
C
C     SAVED VARIABLES:
C     NUSED     INTEGER         Number of units dynamically allocated
C
************************************************************************
C
      IF ( MEMREQ .GE. 0 ) THEN
C
C Allocate storage -
         LOCBLK = 1 + NUSED
         MEMRTN = MIN( MAXSIZ-NUSED , MEMREQ )
         NUSED = NUSED + MEMRTN
      ELSE
C
         MEMRTN = -MEMREQ
      END IF
C
      RETURN
      END
