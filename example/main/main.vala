//valac main.vala --pkg=sfml --vapidir=../../ -X -lcsfml-graphics

using sf;

void main()
{
    var window = new RenderWindow(VideoMode(200, 200), "SFML works!");
    var circle = new CircleShape();
	var rectangle = new RectangleShape(){
		size = {50, 50}
	};
	rectangle.setScale({1.0f, 3.2f});
    circle.setFillColor(Color.Green);
    circle.setRadius(100);

    while (window.isOpen())
    {
        Event event;
        while (window.pollEvent(out event))
        {
            if (event.type == EventType.Closed)
                window.close();
        }

        window.clear();
		window.draw(circle);
		window.draw(rectangle);
        window.display();
    }
}
