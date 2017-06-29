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
      SUBROUTINE QAFETCH (TPROG, TVERS, TDATE, TRDAT, TRTIM,
     &   TAUTH, TSPON)
C=======================================================================

C   --*** QAFETCH *** (CAMCON_LIB) Return the program QA information
C   --   Written by Amy Gilkey - revised 09/04/98
C   --
C   --QAFETCH returns the program QA information.
C   --
C   --Routine QASETUP must be called to set up the CAMCON_LIB common before
C   --QAFETCH is called.
C   --
C   --Parameters:
C   --   TPROG - OUT char*(*) - the program name
C   --   TVERS - OUT char*(*) - the program version number
C   --   TDATE - OUT char*(*) - the program revision date (mm/dd/yyyy if
C   --      TDATE is 10 or 11 characters else mm/dd/yy)
C   --   TRDAT, TRTIM - OUT char*(*) - the program run date and time
C   --      (date in mm/dd/yyyy if TRDAT is 10 or 11 characters else mm/dd/yy;
C   --      time in hh:mm:ss)
C   --   TAUTH - OUT char*(*) - the program author
C   --   TSPON - OUT char*(*) - the program sponsor

C   --Common Variables:
C   --   Uses PROGRM, EXEVERS, EXEDAT, RUNDAT, RUNTIM, AUTHOR, SPONSR
C   --      of CAMCON_LIB common

      IMPLICIT NONE

C   --Common Variables:
      INCLUDE 'camlib_program_common.h'

C   --Parameter Definitions:
      CHARACTER*(*) TPROG, TVERS, TDATE, TRDAT, TRTIM, TAUTH, TSPON

C   --Ensure the QA common is initialized
      CALL QA0INIT

      TPROG = PROGRM
      TVERS = EXEVERS
      IF ((LEN (TDATE) .EQ. 10) .OR. (LEN (TDATE) .EQ. 11)) THEN
         TDATE = EXEDAT10
      ELSE
         TDATE = EXEDAT8
      END IF
      IF ((LEN (TRDAT) .EQ. 10) .OR. (LEN (TRDAT) .EQ. 11)) THEN
         TRDAT = RUNDAT10
      ELSE
         TRDAT = RUNDAT8
      END IF
      TRTIM = RUNTIM
      TAUTH = AUTHOR
      TSPON = SPONSR

      RETURN
      END
