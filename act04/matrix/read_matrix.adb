-- ---------------------------------------------------------------------------
-- CMPS 3500
-- reads a 5x6 matrix of integers from an input file called mtest.in
-- and then prints the matrix in the screen
-- compile only:            $ gcc -c read_matrix.adb
-- compile and link:        $ gnatmake read_matrix.adb
-- execute:                 $ ./read_matrix
-- --------------------------------------------------------------------------


with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure read_matrix is
   MAX_ROW : constant := 7; -- Number of rows
   MAX_COL : constant := 7; -- Number of Columns
   N : INTEGER;

   type MATRIX is array(NATURAL range 1..MAX_ROW, NATURAL range 1..MAX_COL) of INTEGER;
   Inf : FILE_TYPE;
   m1 : MATRIX;
   m2 : MATRIX;
   m3 : MATRIX;

   procedure PopulateMatrix(Inf : in FILE_TYPE; Result : out MATRIX) is
   begin
      for Row in Integer range 1..MAX_ROW loop
        for Column in Integer range 1..MAX_COL loop
           Ada.Integer_Text_IO.Get(inf,N);
           Result(Row, Column) := N;
         end loop;
     end loop;
   end PopulateMatrix;

   procedure PrintMatrix(Input : in MATRIX) is
   begin
      for Row in MATRIX'Range(1) loop
       for Column in MATRIX'Range(2) loop
 	Ada.Integer_Text_IO.Put(Input(Row, Column));
       end loop;
       Put_Line("");
      end loop;
   end PrintMatrix;

begin
-- Read file into matrix
   Open(Inf, In_File, "m1.in");
   PopulateMatrix(Inf, m1);
   Close(Inf);

   Open(Inf, In_File, "m2.in");
   PopulateMatrix(Inf, m2);
   Close(Inf);

   Open(Inf, In_File, "m3.in");
   PopulateMatrix(Inf, m3);
   Close(Inf);
 --print matrix
   PrintMatrix(m1);
   Put_Line("");
   PrintMatrix(m2);
   Put_Line("");
   PrintMatrix(m3);

end read_matrix;
