# bin2srec
A command line tool which converts binary files to s-record files.  

*The source code is from internet.* 

help: 
```
Syntax: BIN2SREC <options> INFILE > OUTFILE

-help            Show this help.
-b <begin>       Address to begin at in binary file (hex), default = 0.
-e <end>         Address to end at in binary file (hex), default = end of file.
-o <offset>      Generated address offset (hex), default = begin address.
-a <addrsize>    Number of bytes used for address (2-4),
                  default = minimum needed for maximum address.
-l <linelength>  Number of bytes per line (8-32), default = 32.
-s               Suppress header and footer records.
-q               Quiet mode - no output except S-Record.
```
  
example:
```makefile
BZ_DEV_FW    := $(soc_srctree)/output/out/fwprog/devfw
BIN2SREC_SRC := $(soc_srctree)/tools/bin2srec/bin2srec
BIN2SREC_DIR := $(soc_srctree)/output/tools/bin2srec
export BIN2SREC_DIR

bzbin:
    $(MAKE) -C $(BIN2SREC_SRC)
    @echo  '  Gen     sys.s19'
    @$(BIN2SREC_DIR)/bin2srec -q -s -o 10000000 -a 4 $(BZ_DEV_FW)/sys.devfw > $(BZ_DEV_FW)/s19/sys.s19
```
