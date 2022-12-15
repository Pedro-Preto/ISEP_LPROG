all: compileBison compileFlex compileCode run

compileBison: Ex3.1.y
	bison -d Ex3.1.y

compileFlex: Ex3.1.flex
	flex -oEx3.1.c Ex3.1.flex

compileCode: Ex3.1.c
	gcc Ex3.1.tab.c Ex3.1.c -o Program -lfl

run:Program TextFile.txt
	./Program < TextFile.txt

clean:
	rm -f *.o Ex3.1.c Ex3.1.tab.c Ex3.1.tab.h lex.yy.h Program