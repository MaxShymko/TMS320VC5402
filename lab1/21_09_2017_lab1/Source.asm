;
;

			.def _c_int00
			.text
_c_int00:
			ssbx 0,8
			ld #X, DP
			xor A,A
			xor B,B
			
			dld X,A
			ld Y,B 
			add B,A
			
			dst A,Z

			ssbx 1,8
			ld #X, DP
			xor A,A
			xor B,B
			
			dld X,A
			ld Y,B 
			add B,A
			
			dst A,Z
			
			rsbx 0,8
			ld #X, DP
			xor A,A
			xor B,B
			
			dld X,A
			ld Y,B 
			add B,A
			
			dst A,Z

			rsbx 1,8
			ld #X, DP
			xor A,A
			xor B,B
			
			dld X,A
			ld Y,B 
			add B,A
			
			dst A,Z
			
			nop
			nop
			nop

			.data
			
X:			.long 0xE345C678
Y:			.word 0x5724
Z:			.long 0
			
			.end