#
# "make all" to build necessary executables.
#

uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')

LIBS=		`mysql_config --libs_r`

ifeq ($(uname_S),Linux)
	LIBS += -lrt
endif

INC=		-I. `mysql_config --include`

#DEFS=		-DDEBUG

CFLAGS=		-w -O2 -g

TRANSACTIONS=	neword.o payment.o ordstat.o delivery.o slev.o
OBJS=		main.o spt_proc.o driver.o support.o sequence.o rthist.o $(TRANSACTIONS) current_utc_time.o

.SUFFIXES:
.SUFFIXES: .o .c

.c.o:
	$(CC) $(CFLAGS) $(INC) $(DEFS) -c $*.c

all: ../tpcc_load ../tpcc_start

../tpcc_load : load.o support.o
	$(CC) load.o support.o $(LIBS) -o ../tpcc_load

../tpcc_start : $(OBJS)
	$(CC) $(OBJS) $(LIBS) -o ../tpcc_start

clean :
	rm -f *.o
