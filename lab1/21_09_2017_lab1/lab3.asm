;
;

			.def _c_int00
			.text
_c_int00:
			LD #X, DP
			SSBX OVM
			xor A,A
			dld X,A
			nop
			ABS A
			dst A,Z
			
			LD #X, DP
			RSBX OVM
			xor A,A
			dld X,A
			nop
			ABS A
			dst A,Z
			
			LD #X, DP
			SSBX OVM
			xor A,A
			dld X,A
			nop
			NEG A
			dst A,Z
			
			LD #X, DP
			RSBX OVM
			xor A,A
			dld X,A
			nop
			NEG A
			dst A,Z

					
			nop
			nop
			nop

			.data
			
X:			.long 0x7ABC4567
;X:			.long 0x80000000
Z:			.long 0
			
			.end
