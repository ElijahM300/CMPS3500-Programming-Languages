C********************************************************************
C ORGN: CSUB - CMPS 3500
C FILE: circleinput.f
C DATE: 09/10/2021
C********************************************************************
C THIS PROGRAM CALCULATES THE CIRCUMFERENCE AND AREA OF A CIRCLE WITH
C RADIUS R.
C DEFINE VARIABLE NAMES:
C     R: RADIUS OF CIRCLE
C     PI: VALUE OF PI=3.14159
C     CIRCUM: CIRCUMFERENCE = 2*PI*R
C     AREA: AREA OF THE CIRCLE = PI*R*R
C ********************************************************************
C
      REAL R,CIRCUM,AREA
C
      PI = 3.14159
C CALCULATIONS:
      CIRCUM = 2.*PI*R
      AREA = PI*R*R
C
C WRITE RESULTS:
      WRITE(6,*)  '  FOR A CIRCLE OF RADIUS', R,
     +            '  THE CIRCUMFERENCE IS', CIRCUM,
     +            '  AND THE AREA IS ', AREA
C
      GO TO 100
C
      END
