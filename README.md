# SFML-VALA binding

vala binding of project SFML

Graphics:
- [X] Finish 

System:
- [X] Finish 

Window:
- [X] Finish 

Audio:
- [X] Finish 

Network:
    Not planned and useless in vala


Exemple:

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
        circle.draw(window);
        window.display();
    }
}
```
