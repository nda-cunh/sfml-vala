//valac main.vala --pkg=sfml-graphics --vapidir=./ -X -lcsfml-graphics
using sf;

void main()
{
	var window = new RenderWindow({200, 200}, "SFML works!"){
		title="abc",position={5,700}
	};
    var circle = new CircleShape();
    circle.setFillColor({50,255,0});
    circle.setRadius(100);
	circle.position = {0, 10};
	window.setSize({640, 480});

    while (window.isOpen())
    {
        Event event;
        while (window.pollEvent(out event))
        {
            if (event.type == EventType.Closed)
                window.close();
            if (event.type == EventType.KeyPressed)
			    if (event.key.code == sf.KeyCode.Up)
					print("keyup !\n");
        }

        window.clear();
        window.drawCircleShape(circle);
        window.display();
    }
}

