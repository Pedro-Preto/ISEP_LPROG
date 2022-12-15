all: compileFlex compileCode run

compileFlex: Ex6.flex
	flex -oEx6.c Ex6.flex

compileCode: Ex6.c
	gcc Ex6.c -o Program -lfl

run: Program TextFile.txt
	./Program < TextFile.txt

clean:
	rm -f *.o Ex6.c Program