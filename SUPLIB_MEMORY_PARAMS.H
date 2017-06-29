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

C *** suplib_MEMORY_PARAMS.INC ***
C
C     Dynamic memory error vector and flags.
c     Changes in the error flags must be accompanied by changes
c     in the error format statement.
C
      INTEGER NERVEC
      INTEGER SUCESS, NOGET, NOINIT, REINIT, NONAME,
     &   BDNAME, BADLEN, BDTYPE, DFULL, VFULL, BFULL,
     &   BDVOID, BDBLK, ILBLK,
     &   BADCOD, BADNAM, DEFRON, WRTYPE
      PARAMETER (NERVEC=18)
      PARAMETER (SUCESS=1, NOGET=2, NOINIT=3, REINIT=4, NONAME=5,
     &   BDNAME=6, BADLEN=7, BDTYPE=8, DFULL=9, VFULL=10, BFULL=11,
     &   BDVOID=12, BDBLK=13, ILBLK=14,
     &   BADCOD=15, BADNAM=16, DEFRON=17, WRTYPE=18)
