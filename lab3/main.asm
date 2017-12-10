 		.mmregs
		.def	_c_int00	
CNT		.equ	512
N		.equ	512
cA		.equ	8
cS		.equ	-2
cD		.equ	32768/N*4

		.text			
_c_int00:
		SSBX SXM
		xor A, A
		
		stm	#Array, AR7
		st	#0x1, AR1
		st #CNT, AR3;
		st #0x0, AR2;		
period:
		RSBX OVM
		addm #0x1, AR2
		addm #cD, AR1
		ld AR1, 16, A
		SSBX OVM
		add A, A
		abs A
		ld AR2, B
		sub #N/2, B
		sftl A, (cA/2-1)*(-1)
		bc noInv, BLT
		neg A;
noInv:
		add #32768/cS, 16, A
		sth	A, *AR7+
		banz period, *AR3-
		
		nop
		nop
		nop

		.data
Array	.word	CNT*16
		.end
