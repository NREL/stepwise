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

C *** stp_TRANSFORM_COMMON.INC ***

      INTEGER MAXTRN, MXTDEF
      PARAMETER (MAXTRN = 100, MXTDEF = 500)

      INTEGER NUMTRN
C      --NUMTRN - the number of transformation variables
      INTEGER IXTDEF(0:MAXTRN)
C      --IXTDEF - the cumulative index of the transformation entries
      CHARACTER*8 NAMENT(MXTDEF)
C      --NAMENT - the transformation entry name
      CHARACTER*1 TYPENT(MXTDEF)
C      --TYPENT - the transformation entry type
C      --   (Constant, Variable, Operator, Function)
      INTEGER INXENT(MXTDEF)
C      --INXENT - the transformation entry index:
C      --   for Variable - the variable index
C      --   for Operator - the operator index
C      --   for Function - the function index
      REAL VALENT(MXTDEF)
C      --VALENT - the transformation entry value:
C      --   for Constant - the constant value
C      --   for Function - the number or parameters
      COMMON /TRNDEF/ NUMTRN, IXTDEF, INXENT, VALENT
      COMMON /TRNDEFc/ NAMENT, TYPENT
C CMS REPLACEMENT HISTORY, Element STP_TRANSFORM_COMMON.INC
C *1     1-NOV-1995 11:24:44 APGILKE "Initial load - Source code"
C CMS REPLACEMENT HISTORY, Element STP_TRANSFORM_COMMON.INC
