C ********************************************************************
C NAME: Elijah Morris
C ASGT: Activity 2
C ORGN: CSUB - CMPS 3500
C FILE: reversearrayD.f
C DATE: 2/19/2022
C ********************************************************************
C DEFINE VARIABLE NAMES:
C     ARRAY: ARRAY OF NUMBERS
C ********************************************************************
C
      REAL ARRAY(5)
      INTEGER N
      N = 5
C
C READ IN ARRAY VALUES:
      PRINT *,   'ENTER 5 VALUES FOR AN ARRAY:'
      DO 20 I = 1,5
        READ(5,*) ARRAY(I)
20    CONTINUE
C
C
C 
C WRITE RESULTS:
      PRINT *,    'VALUES HAVE BEEN RECORDED, OUTPUTTING VALUES',
     + ' IN REVERSE.' 
      DO 30 I = 1,5
        WRITE(6,*) ARRAY(N)
        N = N - 1
30    CONTINUE
C
C
      END
