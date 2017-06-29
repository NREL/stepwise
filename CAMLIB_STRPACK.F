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

C=======================================================================
      SUBROUTINE STRPACK (STRING, LSTR)
C=======================================================================

C   --*** STRPACK *** (CAMCON_LIB) Remove all blanks from string
C   --   Written by Amy Gilkey - revised 03/26/93
C   --
C   --STRPACK left justifies a string and removes all embedded blanks.
C   --
C   --Parameters:
C   --   STRING - IN/OUT char*(*) - the string, returned packed, may be up
C   --      up to 132 characters long
C   --   LSTR - OUT integer - the length of the packed string
C
C   --Routines Called:
C   --   ISTRLEN - (CAMCON_LIB) Find string length

      IMPLICIT NONE

C   --Parameter Definitions:
      CHARACTER*(*) STRING
      INTEGER LSTR

C   --Definitions for functions called:
      INTEGER ISTRLEN

      INTEGER IBLK
      CHARACTER*128 TMPSTR

      LSTR = ISTRLEN (STRING)
      IF (LSTR .LE. 1) RETURN

      IBLK = INDEX (STRING, ' ')
  100 CONTINUE
      IF ((IBLK .GT. 0) .AND. (IBLK .LT. LSTR)) THEN
         TMPSTR = STRING(IBLK+1:LSTR)
         STRING(IBLK:LSTR) = TMPSTR
         LSTR = LSTR - 1
         IBLK = INDEX (STRING, ' ')
         GOTO 100
      END IF

      RETURN
      END
