all: compileBison compileFlex compileCode run

compileBison: Ex1.y
	bison -d Ex1.y

compileFlex: Ex1.flex
	flex -oEx1.c Ex1.flex

compileCode: Ex1.c
	gcc Ex1.tab.c Ex1.c -o Program -lfl

run:Program TextFile.txt
	./Program < TextFile.txt

clean:
	rm -f *.o Ex1.c Ex1.tab.c Ex1.tab.h lex.yy.h Program