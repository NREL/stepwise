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
      SUBROUTINE FILOPEN (IUNIT, INOUT, FORMT, INFILE, IERROR)
C=======================================================================

C   --*** FILOPEN *** (CAMCON_LIB) Open a file
C   --   Written by Amy Gilkey - revised 10/17/95
C   --
C   --FILOPEN opens an input or output file.  The file is rewound after open.
C   --
C   --Parameters:
C   --   IUNIT - IN integer - the file unit number
C   --   INOUT - IN char*(*) - the file status:
C   --      (only the first character is checked; case is unimportant)
C   --      'INPUT' for an input file (status = 'old')
C   --      'OUTPUT' for an output file (status = 'new')
C   --      'SCRATCH' for a scratch file (status = 'scratch')
C   --   FORMT - IN char*(*) - the file form:
C   --      (only the first character is checked; case is unimportant)
C   --      'FORMATTED' for a formatted file
C   --      'UNFORMATTED' for an unformatted file
C   --      'LISTING' for a formatted file with no FORTRAN carriage control
C   --   INFILE - IN char*(*) - the file name
C   --   IERROR - OUT integer - the returned OPEN error status; 0 if no error

      IMPLICIT NONE

C   --Parameter Definitions:
      INTEGER IUNIT
      CHARACTER*(*) INOUT
      CHARACTER*(*) FORMT
      CHARACTER*(*) INFILE
      INTEGER IERROR

      CHARACTER*1 XINOUT

C   --Change any UNKNOWN file to an OUTPUT file
      XINOUT = INOUT(1:1)
      IF ((XINOUT .EQ. 'U') .OR. (XINOUT .EQ. 'u')) XINOUT = 'O'

      CALL EXFOPEN (IUNIT, XINOUT, FORMT, INFILE, IERROR)

      RETURN
      END
