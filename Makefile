CC          =	gnatmake

# Flags that are sent to the compiler
CFLAGS      =	-Wall

# directory names here
BINDIR = bin/
SRCDIR = src/

#names of source code file in the lines below.  
SOURCE = $(SRCDIR)main.adb

#The names of the binary programs that will be produced.
PROGNAME = $(BINDIR)mainrunnable


default :
	$(CC) $(CFLAGS) $(SOURCE) -o $(PROGNAME)

clean:
	@ rm *.o
	@ rm *.ali
	
run:
	cd bin; ./mainrunnable
