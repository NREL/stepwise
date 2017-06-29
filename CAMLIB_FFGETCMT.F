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
      SUBROUTINE FFGETCMT (CMTNW, CONTNW)
C=======================================================================

C   --*** FFGETCMT *** (CAMCON_LIB) Get special characters for free-field reader
C   --   Revised by Amy Gilkey - revised 02/27/93
C   --   Free-field reader taken from the SUPES library
C   --
C   --FFGETCMT gets the comment and continuation characters recognized by
C   --the free-field reader.
C   --
C   --Parameters:
C   --   CMTNW - OUT char*1 - the comment character
C   --   CONTNW - OUT char*1 - the continuation character

C   --Common Variables:
C   --   Uses CMTCH, CONTCH of /FREEFIELD_COMMON/

      IMPLICIT NONE

C   --Common Variables:
      INCLUDE 'camlib_freefield_common.h'

C   --Parameter Definitions:
      CHARACTER CMTNW, CONTNW

************************************************************************

      CMTNW = CMTCH
      CONTNW = CONTCH

      RETURN
      END
