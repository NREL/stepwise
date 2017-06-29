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
      SUBROUTINE FF0TKNK (KIN, KOUT, PROMPT,
     &   IOSTAT, IDCONT, LINE, SCRLIN, ILEFT, ISTOP,
     &   INTYPL, CFIELDL, IFIELDL, RFIELDL,
     &   INTYPC, CFIELDC, IFIELDC, RFIELDC)
C=======================================================================

C   --*** FF0TKNK *** (CAMCON_LIB internal) Get next free-field reader token
C   --   Revised by Amy Gilkey - revised 12/03/94
C   --   Free-field reader taken from the SUPES library
C   --
C   --FF0TKNK gets the next token from a free-field reader line.  If needed, a
C   --record will be read with FFRDLINE.
C   --
C   --Parameters:
C   --   KIN - IN - the unit from which to read input
C   --   KOUT - IN - the unit to which to echo input
C   --   PROMPT - IN - the prompt string
C   --   IDCONT - IN/OUT - the continuation flag:
C   --      -1 = at start, no line read
C   --       0 = no continuation of this line
C   --      +1 = this line is continued
C   --   IOSTAT - IN/OUT - the ANSI FORTRAN I/O status
C   --   LINE - IN/OUT - the input string
C   --   SCRLIN - IN/OUT - the processed input line
C   --   ILEFT - IN/OUT - the index of the first character to process
C   --      in the input line
C   --   ISTOP - IN/OUT - the index of the last character in the processed line
C   --   INTYPL, CFIELDL, IFIELDL, RFIELDL - OUT - information for LAST data
C   --      field; copied from input INTYPC, CFIELDC, IFIELDC, RFIELDC
C   --   INTYPC - IN/OUT - the translation states of the data field:
C   --    -999 = end of line
C   --      -1 = a null field
C   --       0 = a non-numeric field
C   --       1 = a REAL numeric field
C   --       2 = an INTEGER numeric field
C   --       3 = an equal sign field
C   --   CFIELDC - IN/OUT - the character values of the data field
C   --   IFIELDC - IN/OUT - the integer values of the data field
C   --   RFIELDC - IN/OUT - the floating-point values of the data field

C   --Common Variables:
C   --   Sets SAVLIN of /FREEFIELD_COMMON/

      IMPLICIT NONE

C   --Common Variables:
      INCLUDE 'camlib_freefield_common.h'

C   --Parameter Definitions:
      INTEGER KIN, KOUT
      CHARACTER*(*) PROMPT
      INTEGER IOSTAT
      INTEGER IDCONT
      CHARACTER*(*) LINE, SCRLIN
      INTEGER ILEFT
      INTEGER ISTOP
      INTEGER INTYPL, INTYPC
      CHARACTER*(*) CFIELDL, CFIELDC
      INTEGER IFIELDL, IFIELDC
      REAL RFIELDL, RFIELDC

      INTEGER LPRMPT
      CHARACTER*80 PRMPTT

************************************************************************

C   --Copy the old current field into the last field -
      INTYPL = INTYPC
      CFIELDL = CFIELDC
      IFIELDL = IFIELDC
      RFIELDL = RFIELDC

C   --Initialize current field to default value -
      INTYPC = -999
      CFIELDC = ' '
      IFIELDC = 0
      RFIELDC = 0.0

      IF ((ILEFT .GT. ISTOP) .AND. (IDCONT .NE. 0)
     &   .AND. (IOSTAT .EQ. 0)) THEN

C--Get the next input record via FFRDLINE and process the input line.

C      --Set prompt (changed for continuation line) -
         IF (IDCONT .LT. 0) THEN
            PRMPTT = PROMPT
            LPRMPT = LEN(PROMPT)
            IDCONT = 0
         ELSE
            PRMPTT = CONTCH // ' '
            LPRMPT = 2
         END IF

         ILEFT = 1
         ISTOP = 0

C      --Get the next input line -
         CALL FFRDLINE (KIN, KOUT, PRMPTT(:LPRMPT), LINE, IOSTAT)

C      --Return if I/O error or EOF detected -
         IF (IOSTAT .NE. 0) RETURN

C      --Process separators, etc. in input line -
         CALL FF0LIN (IDCONT, LINE, SCRLIN, ILEFT, ISTOP)
      END IF

C--Parse input fields until end of line.

      IF (ILEFT .LE. ISTOP) THEN
C      --Call FF0TKN to parse the next input field -
         CALL FF0TKN (LINE, SCRLIN, ILEFT, ISTOP, .TRUE.,
     &      .TRUE., INTYPC, CFIELDC, IFIELDC, RFIELDC)
      END IF

      RETURN
      END
