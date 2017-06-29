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
      SUBROUTINE EXOVERWR (OPTION, LINE)
C=======================================================================
C     FORTRAN Extension Library - UNIX

C   --*** EXOVERWR *** (CAMSUPES_LIB) Overwrite line
C   --   Written by Amy Gilkey - revised 06/01/95
C   --
C   --EXOVERWR writes over a line that has just been written to the standard
C   --output.
C   --
C   --Parameters:
C   --   OPTION - IN char*(*) - first character only, case unimportant:
C   --      ' ' = overwrite line
C   --      'INIT' = start line to be overwritten and overwrite line
C   --      'BLANK' = blank line which has been previously overwritten
C   --         (up to 128 characters) and overwrite line
C   --   LINE - IN char*(*) - the line to be written over the previous line

C   --Machine Dependencies:
C   --   Function LNBLNK (string length).
C   --   Machine-specific FORMAT.

      IMPLICIT NONE

C   --Parameter Definitions:
      CHARACTER*(*) OPTION
      CHARACTER*(*) LINE

      INTEGER LNBLNK

      INTEGER LSTR
      INTEGER IDUM
      CHARACTER OPT
      CHARACTER*128 BLANK

      INTEGER MAXLEN
      SAVE MAXLEN
      DATA MAXLEN /0/

C   --Get the option
      OPT = OPTION
      CALL XXUPPER (OPT, IDUM, LSTR)

      IF (OPT .EQ. 'I') THEN
C      --Start line
         MAXLEN = 0
         WRITE (*, *)

      ELSE IF (OPT .EQ. 'B') THEN
         IF (MAXLEN .GT. 0) THEN
C         --Overwrite previously written line with blanks
            BLANK = ' '
            WRITE (*, 10000, IOSTAT=IDUM) BLANK(1:MAXLEN)
            MAXLEN = 0
         END IF
      END IF

C   --Overwrite line
      LSTR = LNBLNK (LINE)
      IF (LSTR .GT. 0) THEN
         MAXLEN = MAX (MAXLEN, LSTR)
         WRITE (*, 10000, IOSTAT=IDUM) LINE(1:LSTR)
10000     FORMAT ('+', A)
      END IF

      RETURN
      END
