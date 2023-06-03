# SFML-VALA binding

vala binding of project SFML

Graphics:
- [X] Finish 
System:
- [ ] InputStream
- [X] Types
- [X] Vector2
- [X] Vector3

Window:
- [X] Finish 

Audio:
- [ ] Export
- [ ] Listener
- [ ] Music
- [ ] Sound
- [ ] SoundBuffer
- [ ] SoundBufferRecorder
- [ ] SoundRecorder
- [ ] SoundStatus
- [ ] SoundStream
- [ ] Types

Network:
    Not planned and useless in vala


Exemple:

```vala
using sf;

void main()
{
    var window = new RenderWindow({200,200}, "SFML works!");
    var circle = new CircleShape();
    circle.setFillColor({50,255,0});
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
        window.draw_circle(circle);
        window.display();
    }
}
```
