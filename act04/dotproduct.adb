-- ------------------------------------------------------------------
-- NAME: Elijah Morris
-- ASGT: Activity 4
-- ORGN: CSUB - CMPS 3500
-- FILE: dotproduct.adb
-- DATE: 3/7/2022
-- ------------------------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure dotproduct is 
    rows : constant := 5;
    columns : constant := 5; 
    type MATRIX is array(NATURAL range 1..rows, NATURAL range 1..columns) of INTEGER; 
    arr1 : MATRIX;
    arr2 : MATRIX;
    arr3 : MATRIX;

    row : NATURAL := 0;
    col : NATURAL := 0;
    value : INTEGER := 0;
    outf, inf : FILE_TYPE;

    procedure getMatrices is
    begin
        Open(inf, In_File, "adainput.in");
        for row in MATRIX'Range(1) loop
            for col in MATRIX'Range(2) loop
                Ada.Integer_Text_IO.Get(inf, value);
                arr1(row, col) := value;
            end loop;
        end loop;

            
        for row in MATRIX'Range(2) loop
            for col in MATRIX'Range(2) loop
                Ada.Integer_Text_IO.Get(inf, value);
                arr2(row, col) := value;
            end loop;
        end loop;

        Close(inf);

    end getMatrices; 
begin
    getMatrices;
    Create(outf, Out_File, "dotproduct.out");
    for row in MATRIX'Range(1) loop
        for col in MATRIX'Range(2) loop
            arr3(row, col) := arr1(row, col) * arr2(row, col);
        end loop;
    end loop;

    for row in MATRIX'Range(1) loop
        for col in MATRIX'Range(2) loop
            Ada.Integer_Text_IO.Put(outf, arr3(row, col), Width => 0);
            Put(outf, " ");
        end loop;
    end loop;
end dotproduct;