CFLAGS= -DNDEBUG -I../sparsehash/src -O3 -D_FILE_OFFSET_BITS=64
#CFLAGS= -g -I../sparsehash-read-only/src -D_FILE_OFFSET_BITS=64

CC = g++

.SUFFIXES: .o .cc

LIBS =

LINKFLAGS =

OBJS_c = allpairs.cc data-source-iterator.cc
OBJS_o = $(OBJS_c:.cc=.o)

ap: $(OBJS_c) $(OBJS_o) main.cc main.o
	$(CC) $(CFLAGS) $(LINKFLAGS) -o ap main.o $(OBJS_o) $(LIBS)

data-source-iterator.o: data-source-iterator.h

allpairs.o: allpairs.h

main.o: $(OBJS_o)

.cc.o:
	$(CC) $(CFLAGS) -c $<

clean:
	rm ap *.o
