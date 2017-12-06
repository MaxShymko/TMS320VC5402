		.mmregs
		.def	_c_int00
CNT		.equ	1024;����� �������
N		.equ	64;����� �������
cA		.equ	4;��������� 1/4
dS		.equ	32768/4;�������� ������������ ��������
cS		.equ	dS+32768/8;��������� �����
delta	.equ	32768*2/N;������

		.text
_c_int00:
		stm	#Array, AR7;��������� ����� ������ �������
		ld	#cS, A;��������� � A ��������� �����

		st #CNT, AR3;���������� ����������
		SSBX SXM
		RSBX OVM	

period:
		add #delta, A
		stl A, tmp
		ld tmp, B
		abs B
		sub #dS, B
		sftl B, (cA/2-1)*(-1)
		nop
		nop
		stl	B, *AR7+
			
		banz period, *AR3-

		nop
		nop
		nop

		.data
Array	.word	CNT*16
tmp		.word	16

		.end
