;
;

			.def _c_int00
			.text
_c_int00:
			LD #X, DP
			SSBX SMX
			xor A,A
			dld X,A
			nop
			add Y,A
			dst A,Z

			LD #X, DP
			RSBX SMX
			xor A,A
			dld X,A
			nop
			add Y,A
			dst A,Z
			
			nop
			nop
			nop

			.data
			
X:			.long 0xE3451678
Y:			.word 0xA247
Z:			.long 0
			
			.end
