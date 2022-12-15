all: compileBison compileFlex compileCode run

compileBison: ex.y
	bison -d ex.y

compileFlex: ex.flex
	flex -oex.c ex.flex

compileCode: ex.c
	gcc ex.tab.c ex.c -o Program -lfl

run: Program TextFile.txt
	./Program < TextFile.txt

clean:
	rm -f *.o ex.c ex.tab.c ex.tab.h lex.yy.h Program