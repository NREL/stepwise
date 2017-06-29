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
      SUBROUTINE FFGETLIN (RETLIN)
C=======================================================================

C   --*** FFGETLIN *** (CAMCON_LIB) Return line read by free-field reader
C   --   Revised by Amy Gilkey - revised 02/27/93
C   --   Free-field reader taken from the SUPES library
C   --
C   --FFGETLIN returns the line read by the free-field reader.
C   --
C   --Parameters:
C   --   RETLIN - OUT char*(*) - the line read by the free-field reader

C   --Common Variables:
C   --   Uses SAVLIN of /FREEFIELD_COMMON/

      IMPLICIT NONE

C   --Common Variables:
      INCLUDE 'camlib_freefield_common.h'

C   --Parameter Definitions:
      CHARACTER*(*) RETLIN

************************************************************************

      RETLIN = SAVLIN

      RETURN
      END
