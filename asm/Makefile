SRCS = $(wildcard *.asm)
OBJS = $(SRCS:.asm=.o) 
EXES = $(SRCS:.asm=) 
LSTS = $(SRCS:.asm=.lis) 

all:$(EXES)

%: %.asm
	nasm -f elf $*.asm -l $*.lis -g
	ld -melf_i386 -o $* $*.o

clean:
	rm -f $(EXES) $(OBJS) $(LSTS)
