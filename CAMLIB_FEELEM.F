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
      SUBROUTINE FEELEM (NODE, NX, NY, NZ, IELEM)
C=======================================================================

C   --*** FEELEM *** (CAMCON_LIB) Calculate element number associated with node
C   --   Modified by Amy Gilkey - revised 01/12/96
C   --   Written by David Rudeen - 11/03/88
C   --
C   --FEELEM uses routines FEIJK and FENENUM to calculate the element number
C   --associated with the given node number.  Nodes and elements are assumed
C   --to be numbered first in order of increasing X (I-index), then
C   --Y (J-index), and then Z (K-index).
C   --
C   --Parameters:
C   --   NODE - IN integer - the node number of the first node and smallest node
C   --      number in the connectivity list for the element
C   --   NX, NY, NZ - IN integer - the number of nodes in the X,Y,Z (or I,J,K)
C   --      directions
C   --   IELEM - OUT integer - the corresponding element number

      IMPLICIT NONE

C   --Parameter Definitions:
      INTEGER NODE, NX, NY, NZ, IELEM

      INTEGER I, J, K

C   --Determine (i,j,k) for node
      CALL FEIJK (NODE, NX, NY, NZ, I, J, K)

C   --Determine element from (i,j,k)
      CALL FENENUM (I, J, K, 
     &   MAX (NX-1, 0), MAX (NY-1, 0), MAX (NZ-1, 0), IELEM)

      RETURN
      END
