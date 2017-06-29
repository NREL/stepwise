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
      LOGICAL FUNCTION QAOKCANCEL (ISOK)
C=======================================================================

C   --*** QAOKCANCEL *** (CAMCON_LIB) Initialize cancel function
C   --   Written by Amy Gilkey - revised 06/01/95
C   --
C   --QAOKCANCEL initializes the cancel flag.  It must be called before
C   --QACANCEL.

      IMPLICIT NONE

      LOGICAL QACANCEL
      LOGICAL ISOK

      LOGICAL EXCANCEL, LDUM

      LOGICAL DOABRT
      SAVE DOABRT
      LOGICAL DOMSG
      SAVE DOMSG

      DATA DOABRT / .FALSE. /

C   --Initialize enable cancel flag
      DOABRT = ISOK

      IF (DOABRT) THEN
C      --Initialize cancel flag
         LDUM = EXCANCEL (.TRUE.)
         DOMSG = .TRUE.
      END IF

      QAOKCANCEL = DOABRT

      RETURN

C=======================================================================
      ENTRY QACANCEL ()
C=======================================================================

C   --*** QACANCEL *** (CAMCON_LIB) Check cancel function
C   --   Written by Amy Gilkey - revised 06/01/95
C   --
C   --QACANCEL checks the cancel flag.  If it is set, it aborts the current
C   --processing.  In any case, the value of the cancel flag is returned
C   --as the function value.

      IF (DOABRT) THEN
C      --Return cancel flag
         QACANCEL = EXCANCEL (.FALSE.)

         IF (QACANCEL) THEN
            IF (DOMSG) THEN
C            --Send abort message and turn off print flag
               WRITE (*, '(1X, A)') '*** Processing aborted ***'
               DOMSG = .FALSE.
            END IF
         END IF

      ELSE
         QACANCEL = .FALSE.
      END IF

      RETURN
      END
