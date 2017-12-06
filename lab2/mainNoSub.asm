		.mmregs
		.def	_c_int00
CNT		.equ	1024;Длина графика
N		.equ	64;Длина периода
cA		.equ	4;Амплитуда 1/4
dS		.equ	32768/4;Смещение относительно абсциссы
cS		.equ	dS+32768/8;Начальная точка
delta	.equ	32768*2/N;Дельта

		.text
_c_int00:
		stm	#Array, AR7;Загрузить адрес начала массива
		ld	#cS, A;Загрузить в A начальную точку

		st #CNT, AR3;Количество повторений
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
