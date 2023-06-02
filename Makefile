
run:
	vala main.vala -g --pkg=sfml-graphics --vapidir=./ -X -fsanitize=address -X -lcsfml-graphics

run2:
	valac main.vala --pkg=sfml-graphics --vapidir=./ -X -lcsfml-graphics -C
