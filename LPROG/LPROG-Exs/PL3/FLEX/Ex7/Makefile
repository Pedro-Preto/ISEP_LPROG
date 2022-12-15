all: compileFlex compileCode run

compileFlex: Ex7.flex
	flex -oEx7.c Ex7.flex

compileCode: Ex7.c
	gcc Ex7.c -o Program -lfl

run: Program TextFile.txt
	./Program < TextFile.txt

clean:
	rm -f *.o Ex7.c Program