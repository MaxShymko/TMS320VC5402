		.mmregs 
		.def _c_int00 
CNT 	.equ 512
cA 		.equ 2
cS 		.equ -32768/4
y2		.equ 0 ;(k-2)
y1 		.equ 767 ;(k-1)
b1_half	.equ 32758
		.text
_c_int00:
		stm #Array, AR7
		st #y2, AR2
		st #y1, AR1
		st AR2, *AR7+
		st AR1, *AR7+
		st #b1_half, T
		
		st #CNT-3, BRC
		rptb block1		
		mpy AR1, A
		sftl A, -15
		add A, A
		sub AR2, A
		mvmm AR1, AR2
		stl A, AR1
block1:	stl A, *AR7+
		
		ssbx SXM
		stm #Array, AR7
		st #CNT-1, BRC
		rptb block2
		ld *AR7, A
		sftl A, (cA/2)*(-1)
		add #cS, A
block2:	stl A, *AR7+
		
		nop
		nop
		nop
		
		.data
Array	.word CNT*16
		.end