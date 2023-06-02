# SFML-VALA binding

vala binding of project SFML

Graphics:
- [X] BlendMode.h
- [X] CircleShape.h
- [X] Color.h
- [X] ConvexShape.h
- [X] Export.h
- [X] Font.h
- [X] FontInfo.h
- [ ] Glsl.h
- [X] Glyph.h
- [X] Image.h
- [ ] PrimitiveType.h
- [X] Rect.h
- [X] RectangleShape.h
- [X] RenderStates.h
- [X] RenderTexture.h
- [X] RenderWindow.h
- [X] Shader.h
- [ ] Shape.h
- [X] Sprite.h
- [X] Text.h
- [X] Texture.h
- [X] Transform.h
- [ ] Transformable.h
- [X] Types.h
- [ ] Vertex.h
- [ ] VertexArray.h
- [ ] VertexBuffer.h
- [X] View.h


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
