// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.



//store the base address of Keyboard
@KBD
D=A

//N means the total number of RAM for screen ( row wise)
@n
M=D

//now find the total number of RAM (rows in the screen)
@SCREEN
D=A
@n
M=M-D

//use a variable PIXEL to point to the starting of SCREEN add
@SCREEN
D=A
@pixel
M=D


//label
(LOOP)
//move from the first RAM row of the SCREEN to the last
@i
M=0 //set i=0



//if the keyboard is pressed, then KBD RAM value will be > 0
@KBD
D=M

//if keyboard is pressed, goto label BLACK
@BLACK
D;JGT


//else make every RAM row white
(WHITE) //white label

//incase the last RAM row hasbeen reached, 
@i
D=M
@n  
D=D-M    //total number of RAM
//start the LOOP again
@LOOP
D;JEQ

//else make every RAM 0 (white)
@pixel
D=M
@i
//get the address of the RAM
A=D+M
M=0 //set as white (All pixel values white)

//go to next RAM
@i
M=M+1 //i++

//go to white label
@WHITE
0;JEQ


//code to make the screen black on key press
(BLACK)

//incase the last RAM row hasbeen reached, 
@i
D=M
@n  
D=D-M    //total number of RAM
//start the LOOP again
@LOOP
D;JEQ

//else make every RAM 0 (black)
@pixel
D=M
@i
//get the address of the RAM
A=D+M
M=-1 //set as black (All pixel values black)

//go to next RAM
@i
M=M+1 //i++

//go to white label
@BLACK
0;JEQ



//start the infinite loop again
@LOOP
0;JEQ

