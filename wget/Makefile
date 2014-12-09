CFLAGS = -maxerr=5 -maxwarn=5 -lunix
OBJECTS = w5300_o socket_o resolv_o http_client_o wget_o
wget: $(OBJECTS)
	ld -owget $(OBJECTS)
