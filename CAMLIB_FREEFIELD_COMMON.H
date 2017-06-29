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

C *** camlib_FREEFIELD_COMMON.INC ***

C   --These items pertain to the free-field reader routines:
      CHARACTER*256 SAVLIN
C   --   SAVLIN - the input line
      COMMON /XFFCOMMON/ SAVLIN

      CHARACTER CMTCH, CONTCH
C   --   CMTCH - the comment character
C   --   CONTCH - the continuation character
      PARAMETER (CMTCH = '!', CONTCH = '&')
