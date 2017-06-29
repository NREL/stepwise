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
      SUBROUTINE EXSYMBOL (SYMNAM, SYMVAL, LENSYM)
C=======================================================================
C     FORTRAN Extension Library - UNIX 

C   --*** EXSYMBOL *** (CAMSUPES_LIB) Get system symbol
C   --   Written by Amy Gilkey - revised 09/22/94
C   --
C   --EXSYMBOL gets the value of a system symbol.
C   --
C   --Parameters:
C   --   SYMNAM - IN char*(*) - the symbol name
C   --   SYMVAL - OUT char*(*) - the returned symbol value
C   --   LENSYM - OUT integer - the length of the returned symbol value;
C   --      <0 if not defined.

C   --Machine Dependencies:
C   --   GETENV gets value of environment variable.
C   --   LNBLNK returns string length.

      IMPLICIT NONE

C   --Parameter Definitions:
      CHARACTER*(*) SYMNAM
      CHARACTER*(*) SYMVAL
      INTEGER LENSYM

      INTEGER LNBLNK

      CALL GETENV (SYMNAM, SYMVAL)
      LENSYM = LNBLNK (SYMVAL)
      IF (LENSYM .LE. 0) LENSYM = -1

      RETURN
      END
