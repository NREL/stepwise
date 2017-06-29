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
      LOGICAL FUNCTION EXCANCEL (RESET)
C=======================================================================
C     FORTRAN EXTENSION LIBRARY - UNIX

C   --*** EXCANCEL *** Cancel function
C   --   Written by Colin Selleck - revised 06/01/95
C   --
C   --EXCANCEL checks whether the cancel flag has been set and returns it.

C   --Machine Dependencies:
C   --   Always returns false.

      IMPLICIT NONE

      LOGICAL RESET

      EXCANCEL = .FALSE.

      RETURN
      END
