//valac main.vala --vapidir=../../ --pkg=csfml-graphics

using sf;

void main()
{
	var window = new Window(VideoMode(200, 200), "SFML works!");
	window.setTitle("test title");
	window.setPosition({0, 0});
	window.setVisible(true);
	window.setKeyRepeatEnabled(false);
	window.setFramerateLimit(60);
	window.setVerticalSyncEnabled(true);
	window.setMouseCursorVisible(false);
	window.setMouseCursorGrabbed(true);
	window.hasFocus();
	print ("%p\n", window.getSystemHandle());

	while (window.isOpen())
	{
		Event event;
		while (window.pollEvent(out event)) {
			if (event.type == EventType.Closed)
				window.close();
		}
	}
}

