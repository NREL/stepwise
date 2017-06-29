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

C *** stp_PLOT_OPTIONS_COMMON.INC ***
      LOGICAL PLTDEV
C      --PLTDEV - true iff plots are to be plotted to devices
      LOGICAL PLTTXT
C      --PLTTXT - true iff plots are to be plotted to text file
      INTEGER IUNPLT
C      --IUNPLT - the unit number of the plot text file
      INTEGER NUMPLT
C      --NUMPLT - the number of plots written to the text file
      LOGICAL DOAID
C      --DOAID - true if QA aid should be plotted
      CHARACTER*80 QAAID
C      --QAAID - the QA aid
      LOGICAL SOFTCH(2)
C      --SOFTCH - true iff software characters to be used on device:
C      --   (1) = terminal, (2) = hardcopy
      INTEGER IXLINR, IYLINR
C      --XLINR - true if X axis is linear vs logarithmic
C      --YLINR - true if Y axis is linear vs logarithmic
      REAL XAXMIN, XAXMAX
C      --XAXMIN, XAXMAX - the X axis minimum and maximum (if XAXMIN<XAXMAX)
      REAL XAXTIC
C      --XAXTIC - the X axis tick interval (if <> 0)
      REAL YAXMIN, YAXMAX
C      --YAXMIN, YAXMAX - the Y axis minimum and maximum (if YAXMIN<YAXMAX)
      REAL YAXTIC
C      --YAXTIC - the Y axis tick interval (if <> 0)

      COMMON /PLTOPT/ PLTDEV, PLTTXT, IUNPLT, NUMPLT,
     &   DOAID, SOFTCH,
     &   IXLINR, IYLINR, XAXMIN, XAXMAX, XAXTIC, YAXMIN, YAXMAX, YAXTIC
      COMMON /PLTOPTc/ QAAID
C CMS REPLACEMENT HISTORY, Element STP_PLOT_OPTIONS_COMMON.INC
C *2    10-APR-1996 10:00:20 APGILKE "Add plot text file capability"
C *1     1-NOV-1995 11:24:41 APGILKE "Initial load - Source code"
C CMS REPLACEMENT HISTORY, Element STP_PLOT_OPTIONS_COMMON.INC
