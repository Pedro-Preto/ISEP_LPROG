all: compileBison compileFlex compileCode run

compileBison: Ex2.y
	bison -d Ex2.y

compileFlex: Ex2.flex
	flex -oEx2.c Ex2.flex

compileCode: Ex2.c
	gcc Ex2.tab.c Ex2.c -o Program -lfl

run:Program TextFile.txt
	./Program < TextFile.txt

clean:
	rm -f *.o Ex2.c Ex2.tab.c Ex2.tab.h lex.yy.h Program