ifeq ($(BIN2SREC_DIR),)
BIN2SREC_DIR = .
endif

SRCS=$(wildcard *.c)
OBJS=$(patsubst %.c,$(BIN2SREC_DIR)/%.o,$(SRCS))
CFLAGS=-Wall

bin2srec: $(OBJS)
	@echo "  LINK    $@"
	@cc -o $(BIN2SREC_DIR)/$@ $^ $(CFLAGS) 

$(BIN2SREC_DIR)/%.o: %.c
	@mkdir -p $(BIN2SREC_DIR)
	@echo "  CC      $@"
	@cc -c $< -o $@

clean:
	@rm -f $(BIN2SREC_DIR)/*.o
	@rm -f $(BIN2SREC_DIR)/bin2srec

