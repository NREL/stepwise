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
      LOGICAL FUNCTION QAHELP (PROG, TYPE, OPTION)
C=======================================================================

C   --*** QAHELP *** (CAMCON_LIB) Display HELP for a program
C   --   Written by Amy Gilkey - revised 06/01/95
C   --
C   --QAHELP displays help for a program in a system dependent fashion.
C   --
C   --It assumes that a help command has been established in CAMCON$HELP
C   --with an entry {PROG} {TYPE}.
C   --
C   --Parameters:
C   --   QAHELP - OUT logical - returns true iff the system has help for the
C   --      program
C   --   PROG - IN char*(*) - the program name; ' ' to use the program name
C   --      from QASETUP
C   --   TYPE - IN char*(*) - the HELP type (e.g., COMMANDS)
C   --   OPTION - IN char*(*) - the TYPE option (e.g., specific command)

C   --Common Variables:
C   --   Uses PROGRM of CAMCON_LIB common

      IMPLICIT NONE

C   --Common Variables:
      INCLUDE 'camlib_program_common.h'

      CHARACTER*(*) PROG
      CHARACTER*(*) TYPE
      CHARACTER*(*) OPTION

      LOGICAL EXHELP
      INTEGER ISTRLEN

      INTEGER LSTR
      INTEGER IDUM
      CHARACTER*16 QAPROG
      CHARACTER STR80*80

C   --Ensure the QA common is initialized
      CALL QA0INIT

      QAPROG = PROG
      IF (QAPROG .EQ. ' ') QAPROG = PROGRM

      STR80 = QAPROG//' '//TYPE//' '//OPTION
      CALL STRCMPRS (STR80, LSTR)

      QAHELP = EXHELP ('CAMCON$HELP', STR80(:LSTR))

      IF (.NOT. QAHELP) THEN
         WRITE (*, 10000, IOSTAT=IDUM)
     &      'Help for ', STR80(:ISTRLEN(STR80)), ' is not available'
      END IF

      RETURN

10000  FORMAT (/, 1X, 5A)
      END
