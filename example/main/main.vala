//valac main.vala --pkg=sfml-graphics --vapidir=./ -X -lcsfml-graphics

using sf;

void main()
{
    var window = new RenderWindow(VideoMode(200, 200), "SFML works!");
    var circle = new CircleShape();
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
        circle.draw(window);
        window.display();
    }
}
