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
      LOGICAL FUNCTION QAMEMERR (DOABRT)
C=======================================================================

C   --*** QAMEMERR *** (CAMCON_LIB) Check dynamic memory error
C   --   Written by Amy Gilkey - revised 02/27/93
C   --
C   --QAMEMERR returns .TRUE. if and only if there is a dynamic memory error.
C   --If there is an error, QAMEMERR prints an error message and calls QAABORT
C   --(if requested).
C   --
C   --QAMEMERR keeps track of the number of errors each time it is called.
C   --If the number of errors has not changed since the last error message
C   --was printed, no message is printed.
C   --
C   --Parameters:
C   --   DOABRT - IN logical - QAABORT is called when there is an error if
C   --      DOABRT is .TRUE.

      IMPLICIT NONE

C   --Parameter Definitions:
      LOGICAL DOABRT

      INTEGER NERR
      INTEGER MEM
      INTEGER NOVER

      INTEGER NUMERR
      SAVE NUMERR

      DATA NUMERR / 0 /

      CALL MDSTAT (NERR, MEM)

      QAMEMERR = (NERR .GT. 0)

      IF (QAMEMERR) THEN
         IF (NERR .NE. NUMERR) THEN
            CALL MDERPT (2, NOVER)
            IF (NERR .LE. NOVER) THEN
               CALL QAMESSAG (-1, '+FATAL',
     &            'Too much dynamic memory requested')
            ELSE
               CALL QAMESSAG (-1, '+PROGRAM',
     &            'Dynamic allocation problem')
            END IF
            NUMERR = NERR
         END IF
         IF (DOABRT) CALL QAABORT (' ')
      END IF

      RETURN
      END
