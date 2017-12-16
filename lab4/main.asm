		.mmregs 
		.def _c_int00 
		.text
_c_int00:
CNT 	.equ 1024
N 		.equ 48
cA 		.equ 32768/8
cS 		.equ 24576
y1 		.equ 535
b1_half	.equ 32489

		ssbx OVM 
		rsbx SXM 
		stm #Array, AR7
		ld #0, B
		ld #y1, A
		st CNT/N, AR3 

m1: 	st #N-1, BRC 

		rptb endbl1 
		stl B, *AR7 
		ld A, B 
		st #b1_half, T 
		mac #b1_half, A
endbl1: sub *AR7+, A 
		banz m1, *AR3- 
		nop
		nop
		nop
		nop 
		nop 
		nop 
		nop 
		stm #Array, AR7
		st #CNT-1, BRC 

		rptb endbl2 
		ld *AR7, A 
		add #cS, A 
endbl2: stl A,*AR7+

		nop
		nop
		nop
		
		.data
Array	.word CNT*16
		
		.end