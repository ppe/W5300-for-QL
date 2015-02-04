MAC = qmac
MACFLAGS = -nowinds
driver: w5300_rel resolv_rel parser_rel
_in:

_asm_rel:
	$(MAC) $C$*_asm $(MACFLAGS)
w5300_rel: w5300_asm w5300_in
resolv_rel: resolv_asm resolv_macros_in
parser_rel: parser_asm
