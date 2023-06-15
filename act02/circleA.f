C ********************************************************************
C NAME: Elijah Morris
C ASGT: Activity 2
C ORGN: CSUB - CMPS 3500 
C FILE: circleA.f
C DATE: 2/19/2022
C ********************************************************************
C DEFINE VARIABLE NAMES:
C     R: RADIUS OF CIRCLE
C     PI: 3.14159
C     CIRCUM: CIRCUMFERENCE = 2*PI*R
C     AREA: AREA OF THE CIRCLE = PI*R*R
C ********************************************************************
C
      REAL R,CIRCUM,AREA
C
      PI = 3.14159
C
C SET VALUE OF R:
      R = 25
C
C CALCULATIONS:
      CIRCUM = 2.*PI*R
      AREA = PI*R*R
C
C WRITE RESULTS:
      WRITE(6,*)  '  FOR A CIRCLE OF RADIUS', R,
     +            '  THE CIRCUMFERENCE IS', CIRCUM,
     +            '  AND THE AREA IS ', AREA
C
      END
