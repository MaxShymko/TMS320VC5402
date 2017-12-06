		.mmregs
		.def	_c_int00	; Определяем переменную, определяющую стартовый адрес
		.text			; Начинаем сегмент кода
_c_int00:
CNT		.equ	1024
N		.equ	64
cA		.equ	32768/4		;0x2000
cS		.equ	32768/8		;0x1000

		stm	#Array, AR7;Загрузить адрес начала массива в AR7
		ld	#cS, A;Загрузить в A амплитуду 0.25
		ld	#cA*4/N, B;Загрузить в B дельту 512

		st #CNT/N, AR3;Количество повторений периода

period:				
		st	#N/4-1, BRC;Количество точек до максимального значения

		rptb	endbl1
		stl	A, *AR7+;Загружаем значения в массив, инкрементируем адрес
endbl1:		add	B, A;Добавляем дельту

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
