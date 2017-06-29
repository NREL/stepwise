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
      SUBROUTINE CHKUNILAB (IUNOUT, NLABEL, LABEL, NOTUNI)
C=======================================================================

C   --*** CHKUNILAB *** (STEPWISE) Check for unique data labels
C   --   Written by Amy Gilkey - revised 03/07/91
C   --
C   --CHKUNILAB checks that each data label is unique.  A warning is printed
C   --for each non-unique label.
C   --
C   --Parameters:
C   --   IUNOUT - IN - the output file unit number
C   --   NLABEL - IN - the number of labels
C   --   LABEL - IN - the data labels
C   --   NOTUNI - OUT - the number of non-unique labels

      IMPLICIT NONE

      INTEGER IUNOUT
      INTEGER NLABEL
      CHARACTER*8 LABEL(*)
      INTEGER NOTUNI

      INTEGER ISTRLEN

      INTEGER ILAB
      INTEGER I
      CHARACTER*8 LAB

      NOTUNI = 0
      DO 110 ILAB = 1, NLABEL
         LAB = LABEL(ILAB)
         DO 100 I = ILAB+1, NLABEL
            IF (LAB .EQ. LABEL(I)) THEN
               IF (NOTUNI .LE. 0) CALL QAMESSAG (IUNOUT, ' ', ' ')
               NOTUNI = NOTUNI + 1
               CALL QAMESSAG (IUNOUT, 'WARNING',
     &            'Label "' // LAB(:ISTRLEN(LAB)) // '" is not unique')
               GOTO 110
            END IF
  100    CONTINUE
  110 CONTINUE

      RETURN
      END
C CMS REPLACEMENT HISTORY, Element STP_CHKUNILAB.FOR
C *1     1-NOV-1995 11:24:01 APGILKE "Initial load - Source code"
C CMS REPLACEMENT HISTORY, Element STP_CHKUNILAB.FOR
