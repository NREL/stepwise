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

C *** camlib_FILES_COMMON.INC ***

C   --The following information is set and used by the File Definition
C   --Routines that get the program files from the command line.

      INTEGER MAXFIL
      PARAMETER (MAXFIL = 50)
C      --MAXFIL - the maximum number of command line arguments

      INTEGER NUMFIL
C      --NUMFIL - the current number of defined command line arguments
      INTEGER ICTFIL
C      --ICTFIL - the counter for the command line arguments in FILGTNAMS
      CHARACTER*80 DSCTBL(MAXFIL)
C      --DSCTBL - the description of each command line argument
      CHARACTER*1 INOTBL(MAXFIL)
C      --'I' for an input file
C      --'O' for an output file
C      --'U' for an input file that may be interactive
C      --'T' for a non-file entry (a text string entry)
      LOGICAL OPTTBL(MAXFIL)
C      --OPTTBL - the optional/required flag for each command line argument
      CHARACTER*128 FILTBL(MAXFIL)
C      --FILTBL - the default file name, replaced by the full path name
C      --   of each command line argument
      COMMON /XFILCOMMON/ NUMFIL, ICTFIL, OPTTBL
      COMMON /XFILCOMMONc/ DSCTBL, INOTBL, FILTBL
