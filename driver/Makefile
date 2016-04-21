CC = cc
CFLAGS = -c -O -regframe=a4
MAC = qmac
MACFLAGS = -nowinds
OBJS = w5300_rel resolv_rel parser_rel driver_rel w5300_o socket_o resolv_o w5300drv_o
RM = wdel
driver_bin: $(OBJS)
	ld -odriver_bin -malms -screspr_o $(OBJS)
_in:

_asm_rel:
	$(MAC) $C$*_asm $(MACFLAGS)
_c_o:
	$(CC) $(CFLAGS) $C$*_c
w5300_rel: w5300_asm w5300_in
resolv_rel: resolv_asm resolv_macros_in
parser_rel: parser_asm
driver_rel: driver_asm driver_in
resolv_o: resolv_c resolv_h
socket_o: socket_c socket_h types_h w5300_h
w5300_o: w5300_c w5300_h
w5300drv_o: w5300drv_c


