CMD=vala -g --pkg=sfml --vapidir=./ -X -lcsfml-graphics

main:
	${CMD} example/main/main.vala

run: main 

run2:
	valac main.vala --pkg=sfml --vapidir=./ -X -lcsfml-graphics -C
