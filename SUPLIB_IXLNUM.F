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

      INTEGER FUNCTION IXLNUM (NUMVAR)
C
************************************************************************
C
C     FORTRAN Extension Library - UNIX
C
C     DESCRIPTION:
C     This function returns the absolute location of a numeric variable.
C     This location must be measured in numeric storage units.
C
C     FORMAL PARAMETERS:
C     NUMVAR    INTEGER         Numeric Variable
C
C     INTRINSICS CALLED:
C     LOC       INTEGER         Address of a variable
C
************************************************************************
C
      IMPLICIT NONE

      INTEGER NUMVAR

      INTEGER ILOC

C   --Combining these two statements did not seem to work
      ILOC = LOC (NUMVAR)
      IXLNUM = ILOC / 4

      END
