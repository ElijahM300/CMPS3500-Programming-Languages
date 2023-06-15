C ********************************************************************
C NAME: Elijah Morris
C ASGT: Activity 2
C ORGN: CSUB - CMPS 3500
C FILE: arrayD.f
C DATE: 2/19/2022
C ********************************************************************
C DEFINE VARIABLE NAMES:
C     ARRAY: ARRAY OF NUMBERS
C ********************************************************************
C
      REAL ARRAY(5)
C
C READ IN ARRAY VALUES:
      PRINT *,   'ENTER 5 VALUES FOR AN ARRAY:'
      DO 18 I = 1,5
        READ(5,*) ARRAY(I)
18    CONTINUE
C
C
C 
C WRITE RESULTS:
      PRINT *,    'VALUES HAVE BEEN RECORDED, OUTPUTTING VALUES.'
      DO 26 I = 1,5
        WRITE(6,*) ARRAY(I)
26    CONTINUE
C
C
      END
