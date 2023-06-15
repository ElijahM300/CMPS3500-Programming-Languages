-- ------------------------------------------------------------------
-- NAME: Elijah Morris
-- ASGT: Activity 5
-- ORGN: CSUB - CMPS 3500
-- FILE: matrixops7.adb
-- DATE: 3/25/2022
-- ------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Directories; use Ada.Directories;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Long_Integer_Text_IO; use Ada.Long_Integer_Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Numerics.Real_Arrays; use Ada.Numerics.Real_Arrays;
with Ada.Long_Float_Text_IO; use Ada.Long_Float_Text_IO;

-- main procedure 
procedure matrixops7 is
    -- file variables
    Directory : String := ".";
    Pattern   : String := ""; -- empty pattern = all file names/subdirectory names
    Search    : Search_Type;
    Dir_Ent   : Directory_Entry_Type;
    smatch    : String := "in";
    inf, outf : FILE_TYPE;

    -- matrix variables
    rows : constant := 7;
    columns : constant := 7; 
    type MATRIX is array(NATURAL range 1..rows, NATURAL range 1..columns) of LONG_INTEGER; 
    m1 : MATRIX;
    m2 : MATRIX;
    m3 : MATRIX;

    row : NATURAL := 0;
    col : NATURAL := 0;
    col2 : NATURAL := 0;
    value : NATURAL := 0;
    detm1 : LONG_INTEGER;

    -- start of matrix ops
    -- function for adding two matrices
    function addition (m1, m2 : MATRIX) return MATRIX is 
    sumMatrix : MATRIX;
    begin
        for row in MATRIX'Range(1) loop
            for col in MATRIX'Range(2) loop
                sumMatrix(row, col) := m1(row, col) + m2(row, col);
            end loop;
        end loop;
        return sumMatrix;
    end addition;

    -- function for subtracting two matrices 
    function subtraction (m1, m2 : MATRIX) return MATRIX is 
    subMatrix : MATRIX;
    begin
        for row in MATRIX'Range(1) loop
            for col in MATRIX'Range(2) loop
                subMatrix(row, col) := m1(row, col) - m2(row, col);
            end loop;
        end loop;
        return subMatrix;
    end subtraction;

    -- function for multiplying two matrices
    function multiplication(m1, m2 : MATRIX) return MATRIX is 
    multMatrix : MATRIX;
    begin
        for row in MATRIX'Range(1) loop
            for col in MATRIX'Range(2) loop 
                multMatrix(row, col) := 0;
                for col2 in MATRIX'Range(2) loop
                    multMatrix(row, col) := multMatrix(row, col) + (m1(row, col2) * m2(col2, col));
                end loop;
            end loop;
        end loop;
        return multMatrix;
    end multiplication;

    -- function for multiplying a matrix by a scalar 
    function scalarMultiplication(m1 : MATRIX; value: LONG_INTEGER) return MATRIX is
    sclrMatrix : MATRIX;
    begin
        for row in MATRIX'Range(1) loop
            for col in MATRIX'Range(2) loop
                sclrMatrix(row,col) := (value * m1(row,col));
            end loop;
        end loop;
        return sclrMatrix;
    end scalarMultiplication;

    -- function for finding the transpose of a matrix 
    function transpose(m1 : MATRIX) return MATRIX is
    transMatrix : MATRIX; 
    begin 
        for row in MATRIX'Range(1) loop
            for col in MATRIX'Range(2) loop
                transMatrix(col, row) := m1(row, col);
            end loop;
        end loop; 
        return transMatrix;
    end transpose;

    function determinant(m1 : MATRIX; n : INTEGER) return LONG_INTEGER is
    i : INTEGER;
	aj : INTEGER;
	bj : INTEGER;
	k : LONG_INTEGER;
	d : LONG_INTEGER;
	l : LONG_INTEGER;
	sign : LONG_INTEGER;
	b : MATRIX;

	begin
	i := 2;
	sign := 1;
	l := 0;
	k := 1;
	if n = 2 then
		d := (m1(1,1) * m1(2,2)) - (m1(1,2) * m1(2,1));
		return d;
	end if;
		for k in 1..n loop
			aj := 1;
			bj := 1;
			for i in 2..n loop
			    bj := 1;
				    for aj in 1..n loop
						if aj = k then
							goto endofloop;
						end if;
							if bj = n then
								goto endofloop;
							end if;
							b(i-1, bj) := m1(i, aj);
							bj := bj + 1;
						<<endofloop>>
					end loop;
				end loop;
				l := l + (sign * m1(1, k) * Determinant(b, n-1));
				sign := sign * (-1);

		end loop;
		return l;
    end determinant;
    --end of matrix ops

    -- procedure for reading in a matrix from a file
    procedure read_matrix(file_name : in String) is
    N : LONG_INTEGER;
    Matrix_1 : MATRIX;
        -- assigns data to a matrix
        procedure PopulateMatrix(inf : in FILE_TYPE; Result : out MATRIX) is
        begin
            for row in MATRIX'Range(1) loop
                for col in MATRIX'Range(2) loop
                    Ada.Long_Integer_Text_IO.Get(inf,N);
                    Result(row, col) := N;
                end loop;
            end loop;
        end PopulateMatrix;
        -- stores the matrices in variables (file name has to be "m1.in", "m2.in", or "m3.in")
        procedure StoreMatrix(Input : in MATRIX) is
        begin
            for row in MATRIX'Range(1) loop
                for col in MATRIX'Range(2) loop
                    if(file_name = "m1.in") then
                        m1(row, col) := Input(row, col);
                    elsif(file_name = "m2.in") then
                        m2(row, col) := Input(row, col);
                    else 
                        m3(row, col) := Input(row, col);
                    end if;
                end loop;
            end loop;
        end StoreMatrix;
    begin
        -- Read a file into matrix
        Open(inf, In_File, file_name);
        PopulateMatrix(inf, Matrix_1);
        Close(inf);
        -- store matrix
        StoreMatrix(Matrix_1);
    end read_matrix;

    -- print matrix
    procedure print_matrix(m : in MATRIX) is
    begin
        for row in MATRIX'Range(1) loop
            for col in MATRIX'Range(2) loop
                Ada.Long_Integer_Text_IO.Put(m(row,col));
            end loop;
            Put_Line("");
        end loop;
        Put_Line("");
    end print_Matrix;

