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
      SUBROUTINE EXCPUS (CPUSEC)
C=======================================================================
C     FORTRAN Extension Library - UNIX

C   --*** EXCPUS *** (CAMSUPES_LIB) Get CPU time
C   --   Written by Dennis Morrison and Bill Mill-Curran - revised xx/xx/xx
C   --
C   --EXCPUS returns an accumulated CPU time.  The base time is undefined;
C   --only relative times are valid.
C   --
C   --Parameters:
C   --   CPUSEC - OUT real - the returned CPU time

C   --Machine Dependencies:
C   --   Calls ETIME for elapsed CPU time.

      IMPLICIT NONE

C   --Parameter Definitions:
      REAL CPUSEC

      REAL ETIME

      REAL RTIME, T, TIMARY(2)

      LOGICAL INIT
      REAL RTIME0
      SAVE INIT, RTIME0
      DATA INIT /.TRUE./

      IF (INIT) THEN
C      --Initialize timer first time in
         T = ETIME (TIMARY)
         RTIME0 = TIMARY(1)
         RTIME = 0.0
         INIT = .FALSE.
      ELSE
C      --Get CPU time and subtract initial time
         T = ETIME (TIMARY)
         RTIME = TIMARY(1) - RTIME0
      END IF

      CPUSEC = RTIME

      RETURN
      END
