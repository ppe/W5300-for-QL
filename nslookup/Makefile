CFLAGS = -maxerr=5 -maxwarn=5 -lunix
OBJECTS = w5300_o socket_o nslookup_o
nslookup: $(OBJECTS)
	ld -onslookup $(OBJECTS)
nslookup_o: iinchip_conf_h nslookup_h
