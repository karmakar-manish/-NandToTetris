// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.


//store the values of R1 and R2 in 2 variables
@R0
D=M
@VAR1
M=D //var1 = RAM[0]

@R1
D=M
@VAR2
M=D ////var2 = RAM[1]

@SUM
M=0 //for storing the sum value


//while var1 > 0, continue the loop
(LOOP)  //lable declaration

@VAR1
D=M

@STOP
D;JEQ //if var1 == 0, jump to stop label

//now reduce the value of var1 by 1
@VAR1
M=M-1

//SUM = SUM + VAR2
@VAR2
D=M
@SUM
M=D+M //sum = sum + var2

//continue the loop
@LOOP
0;JEQ


(STOP)
//PUT R2=SUM
@SUM
D=M
@R2
M=D

//END OF PROGRAM
(END)
@END
0;JEQ




















