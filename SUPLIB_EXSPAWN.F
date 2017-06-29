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
      SUBROUTINE EXSPAWN (DCLCMD, IERROR)
C=======================================================================
C     FORTRAN EXTENSION LIBRARY - UNIX

C   --*** EXSPAWN *** (CAMSUPES_LIB) Spawn a process
C   --   Written by Mike Williamson - 10/04/95
C   --   Revised by Amy Gilkey - revised 10/07/95
C   --
C   --EXSPAWN spawns a process which executes independently, then returns
C   --to this routine
C   --
C   --Parameters:
C   --   DCLCMD - IN char*(*) - the command line to spawn
C   --   IERROR - OUT integer - the error indicator
C   --       0 if no error
C   --       1 if error from process
C   --       2 if error from spawn

C   --Machine Dependencies:
C   --   Always returns IERROR = 2 (error from spawn).

      IMPLICIT NONE

C   --Parameter Definitions:
      CHARACTER*(*) DCLCMD
      INTEGER IERROR

      INTEGER SYSTEM

      INTEGER ISTAT

      ISTAT = SYSTEM (DCLCMD)
      IERROR = ISTAT

      RETURN
      END
