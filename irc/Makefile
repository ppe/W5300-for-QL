CFLAGS = -maxerr=5 -maxwarn=5 -lcurses
OBJECTS = w5300_o socket_o irc_o resolv_o
irc_bin: $(OBJECTS)
	ld -oirc_bin $(OBJECTS) -lcurses
irc_o: iinchip_conf_h resolv_h
