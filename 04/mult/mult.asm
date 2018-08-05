// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

(LOOP)
	@R0
	D=M
	@END
	D;JEQ // if R0 == 0: goto end
	
	@R0
	M=M-1 // R0 -= 1
	
	@R1
	D=M
	@R2
	M=M+D // R2 += R1
	
	@LOOP 
	0;JMP // next iteration
	
(END)
	@END
	0;JMP