		.mmregs
		.def	_c_int00	; ���������� ����������, ������������ ��������� �����
		.text			; �������� ������� ����
_c_int00:
CNT		.equ	1024
N		.equ	64
cA		.equ	32768/4		;0x2000
cS		.equ	32768/8		;0x1000

		stm	#Array, AR7;��������� ����� ������ ������� � AR7
		ld	#cS, A;��������� � A ��������� 0.25
		ld	#cA*4/N, B;��������� � B ������ 512

		st #CNT/N, AR3;���������� ���������� �������

period:				
		st	#N/4-1, BRC;���������� ����� �� ������������� ��������

		rptb	endbl1
		stl	A, *AR7+;��������� �������� � ������, �������������� �����
endbl1:		add	B, A;��������� ������

		st	#N/2-1, BRC

		rptb	endbl2
		stl	A, *AR7+
endbl2:		sub	B, A

		st	#N/4-1, BRC

		rptb	endbl3
		stl	A, *AR7+
endbl3:		add	B, A
			
		banz period, *AR3-

		nop
		nop
		nop

		.data
Array	.word	CNT*16

		.end
