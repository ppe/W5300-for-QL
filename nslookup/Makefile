CFLAGS = -maxerr=5 -maxwarn=5 -lunix
OBJECTS = w5300_o socket_o nslookup_o resolv_o
NTPDATE_OBJS = w5300_o socket_o resolv_o ntpdate_o
nslookup: $(OBJECTS)
	ld -onslookup $(OBJECTS)
nslookup_o: iinchip_conf_h nslookup_h resolv_h
ntpdate: $(NTPDATE_OBJS)
	ld -ontpdate $(NTPDATE_OBJS)
ntpdate_o: iinchip_conf_h resolv_h ntpdate_h
