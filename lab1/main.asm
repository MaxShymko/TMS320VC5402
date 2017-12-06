			.def _c_int00
			.text
_c_int00:
			LD #X, DP
			
			RSBX OVM
			RSBX SXM
			RSBX OVA
			xor A,A
			dld X,A
			nop
			add Y,A
			dst A,Z

			RSBX OVM
			SSBX SXM
			RSBX OVA
			xor A,A
			dld X,A
			nop
			add Y,A
			dst A,Z
			
			SSBX OVM
			RSBX SXM
			RSBX OVA
			xor A,A
			dld X,A
			nop
			add Y,A
			dst A,Z

			SSBX OVM
			SSBX SXM
			RSBX OVA
			xor A,A
			dld X,A
			nop
			add Y,A
			dst A,Z
			
			nop
			nop
			nop

			.data
			
X:			.long 0x4567C901 ; 1a
Y:			.word 0x7821 ; 1a
;X:			.long 0x45677901 ; 1b
;Y:			.word 0x9876 ; 1b
;X:			.long 0x80003456 ; 2
;Y:			.word 0xB762 ; 2
Z:			.long 0
			
			.end