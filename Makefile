all: KarnEvil

KarnEvil: KarnEvil.c
	gcc -o KarnEvil KarnEvil.c

clean:
	rm -f KarnEvil
