// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


(LOOP)
	@KBD
	D=M
	
	@BLACK
	D;JNE
	@WHITE
	D;JEQ
	
(BLACK)
	@SCREEN
	D=A
	@addr
	M=D
	@8191
	D=A
	@i
	M=D
	
(INBLACK)
	@i
	D=M
	@LOOP
	D;JEQ
	
	@addr
	A=M
	M=-1 // set RAM[addr] to -1
	
	@i
	M=M-1
	
	@addr
	M=M+1
	
	@INBLACK
	0;JMP
	
(WHITE)
	@SCREEN
	D=A
	@addr
	M=D
	@8191
	D=A
	@i
	M=D
	
(INWHITE)
	@i
	D=M
	@LOOP
	D;JEQ
	
	@addr
	A=M
	M=1
	
	@i
	M=M-1
	
	@addr
	M=M+1
	
	@INWHITE
	0;JMP
	
	
	









