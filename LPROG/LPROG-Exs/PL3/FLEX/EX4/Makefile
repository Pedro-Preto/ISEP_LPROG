all: compileFlex compileCode run

compileFlex: Ex4.flex
	flex -oEx4.c Ex4.flex

compileCode: Ex4.c
	gcc Ex4.c -o Program -lfl

run: Program TextFile.txt
	./Program < TextFile.txt

clean:
	rm -f *.o Ex4.c Program