begin 
    Start_Search (Search, Directory, Pattern);
   --searchs each file in current folder
    while More_Entries (Search) loop
        Get_Next_Entry (Search, Dir_Ent);
	    if (Tail (Simple_Name (Dir_Ent), smatch'Length) = smatch) and then 
        (Simple_Name (Dir_Ent) /= "mtest.in") then
            read_matrix(Simple_Name (Dir_Ent)); 
        end if;
    end loop;
    End_Search (Search);

    -- print matrix ops
    Put_Line("Operations");
    Put_Line("****************");
    Put_Line("");

    Put_Line("m1 + m2:");
    Put_Line("");
    print_matrix(addition(m1, m2));
    Put_Line("");

    Put_Line("2*m2 + 3*m1 - 5*m3:");
    Put_Line("");
    print_matrix(subtraction(addition(scalarMultiplication(m2,2),scalarMultiplication(m1,3)),
    scalarMultiplication(m3,5)));
    Put_Line("");

    Put_Line("(m2)^6, right to left:");
    Put_Line("");
    print_matrix(multiplication(m2,multiplication(m2,multiplication(m2,multiplication(m2,multiplication(m2,m2))))));
    Put_Line("");

    Put_Line("m1 * m2:");
    Put_Line("");
    print_matrix(multiplication(m1,m2));
    Put_Line("");

    Put_Line("m2 * m1:");
    Put_Line("");
    print_matrix(multiplication(m2,m1));
    Put_Line("");

    Put_Line("The transpose of m1 is:");
    Put_Line("");
    print_matrix(transpose(m1));
    Put_Line("");

    Put_Line("The cofactor of m1:");

    Put_Line("");

    Put_Line("The determinant of m1:");
    Put_Line("");
    detm1 := determinant(m1, 7);
    Put_Line(Long_Integer'image(detm1));
    Put_Line("");
    
    Put_Line("The inverse of m1:");
    Put_Line("");

    Put_Line("m2 * inverse of m2:");
    Put_Line("");

    Put_Line("The inverse of m1*m2*m3:");
    Put_Line("");



end matrixops7;