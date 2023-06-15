C********************************************************************
C NAME: Elijah Morris
C ASGT: Activity 2      
C ORGN: CSUB - CMPS 3500
C FILE: circleinputB.f
C DATE: 2/19/2022
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
C READ IN USER INPUT
      PI = 3.14159
      WRITE(6,*)  '  ENTER A VALUE FOR THE RADIUS: ' 
      READ(5,*)   R
      IF(R .EQ. -1) THEN
          GOTO 33
      ENDIF
C CALCULATIONS:
      CIRCUM = 2.*PI*R
      AREA = PI*R*R
C
C WRITE RESULTS:
      WRITE(*,*)  '  THE RADIUS IS', R,
     +            '  THE CIRCUMFERENCE IS', CIRCUM,
     +            '  AND THE AREA IS ', AREA
C
C
33    END
