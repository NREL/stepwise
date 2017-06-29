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
      LOGICAL FUNCTION QABATCH ()
C=======================================================================

C   --*** QABATCH *** (CAMCON_LIB) Return batch versus interactive flag
C   --   Written by Amy Gilkey - revised 05/02/93
C   --
C   --QABATCH returns true if the program is in batch mode and false if it is
C   --in interactive mode.  A spawned process is treated as batch.
C
C   --Routines Called:
C   --   EXPARM - (CAMSUPES_LIB) Get batch vs. interactive flag

      IMPLICIT NONE

      INTEGER IMODE
      INTEGER IDUM
      CHARACTER CDUM8*8

      LOGICAL FIRST, SVBATC
      SAVE FIRST, SVBATC

      DATA FIRST / .TRUE. /

      IF (FIRST) THEN
         CALL EXPARM (CDUM8, CDUM8, IMODE, IDUM, IDUM, IDUM)
         SVBATC = (IMODE .NE. 1)
         FIRST = .FALSE.
      END IF

      QABATCH = SVBATC

      RETURN
      END
