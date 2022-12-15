all: compileFlex compileCode run

compileFlex: Ex3.flex
	flex -oEx3.c Ex3.flex

compileCode: Ex3.c
	gcc Ex3.c -o Program -lfl

run: Program TextFile.txt
	./Program < TextFile.txt

clean:
	rm -f *.o Ex3.c Program