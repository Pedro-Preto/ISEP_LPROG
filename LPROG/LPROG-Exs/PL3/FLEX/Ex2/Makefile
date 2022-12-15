all: compileFlex compileCode run

compileFlex: Ex2.flex
	flex -oEx2.c Ex2.flex

compileCode: Ex2.c
	gcc Ex2.c -o Program -lfl

run: Program TextFile.txt
	./Program < TextFile.txt

clean:
	rm -f *.o Ex2.c Program