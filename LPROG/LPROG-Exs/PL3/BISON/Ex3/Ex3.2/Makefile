all: compileBison compileFlex compileCode run

compileBison: Ex3.2.y
	bison -d Ex3.2.y

compileFlex: Ex3.2.flex
	flex -oEx3.2.c Ex3.2.flex

compileCode: Ex3.2.c
	gcc Ex3.2.tab.c Ex3.2.c -o Program -lfl

run:Program TextFile.txt
	./Program < TextFile.txt

clean:
	rm -f *.o Ex3.2.c Ex3.2.tab.c Ex3.2.tab.h lex.yy.h Program