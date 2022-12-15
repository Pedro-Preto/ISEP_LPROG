all: compileFlex compileCode run

compileFlex: Ex5.flex
	flex -oEx5.c Ex5.flex

compileCode: Ex5.c
	gcc Ex5.c -o Program -lfl

run: Program TextFile.txt
	./Program < TextFile.txt

clean:
	rm -f *.o Ex5.c Program