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
      LOGICAL FUNCTION EXHELP (HELPLIB, TOPIC)
C=======================================================================
C     FORTRAN Extension Library - UNIX

C   --*** EXHELP *** (CAMSUPES_LIB) Display HELP for a specific topic
C   --   Revised by Amy Gilkey - revised 05/18/95
C   --   Written by D. P. Flanagan, 12/18/83
C   --
C   --EXHELP displays help for a specific topic in a system dependent fashion.
C   --
C   --Parameters:
C   --   EXHELP - OUT logical - returns true iff help topic was found in
C   --      help library
C   --   HELPLIB - IN char*(*) - the HELP library name
C   --   TOPIC - IN char*(*) - the HELP topic

C   --Machine Dependencies:
C   --   Always returns false.

      IMPLICIT NONE

      CHARACTER*(*) HELPLIB
      CHARACTER*(*) TOPIC

      EXHELP = .FALSE.

      RETURN
      END
