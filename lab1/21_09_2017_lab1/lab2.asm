;
;

			.def _c_int00
			.text
_c_int00:
			LD #X, DP
			SSBX SMX
			SSBX OVM
			xor A,A
			dld X,A
			nop
			add Y,A
			dst A,Z

			LD #X, DP
			RSBX SMX
			SSBX OVM
			xor A,A
			dld X,A
			nop
			add Y,A
			dst A,Z
			
			LD #X, DP
			SSBX SMX
			RSBX OVM
			xor A,A
			dld X,A
			nop
			add Y,A
			dst A,Z
			
			LD #X, DP
			RSBX SMX
			RSBX OVM
			xor A,A
			dld X,A
			nop
			add Y,A
			dst A,Z
			
			nop
			nop
			nop

			.data
			
X:			.long 0x7FFFA487
Y:			.word 0x98D4
Z:			.long 0
			
			.end
