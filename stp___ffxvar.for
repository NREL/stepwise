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
      SUBROUTINE FFXVAR (IFLD, INTYP, CFIELD, IFIELD,
     &   NUMVAR, VNAME, IXSEL, *)
C=======================================================================

C   --*** FFXVAR *** (ff) Parse variable number/name
C   --   Modified by Amy Gilkey - revised 07/11/94
C   --
C   --FFXVAR parses a variable number or name (which must be defined in
C   --VNAME.
C   --
C   --Parameters:
C   --   IFLD - IN/OUT - the index of the current field number, incremented
C   --   INTYP - IN - the input types from the free-field reader
C   --   CFIELD - IN - the character fields
C   --   IFIELD - IN - the integer fields
C   --   NUMVAR - IN - the number of variables
C   --   VNAME - IN - the variable names
C   --   IXSEL - IN - the index of the selected variable; 0 if bad
C   --   * - return statement if invalid variable; message is printed

      IMPLICIT NONE

      INTEGER IFLD
      INTEGER INTYP(*)
      CHARACTER*80 CFIELD(*)
      INTEGER IFIELD(*)
      INTEGER NUMVAR
      CHARACTER*(*) VNAME(*)
      INTEGER IXSEL

      LOGICAL FFNUMBER
      INTEGER ISTRFIND

      CHARACTER*12 WORD
      CHARACTER*128 TXTMSG

      IF (FFNUMBER (IFLD, INTYP)) THEN
         CALL FFINT (IFLD, INTYP, IFIELD,
     &      'variable index', 0, IXSEL, *100)
      ELSE
         CALL FFCHAR (IFLD, INTYP, CFIELD, ' ', WORD)
         IXSEL = ISTRFIND (WORD, NUMVAR, VNAME)
         IF (IXSEL .LE. 0) THEN
            TXTMSG = 'Unknown variable ' // WORD
            CALL QAMESSAG (-1, 'CMDERR', TXTMSG)
            GOTO 100
         END IF
      END IF

      RETURN

  100 CONTINUE
      RETURN 1
      END
C CMS REPLACEMENT HISTORY, Element STP___FFXVAR.FOR
C *1     1-NOV-1995 11:24:22 APGILKE "Initial load - Source code"
C CMS REPLACEMENT HISTORY, Element STP___FFXVAR.FOR
