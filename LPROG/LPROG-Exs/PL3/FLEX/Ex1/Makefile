all: compileFlex compileCode run

compileFlex: Ex1.flex
	flex -oEx1.c Ex1.flex

compileCode: Ex1.c
	gcc Ex1.c -o Program -lfl

run: Program TextFile.txt
	./Program < TextFile.txt

clean:
	rm -f *.o Ex1.c Program