# SFML-VALA binding

vala binding of project SFML

[the documentation is here:](https://nda-cunh.gitlab.io/sfml-vala-binding/sfml/sf.html)

[https://nda-cunh.gitlab.io/sfml-vala-binding/sfml/sf.html](https://nda-cunh.gitlab.io/sfml-vala-binding/sfml/sf.html)

Example:

```vala
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
		window.draw(circle);
		window.display();
	}
}
```

<img src="readme/sfml.png">

simple flappy-bird in sfml-vala here:

https://gitlab.com/nda-cunh/flappyvala

<img src="readme/flappy.png">
