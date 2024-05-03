public sf.Vector2f Vector2f(float x, float y){
	return {x, y};
}

public sf.Vector2i Vector2i(int x, int y){
	return {x, y};
}

public sf.Vector2u Vector2u(uint x, uint y){
	return {x, y};
}

public sf.Vector3f Vector3f(float x, float y, float z){
	return {x, y, z};
}

public sf.VideoMode VideoMode(int width, int height){
	return {width, height};
}



[CCode (cheader_filename = "SFML/Graphics.h")]
namespace sf{
  
	/*******************************************************************************************\
	|*******************************************************************************************|
	|*****************                        [System]                        ******************|
	|*******************************************************************************************|
	|*******************************************************************************************|
	\*******************************************************************************************/

	[CCode (cname = "sfTime", cprefix = "sfTime_")]
	public class Time
	{
		[CCode (cname = "microseconds")]
		public int64 microseconds;

		public static Time Zero;

		public float asSeconds(Time time);
		public int32 asMilliseconds(Time time);
		public int64 asMicroseconds(Time time);

		[CCode (cname = "sfSeconds")]
		public static Time Seconds(float amount);
		[CCode (cname = "sfMilliseconds")]
		public static Time Milliseconds(int32 amount);
		[CCode (cname = "sfMicroseconds")]
		public static Time Microseconds(int64 amount);
	}

    /* ****************************  VECTOR2-3 Color rect  *************************************/

	[CCode (cname = "sfVector2i", cheader_filename = "SFML/System.h")]
    [SimpleType]
    public struct Vector2i
    {
        int x;
        int y;
    }
    [CCode (cname = "sfVector2u", cheader_filename = "SFML/System.h")]
    [SimpleType]
    public struct Vector2u
    {
        uint x;
        uint y;
    }
    [CCode (cname = "sfVector2f", cheader_filename = "SFML/System.h")]
    [SimpleType]
    public struct Vector2f
    {
        float x;
        float y;
    }
    [CCode (cname = "sfVector3f", cheader_filename = "SFML/System.h")]
    [SimpleType]
    public struct Vector3f
    {
        float x;
        float y;
        float z;
    }
    [CCode (cname = "sfColor", default_value ="{0,0,0,255}", cheader_filename = "SFML/Graphics.h")]
	[SimpleType]
    public struct Color
    {
		[CCode (cname = "sfColor_fromRGB")]
		public Color(uint8 red, uint8 green, uint8 blue);
		[CCode (cname = "sfColor_fromRGB")]
		public Color.from_RGB(uint8 red, uint8 green, uint8 blue);
		[CCode (cname = "sfColor_fromRGBA")]
		public Color.from_RGBA(uint8 red, uint8 green, uint8 blue, uint8 alpha);
		[CCode (cname = "sfBlack")]
		public const Color Black;       ///< White predefined color
		[CCode (cname = "sfWhite")]
		public const Color White;       ///< White predefined color
		[CCode (cname = "sfRed")]
		public const Color Red;         ///< Red predefined color
		[CCode (cname = "sfGreen")]
		public const Color Green;       ///< Green predefined color
		[CCode (cname = "sfBlue")]
		public const Color Blue;        ///< Blue predefined color
		[CCode (cname = "sfYellow")]
		public const Color Yellow;      ///< Yellow predefined color
		[CCode (cname = "sfMagenta")]
		public const Color Magenta;     ///< Magenta predefined color
		[CCode (cname = "sfCyan")]
		public const Color Cyan;        ///< Cyan predefined color
		[CCode (cname = "sfTransparent")]
		public const Color Transparent;
        uint8 r;
        uint8 g;
        uint8 b;
        uint8 a;
        
    }
	
    
	[CCode (cname = "sfFloatRect", has_type_id = false, cheader_filename = "SFML/Graphics.h")]
	[SimpleType]
    public struct FloatRect
    {
        public float left;
        public float top;
        public float width;
        public float height;

        [CCode (cname = "sfFloatRect_contains")]
        static bool static_contains (FloatRect *rect, float x, float y);
		[CCode (cname = "sfFloatRect_intersects")]
        static bool static_intersects (FloatRect *rect1, FloatRect *rect2, FloatRect? intersection = null);

		public bool contains (float x, float y) {
			return FloatRect.static_contains(&this, x, y);
		}
		public bool intersects (FloatRect rect, FloatRect? intersection = null) {
			return FloatRect.static_intersects(&this, &rect, intersection);
		}
    }
    [CCode (cname = "sfIntRect", has_type_id = false, cheader_filename = "SFML/Graphics.h")]
    [SimpleType]
    public struct IntRect
    {
        public int left;
        public int top;
        public int width;
        public int height;
        [CCode (cname = "sfIntRect_contains")]
        static bool static_contains(IntRect *rect, int x, int y);
        [CCode (cname = "sfIntRect_intersects")]
        static bool static_intersects(IntRect* rect1, IntRect* rect2, IntRect? intersection = null);

		public bool contains (int x, int y) {
			return IntRect.static_contains(&this, x, y);
		}
		public bool intersects (IntRect rect, IntRect? intersection = null) {
			return IntRect.static_intersects(&this, &rect, intersection);
		}
    }

	public delegate int64 InputStreamReadFunc(void* data, int64 size, void* userData);
	public delegate int64 InputStreamSeekFunc(int64 position, void* userData);
	public delegate int64 InputStreamTellFunc(void* userData);
	public delegate int64 InputStreamGetSizeFunc(void* userData);

	[CCode (cname = "sfInputStream")]
	public struct InputStream
	{
		InputStreamReadFunc    read;     ///< Function to read data from the stream
		InputStreamSeekFunc    seek;     ///< Function to set the current read position
		InputStreamTellFunc    tell;     ///< Function to get the current read position
		InputStreamGetSizeFunc getSize;  ///< Function to get the total number of bytes in the stream
		void*                    userData; ///< User data that will be passed to the callbacks
	}

	[CCode (cname = "sfPrimitiveType", cprefix = "sf")]
	public enum PrimitiveType
	{
		Points,        ///< List of individual points
		Lines,         ///< List of individual lines
		LineStrip,     ///< List of connected lines, a point uses the previous point to form a line
		Triangles,     ///< List of individual triangles
		TriangleStrip, ///< List of connected triangles, a point uses the two previous points to form a triangle
		TriangleFan,   ///< List of connected triangles, a point uses the common center and the previous point to form a triangle
		Quads,         ///< List of individual quads
	}

	/*******************************************************************************************\
	|*******************************************************************************************|
	|*****************                       [Graphics]                       ******************|
	|*******************************************************************************************|
	|*******************************************************************************************|
	\*******************************************************************************************/



    /* *****************************     TEXTURE     ************************************************/
	[CCode (cname = "sfTextureCoordinateType", cprefix = "sfTexture")]
	public enum TextureCoordinateType
	{
		Normalized, ///< sfTexture coordinates in range [0 .. 1].
		Pixels      ///< sfTexture coordinates in range [0 .. size].
	}

	[Compact]
	[Immutable]
    [CCode (cname="sfTexture", copy_function="sfTexture_copy", free_function = "sfTexture_destroy", cprefix="sfTexture_", cheader_filename = "SFML/Graphics.h")]
	public class Texture{
	    [CCode (cname = "sfTexture_copy")]
		Texture copy();

	    [CCode (cname = "sfTexture_create")]
	    public Texture(uint width, uint height);
	    [CCode (cname = "sfTexture_createFromFile")]
	    public Texture.fromFile(string filename, IntRect? area = null);
	    [CCode (cname = "sfTexture_createSrgbFromFile")]
	    public Texture.fromSrgvFromFile(string filename, IntRect? area = null);
	    [CCode (cname = "sfTexture_createFromMemory")]
	    public Texture.fromMemory(void* data, size_t sizeInBytes, IntRect? area = null);
		[CCode (cname = "sfTexture_createSrgbFromMemory")]
		public Texture.fromSrgbFromMemory(void* data, size_t sizeInBytes, IntRect? area = null);
	    [CCode (cname = "sfTexture_createFromStream")]
	    public Texture.fromStream(uint32? stream = null, IntRect? area = null);
		[CCode (cname = "sfTexture_createSrgbFromStream")]
	   	public Texture.fromSrgbFromStream(InputStream stream, IntRect area);
		[CCode (cname = "sfTexture_createFromImage")]
		public Texture.fromImage(Image image, IntRect? area = null);
		[CCode (cname = "sfTexture_createSrgbFromImage")]
		public Texture.fromSrgbFromImage(Image image, IntRect? area = null);
		
		public Vector2u size {
			[CCode (cname = "sfTexture_getSize")]
			get;
		} 
		
		Vector2u getSize();
		Image copyToImage();
		void updateFromPixels(uint8 []pixels, uint width, uint height, uint x, uint y);
		void updateFromTexture(Texture source, uint x, uint y);
		void updateFromImage(Image image, uint x, uint y);
		void updateFromWindow(Window window, uint x, uint y);
		void updateFromRenderWindow(RenderWindow renderWindow, uint x, uint y);
		void setSmooth(bool smooth);
		bool isSmooth();
		bool isSrgb();
		bool isRepeated();
		void setRepeated(bool repeated);
		bool generateMipmap();
		void swap(Texture with);
		uint getNativeHandle();
		void bind(TextureCoordinateType type);
		[CCode (cname = "sfTexture_getMaximumSize")]
		public static uint getMaximumSize();
	}
	
	[Compact]
	[CCode (cname = "sfTransformable", free_function = "sfTransformable_destroy", cprefix= "Transformable_", cheader_filename = "SFML/Graphics.h")]
	public class Transformable {
		[CCode (cname = "sfTransformable_create")]
		public Transformable();

		public Transformable copy();

		// Attribut
		public Vector2f position {
        	[CCode (cname = "sfTransformable_getPosition")]
			get;
        	[CCode (cname = "sfTransformable_setPosition")]
			set;
		}
		public Vector2f origin {
        	[CCode (cname = "sfTransformable_getOrigin")]
			get;
        	[CCode (cname = "sfTransformable_setOrigin")]
			set;
		}
		public float rotation {
        	[CCode (cname = "sfTransformable_getRotation")]
			get;
        	[CCode (cname = "sfTransformable_setRotation")]
			set;
		}
		public Vector2f scale {
        	[CCode (cname = "sfTransformable_getScale")]
			get;
        	[CCode (cname = "sfTransformable_setScale")]
			set;
		}

		public void destroy();
		public void setPosition(Vector2f position);
		public void setRotation(float angle);
		public void setScale(Vector2f scale);
		public void setOrigin(Vector2f origin);
		public Vector2f getPosition();
		public float getRotation();
		public Vector2f getScale();
		public Vector2f getOrigin();
		public void move(Vector2f offset);
		public void rotate(float angle);
		public void scaling(Vector2f factors);
		public Transform getTransform();
		public Transform getInverseTransform();
	}


	[Compact]
	[CCode (cname = "sfCircleShape", free_function = "sfCircleShape_destroy", cheader_filename = "SFML/Graphics.h")]
	public class CircleShape{
	    [CCode (cname = "sfCircleShape_create")]
	    public CircleShape();
        [CCode (cname = "sfCircleShape_copy")]
        public CircleShape copy(CircleShape shape);

		public Vector2f position {
        	[CCode (cname = "sfCircleShape_getPosition")]
			get;
        	[CCode (cname = "sfCircleShape_setPosition")]
			set;
		}
		public Vector2f origin {
        	[CCode (cname = "sfCircleShape_getOrigin")]
			get;
        	[CCode (cname = "sfCircleShape_setOrigin")]
			set;
		}
		public float rotation {
        	[CCode (cname = "sfCircleShape_getRotation")]
			get;
        	[CCode (cname = "sfCircleShape_setRotation")]
			set;
		}
		public Vector2f scale {
        	[CCode (cname = "sfCircleShape_getScale")]
			get;
        	[CCode (cname = "sfCircleShape_setScale")]
			set;
		}
		public IntRect textureRect {
        	[CCode (cname = "sfCircleShape_getTextureRect")]
			get;
        	[CCode (cname = "sfCircleShape_setTextureRect")]
			set;
		}

		public Color fillColor {
			[CCode (cname = "sfCircleShape_getFillColor")]
			get;
			[CCode (cname = "sfCircleShape_setFillColor")]
			set;
		}
		public Color outlineColor {
			[CCode (cname = "sfCircleShape_getOutlineColor")]
			get;
			[CCode (cname = "sfCircleShape_setOutlineColor")]
			set;
		}
		public float outlineThickness {
			[CCode (cname = "sfCircleShape_getOutlineThickness")]
			get;
			[CCode (cname = "sfCircleShape_setOutlineThickness")]
			set;
		}
		public float radius {
			[CCode (cname = "sfCircleShape_getRadius")]
			get;
			[CCode (cname = "sfCircleShape_setRadius")]
			set;
		}
		public FloatRect localBounds {
			[CCode (cname = "sfCircleShape_getLocalBounds")]
			get;
			[CCode (cname = "sfCircleShape_setLocalBounds")]
			set;
		}

		[CCode (cname = "sfRenderWindow_drawCircleShape", instance_pos = 1.2)]
		public void draw(RenderWindow window, RenderStates? state = null);
		
		[CCode (cname = "sfCircleShape_setPosition")]
        public void setPosition(Vector2f position);
        [CCode (cname = "sfCircleShape_setRotation")]
        public void setRotation(float angle);
        [CCode (cname = "sfCircleShape_setScale")]
        public void setScale(Vector2f scale);
        [CCode (cname = "sfCircleShape_setOrigin")]
        public void setOrigin(Vector2f origin);
        [CCode (cname = "sfCircleShape_getPosition")]
        public Vector2f getPosition();
        [CCode (cname = "sfCircleShape_getRotation")]
        public float getRotation();
        [CCode (cname = "sfCircleShape_getScale")]
        public Vector2f getScale();
        [CCode (cname = "sfCircleShape_getOrigin")]
        public Vector2f getOrigin();
        [CCode (cname = "sfCircleShape_move")]
        public void move(Vector2f offset);
        [CCode (cname = "sfCircleShape_rotate")]
        public void rotate(float angle);
        [CCode (cname = "sfCircleShape_scale")]
        public void scaling(Vector2f factors);
        [CCode (cname = "sfCircleShape_getTransform")]
        public Transform sfCircleShape_getTransform();
        [CCode (cname = "sfCircleShape_getInverseTransform")]
        public Transform sfCircleShape_getInverseTransform();
        [CCode (cname = "sfCircleShape_getTexture")]
        public void setTexture(Texture texture, bool resetRect);
        [CCode (cname = "sfCircleShape_setTextureRect")]
        public void setTextureRect(IntRect rect);
        [CCode (cname = "sfCircleShape_setFillColor")]
        public void setFillColor(Color color);
        [CCode (cname = "sfCircleShape_setOutlineColor")]
        public void setOutlineColor(Color color);
        [CCode (cname = "sfCircleShape_setOutlineThickness")]
        public void setOutlineThickness(float thickness);
        [CCode (cname = "sfCircleShape_getTexture")]
        public unowned Texture getTexture();
        [CCode (cname = "sfCircleShape_getTextureRect")]
        public IntRect getTextureRect();
        [CCode (cname = "sfCircleShape_getFillColor")]
        public Color getFillColor();
        [CCode (cname = "sfCircleShape_getOutlineColor")]
        public Color getOutlineColor();
        [CCode (cname = "sfCircleShape_getOutlineThickness")]
        public float getOutlineThickness();
        [CCode (cname = "sfCircleShape_getPointCount")]
        public size_t getPointCount();
        [CCode (cname = "sfCircleShape_getPoint")]
        public Vector2f getPoint(size_t index);
        [CCode (cname = "sfCircleShape_setRadius")]
        public void setRadius(float radius);
        [CCode (cname = "sfCircleShape_getRadius")]
        public float getRadius();
        [CCode (cname = "sfCircleShape_setPointCount")]
        public void setPointCount(size_t count);
        [CCode (cname = "sfCircleShape_getLocalBounds")]
        public FloatRect getLocalBounds();
        [CCode (cname = "sfCircleShape_getGlobalBounds")]
        public FloatRect getGlobalBounds();
    }

	[Compact]
	[CCode (cname = "sfConvexShape", free_function = "sfConvexShape_destroy", cprefix = "sfConvexShape_")]
	public class ConvexShape{
		[CCode (cname = "sfConvexShape_create")]
		public ConvexShape();
		
		public ConvexShape copy();
		
		// Attribut 
		public Vector2f size{
			[CCode (cname = "sfSConvexShape_getSize")]
			get;
			[CCode (cname = "sfSConvexShape_setSize")]
			set;
		}
		public Vector2f position{
			[CCode (cname = "sfSConvexShape_getPosition")]
			get;
			[CCode (cname = "sfSConvexShape_setPosition")]
			set;
		}
		public float rotation{
			[CCode (cname = "sfSConvexShape_getRotation")]
			get;
			[CCode (cname = "sfSConvexShape_setRotation")]
			set;
		}
		public Vector2f scale{
			[CCode (cname = "sfSConvexShape_getScale")]
			get;
			[CCode (cname = "sfSConvexShape_setScale")]
			set;
		}
		public Vector2f origin{
			[CCode (cname = "sfSConvexShape_getOrigin")]
			get;
			[CCode (cname = "sfSConvexShape_setOrigin")]
			set;
		}
		public IntRect textureRect{
			[CCode (cname = "sfSConvexShape_getTextureRect")]
			get;
			[CCode (cname = "sfSConvexShape_setTextureRect")]
			set;
		}
		public Color color{
			[CCode (cname = "sfSConvexShape_getColor")]
			get;
			[CCode (cname = "sfSConvexShape_setColor")]
			set;
		}
		public FloatRect localBounds{
			[CCode (cname = "sfSConvexShape_getLocalBounds")]
			get;
			[CCode (cname = "sfSConvexShape_setLocalBounds")]
			set;
		}
		public FloatRect globalBounds{
			[CCode (cname = "sfSConvexShape_getGlobalBounds")]
			get;
			[CCode (cname = "sfSConvexShape_setGlobalBounds")]
			set;
		}

		[CCode (cname = "sfRenderWindow_drawConvexShape", instance_pos = 1.2)]
		public void draw(RenderWindow window, RenderStates? state = null);

		public void setPosition(Vector2f position);
		public void setRotation(float angle);
		public void setScale(Vector2f scale);
		public void setOrigin(Vector2f origin);
		public Vector2f getPosition();
		public float getRotation();
		public Vector2f getScale();
		public Vector2f getOrigin();
		public void move(Vector2f offset);
		public void rotate(float angle);
		public void scaling(Vector2f factors);
		public Transform getTransform();
		public Transform getInverseTransform();
		public void setTexture(Texture texture, bool resetRect);
		public void setTextureRect(IntRect rect);
		public void setFillColor(Color color);
		public void setOutlineColor(Color color);
		public void setOutlineThickness(float thickness);
		public unowned Texture getTexture();
		public IntRect getTextureRect();
		public Color getFillColor();
		public Color getOutlineColor();
		public float getOutlineThickness();
		public size_t getPointCount();
		public Vector2f getPoint(size_t index);
		public void setPointCount(size_t count);
		public void setPoint(size_t index, Vector2f point);
		public FloatRect getLocalBounds();
		public FloatRect getGlobalBounds();
	}


	[Compact]
	[CCode (cname = "sfView", free_function = "sfView_destroy", cprefix = "sfView_")]
	public class View {
		[CCode (cname = "sfView_create")]
		public View();
		[CCode (cname = "sfView_createFromRect")]
		public View.fromRect(FloatRect rectangle);
		View copy();
		
		void setCenter(Vector2f center);
		void setSize(Vector2f size);
		void setRotation(float angle);
		void setViewport(FloatRect viewport);
		void reset(FloatRect rectangle);
		Vector2f getCenter();
		Vector2f getSize();
		float getRotation();
		FloatRect getViewport();
		void move(Vector2f offset);
		void rotate(float angle);
		void zoom(float factor);
	}

	[Compact]
	[CCode (cname = "sfRenderTexture", free_function = "sfRenderTexture_destroy", cprefix = "sfRenderTexture_")]
	public class RenderTexture {
	[CCode (cname = "sfRenderTexture_create")]
	public RenderTexture(uint width, uint height, bool depthBuffer);
	[CCode (cname = "sfRenderTexture_createWithSettings")]
	public RenderTexture.withSettings(uint width, uint height, ContextSettings settings);

		Vector2u getSize();
		bool setActive(bool active);
		void display();
		void clear(Color color);
		void setView(View view);
		unowned View getView();
		unowned View getDefaultView();
		IntRect getViewport(View view);
		Vector2f mapPixelToCoords(Vector2i point, View view);
		Vector2i mapCoordsToPixel(Vector2f point, View view);
		void drawSprite(Sprite object, RenderStates states);
		void drawText(Text object, RenderStates states);
		void drawShape(Shape object, RenderStates states);
		void drawCircleShape(CircleShape object, RenderStates states);
		void drawConvexShape(ConvexShape object, RenderStates states);
		void drawVertexArray(VertexArray object, RenderStates states);
		void drawVertexBuffer(VertexBuffer object, RenderStates states);
		void drawVertexBufferRange(VertexBuffer object, size_t firstVertex, size_t vertexCount, RenderStates states);
		void drawPrimitives(Vertex vertices, size_t vertexCount,PrimitiveType type, RenderStates states);
		void pushGLStates();
		void popGLStates();
		void resetGLStates();
		unowned Texture getTexture();
		uint getMaximumAntialiasingLevel();
		void setSmooth(bool smooth);
		bool isSmooth();
		void setRepeated(bool repeated);
		bool isRepeated();
		bool generateMipmap();
	}



	/* *****************************     RECTANGLESHAPE     ************************************************/
	[Compact]
	[CCode (free_function = "sfRectangleShape_destroy", cheader_filename = "SFML/Graphics.h")]
	public class RectangleShape{
	    [CCode (destroy_function = "sfRectangleShape_destroy", cname = "sfRectangleShape_create")]
	    public RectangleShape();
        [CCode (cname = "sfRectangleShape_copy")]
        public RectangleShape* copy();

		// Attribut 
		public Vector2f size{
			[CCode (cname = "sfRectangleShape_getSize")]
			get;
			[CCode (cname = "sfRectangleShape_setSize")]
			set;
		}
		public Vector2f position{
			[CCode (cname = "sfRectangleShape_getPosition")]
			get;
			[CCode (cname = "sfRectangleShape_setPosition")]
			set;
		}
		public float rotation{
			[CCode (cname = "sfRectangleShape_getRotation")]
			get;
			[CCode (cname = "sfRectangleShape_setRotation")]
			set;
		}
		public Vector2f scale{
			[CCode (cname = "sfRectangleShape_getScale")]
			get;
			[CCode (cname = "sfRectangleShape_setScale")]
			set;
		}
		public Vector2f origin{
			[CCode (cname = "sfRectangleShape_getOrigin")]
			get;
			[CCode (cname = "sfRectangleShape_setOrigin")]
			set;
		}
		public IntRect textureRect{
			[CCode (cname = "sfRectangleShape_getTextureRect")]
			get;
			[CCode (cname = "sfRectangleShape_setTextureRect")]
			set;
		}
		public Color color{
			[CCode (cname = "sfRectangleShape_getFillColor")]
			get;
			[CCode (cname = "sfRectangleShape_setFillColor")]
			set;
		}
		public FloatRect localBounds{
			[CCode (cname = "sfRectangleShape_getLocalBounds")]
			get;
			[CCode (cname = "sfRectangleShape_setLocalBounds")]
			set;
		}
		public FloatRect globalBounds{
			[CCode (cname = "sfRectangleShape_getGlobalBounds")]
			get;
			[CCode (cname = "sfRectangleShape_setGlobalBounds")]
			set;
		}

		[CCode (cname = "sfRenderWindow_drawRectangleShape", instance_pos = 1.2)]
		public void draw(RenderWindow window, RenderStates? state = null);
        
		[CCode (cname = "sfRectangleShape_setPosition")]
        public void setPosition(Vector2f position);
        [CCode (cname = "sfRectangleShape_setRotation")]
        public void setRotation(float angle);
        [CCode (cname = "sfRectangleShape_setScale")]
        public void setScale(Vector2f scale);
        [CCode (cname = "sfRectangleShape_setOrigin")]
        public void setOrigin(Vector2f origin);
        [CCode (cname = "sfRectangleShape_getPosition")]
        public Vector2f getPosition();
        [CCode (cname = "sfRectangleShape_getRotation")]
        public float getRotation();
        [CCode (cname = "sfRectangleShape_getScale")]
        public Vector2f getScale();
        [CCode (cname = "sfRectangleShape_getOrigin")]
        public Vector2f getOrigin();
        [CCode (cname = "sfRectangleShape_move")]
        public void move(Vector2f offset);
        [CCode (cname = "sfRectangleShape_rotate")]
        public void rotate(float angle);
        [CCode (cname = "sfRectangleShape_scale")]
        public void scaling(Vector2f factors);
        [CCode (cname = "sfRectangleShape_getTransform")]
        public Transform getTransform();
        [CCode (cname = "sfRectangleShape_getInverseTransform")]
        public Transform getInverseTransform();
        [CCode (cname = "sfRectangleShape_setTexture")]
        public void setTexture(Texture texture, bool resetRect);
        [CCode (cname = "sfRectangleShape_setTextureRect")]
        public void setTextureRect(IntRect rect);
        [CCode (cname = "sfRectangleShape_setFillColor")]
        public void setFillColor(Color color);
        [CCode (cname = "sfRectangleShape_setOutlineColor")]
        public void setOutlineColor(Color color);
        [CCode (cname = "sfRectangleShape_setOutlineThickness")]
        public void setOutlineThickness(float thickness);
        [CCode (cname = "sfRectangleShape_getTexture")]
        public Texture getTexture();
        [CCode (cname = "sfRectangleShape_getTextureRect")]
        public IntRect getTextureRect();
        [CCode (cname = "sfRectangleShape_getFillColor")]
        public Color getFillColor();
        [CCode (cname = "sfRectangleShape_getOutlineColor")]
        public Color getOutlineColor();
        [CCode (cname = "sfRectangleShape_getOutlineThickness")]
        public float getOutlineThickness();
        [CCode (cname = "sfRectangleShape_getPointCount")]
        public size_t getPointCount();
        [CCode (cname = "sfRectangleShape_getPoint")]
        public Vector2f setPoint(size_t index);
        [CCode (cname = "sfRectangleShape_setSize")]
        public void setSize(Vector2f size);
        [CCode (cname = "sfRectangleShape_getSize")]
        public Vector2f getSize();
        [CCode (cname = "sfRectangleShape_getLocalBounds")]
        public FloatRect getLocalBounds();
        [CCode (cname = "sfRectangleShape_getGlobalBounds")]
        public FloatRect getGlobalBounds();
	}


	[Flags]
	[CCode (cname = "sfTextStyle", cprefix = "sfText")]
	public enum TextStyle{
		Regular,         ///< Regular characters, no style
		Bold, ///< Bold characters
		Italic        , ///< Italic characters
		Underlined    , ///< Underlined characters
		StrikeThrough   ///< Strike through characters
	}


	[CCode (cname = "sfFontInfo")]
	[SimpleType]
	public struct FontInfo
	{
		unowned string family;
	}

	[CCode (cname = "sfGlyph")]
	public struct Glyph
	{	
		float		advance;     ///< Offset to move horizontically to the next character
		FloatRect	bounds;      ///< Bounding rectangle of the glyph, in coordinates relative to the baseline
		IntRect		textureRect; ///< Texture coordinates of the glyph inside the font's image
	}

	[Compact]
	[CCode (cname = "sfFont", free_function = "sfFont_destroy", cprefix = "sfFont_")]
	public class Font {

		[CCode (cname = "sfFont_createFromFile")]
		public Font(string filename);
		[CCode (cname = "sfFont_createFromFile")]
		public Font.load_from_file(string filename);
		[CCode (cname = "sfFont_createFromMemory")]
		public Font.load_from_memory(void *data, size_t sizeInBytes);

		// sfFont* sfFont_createFromStream(sfInputStream* stream);
		public Font copy();
		public Glyph getGlyph(uint32 codePoint, uint characterSize, bool bold, float outlineThickness);
		public float getKerning(uint32 first, uint32 second, uint characterSize);
		public float getLineSpacing(uint characterSize);
		public float getUnderlinePosition(uint characterSize);
		public float getUnderlineThickness(uint characterSize);
		public Texture getTexture(uint characterSize);
		public FontInfo getInfo();
	}




	[Compact]
	[Immutable]
	[CCode (cname = "sfText", copy_function="sfText_copy", free_function = "sfText_destroy", cprefix = "sfText_")]
	public class Text {

		[CCode (cname="sfText_create")]
		public Text();

		public Text copy();

		public Vector2f position{
			[CCode (cname = "sfText_getPosition")]
			get;
			[CCode (cname = "sfText_setPosition")]
			set;
		}
		public float rotation{
			[CCode (cname = "sfText_getRotation")]
			get;
			[CCode (cname = "sfText_setRotation")]
			set;
		}
		public Vector2f scale{
			[CCode (cname = "sfText_getScale")]
			get;
			[CCode (cname = "sfText_setScale")]
			set;
		}
		public Vector2f origin{
			[CCode (cname = "sfText_getOrigin")]
			get;
			[CCode (cname = "sfText_setOrigin")]
			set;
		}
		public unowned string @string{
			[CCode (cname = "sfText_getString")]
			get;
			[CCode (cname = "sfText_setString")]
			set;
		}
		public unowned Font font{
			[CCode (cname = "sfText_getFont")]
			get;
			[CCode (cname = "sfText_setFont")]
			set;
		}
		public uint size{
			[CCode (cname = "sfText_getCharacterSize")]
			get;
			[CCode (cname = "sfText_setCharacterSize")]
			set;
		}
		public float linespacing{
			[CCode (cname = "sfText_getLineSpacing")]
			get;
			[CCode (cname = "sfText_setLineSpacing")]
			set;
		}
		public float letterspacing{
			[CCode (cname = "sfText_getLetterSpacing")]
			get;
			[CCode (cname = "sfText_setLetterSpacing")]
			set;
		}
		public uint32 style{
			[CCode (cname = "sfText_getStyle")]
			get;
			[CCode (cname = "sfText_setStyle")]
			set;
		}
		public Color color{
			[CCode (cname = "sfText_getColor")]
			get;
			[CCode (cname = "sfText_setColor")]
			set;
		}
		public Color fillcolor{
			[CCode (cname = "sfText_getFillColor")]
			get;
			[CCode (cname = "sfText_setFillColor")]
			set;
		}
		public Color outlinecolor{
			[CCode (cname = "sfText_getoutlineColor")]
			get;
			[CCode (cname = "sfText_setoutlineColor")]
			set;
		}
		public float outlinethickness{
			[CCode (cname = "sfText_getoutlinethickness")]
			get;
			[CCode (cname = "sfText_setoutlinethickness")]
			set;
		}

		[CCode (cname = "sfRenderWindow_drawText", instance_pos = 1.2)]
		public void draw(RenderWindow window, RenderStates? state = null);

		public void setPosition(Vector2f position);
		public void setRotation(float angle);
		public void setScale(Vector2f scale);
		public void setOrigin(Vector2f origin);
		public Vector2f getPosition();
		public float getRotation();
		public Vector2f getScale();
		public Vector2f getOrigin();
		public void move(Vector2f offset);
		public void rotate(float angle);
		public void scaling(Vector2f factors);
		public Transform getTransform();
		public Transform getInverseTransform();
		public void setString(string str);
		public void setUnicodeString(uint32 []str);
		public void setFont(Font font);
		public void setCharacterSize(uint size);
		public void setLineSpacing(float spacingFactor);
		public void setLetterSpacing(float spacingFactor);
		public void setStyle(uint32 style);
		public void setColor(Color color);
		public void setFillColor(Color color);
		public void setOutlineColor(Color color);
		public void setOutlineThickness(float thickness);
		public unowned string getString();
		public uint32* getUnicodeString();
		public unowned Font getFont();
		public uint getCharacterSize();
		public float getLetterSpacing();
		public float getLineSpacing();
		public uint32 getStyle();
		public Color getColor();
		public Color getFillColor();
		public Color getOutlineColor();
		public float getOutlineThickness();
		public Vector2f findCharacterPos(size_t index);
		public FloatRect getLocalBounds();
		public FloatRect getGlobalBounds();
	}

	[Compact]
	[Immutable]
	[CCode (copy_function = "sfImage_copy", cname = "sfImage", free_function = "sfImage_destroy", cprefix="sfImage_")]
	public class Image{
		[CCode (cname = "sfImage_create")]
		public Image(uint width, uint height);
		[CCode (cname = "sfImage_createFromColor")]
		public Image.fromColor(uint width, uint height, Color color);
		[CCode (cname = "sfImage_createFromPixels")]
		public Image.fromPixels(uint width, uint height, uint8* pixels);
		[CCode (cname = "sfImage_createFromFile")]
		public Image.fromFile(string filename);
		[CCode (cname = "sfImage_createFromMemory")]
		public Image.fromMemory(void* data, size_t size);
		[CCode (cname = "sfImage_createFromStream")]
		public Image.FromStream(InputStream stream);
		[CCode (cname = "sfImage_copy")]
		public Image copy();

		public bool saveToFile(string filename);
		public Vector2u getSize();
		public void createMaskFromColor(Color color, uint8 alpha);
		public void copyImage(Image source, uint destX, uint destY, IntRect sourceRect, bool applyAlpha);
		public void setPixel(uint x, uint y, Color color);
		public Color getPixel(uint x, uint y);
		public uint8 []getPixelsPtr();
		public void flipHorizontally();
		public void flipVertically();
	}


	[Compact]
	[CCode (cname = "sfShape", free_function = "sfShape_destroy", cprefix="sfShape_", cheader_filename = "SFML/Graphics.h")]
	public class Shape{
		[CCode (cname = "sfShapeGetPointCountCallback")]
		public delegate size_t GetPointCountDelegate (void* data);
		[CCode (cname = "sfShapeGetPointCallback")]
		public delegate Vector2f GetPointDelegate(size_t len, void* data); 
		[CCode (cname = "sfShape_create")]

		// Attribut 
		public Vector2f size{
			[CCode (cname = "sfShape_getSize")]
			get;
			[CCode (cname = "sfShape_setSize")]
			set;
		}
		public Vector2f position{
			[CCode (cname = "sfShape_getPosition")]
			get;
			[CCode (cname = "sfShape_setPosition")]
			set;
		}
		public float rotation{
			[CCode (cname = "sfShape_getRotation")]
			get;
			[CCode (cname = "sfShape_setRotation")]
			set;
		}
		public Vector2f scale{
			[CCode (cname = "sfShape_getScale")]
			get;
			[CCode (cname = "sfShape_setScale")]
			set;
		}
		public Vector2f origin{
			[CCode (cname = "sfShape_getOrigin")]
			get;
			[CCode (cname = "sfShape_setOrigin")]
			set;
		}
		public IntRect textureRect{
			[CCode (cname = "sfShape_getTextureRect")]
			get;
			[CCode (cname = "sfShape_setTextureRect")]
			set;
		}
		public Color color{
			[CCode (cname = "sfShape_getColor")]
			get;
			[CCode (cname = "sfShape_setColor")]
			set;
		}
		public FloatRect localBounds{
			[CCode (cname = "sfShape_getLocalBounds")]
			get;
			[CCode (cname = "sfShape_setLocalBounds")]
			set;
		}
		public FloatRect globalBounds{
			[CCode (cname = "sfShape_getGlobalBounds")]
			get;
			[CCode (cname = "sfShape_setGlobalBounds")]
			set;
		}

		[CCode (cname = "sfRenderWindow_drawShape", instance_pos = 1.2)]
		public void draw(RenderWindow window, RenderStates? state = null);
		
		public Shape(GetPointCountDelegate getPointCount, GetPointDelegate getPoint, void* userData);
		public void setPosition(Vector2f position);
		public void setRotation(float angle);
		public void setScale(Vector2f scale);
		public void setOrigin(Vector2f origin);
		public Vector2f getPosition();
		public float getRotation();
		public Vector2f getScale();
		public Vector2f getOrigin();
		public void move(Vector2f offset);
		public void rotate(float angle);
		public void scaling(Vector2f factors);
		public unowned Transform getTransform();
		public unowned Transform getInverseTransform();
		public void setTexture(Texture texture, bool resetRect);
		public void setTextureRect(IntRect rect);
		public void setFillColor(Color color);
		public void setOutlineColor(Color color);
		public void setOutlineThickness(float thickness);
		public unowned Texture getTexture();
		public IntRect getTextureRect();
		public Color getFillColor();
		public Color getOutlineColor();
		public float getOutlineThickness();
		public size_t getPointCount();
		public Vector2f getPoint(size_t index);
		public FloatRect getLocalBounds();
		public FloatRect getGlobalBounds();
		public void update();
	}


/* *****************************     SPRITE     ************************************************/
	[Compact]
	[CCode (cname = "sfSprite", free_function = "sfSprite_destroy", cheader_filename = "SFML/Graphics.h")]
	public class Sprite{
	    [CCode (cname = "sfSprite_create")]
	    public Sprite();
		[CCode (cname = "sfSprite_copy")]
		public Sprite copy();

		// Attribut 
		public Vector2f size{
			get {
				unowned Texture tex;
				tex = this.texture;
				return {tex.size.x, tex.size.y};
			}
		}
		public Vector2f position{
			[CCode (cname = "sfSprite_getPosition")]
			get;
			[CCode (cname = "sfSprite_setPosition")]
			set;
		}
		public float rotation{
			[CCode (cname = "sfSprite_getRotation")]
			get;
			[CCode (cname = "sfSprite_setRotation")]
			set;
		}
		public Vector2f scale{
			[CCode (cname = "sfSprite_getScale")]
			get;
			[CCode (cname = "sfSprite_setScale")]
			set;
		}
		public Vector2f origin{
			[CCode (cname = "sfSprite_getOrigin")]
			get;
			[CCode (cname = "sfSprite_setOrigin")]
			set;
		}
		public IntRect textureRect{
			[CCode (cname = "sfSprite_getTextureRect")]
			get;
			[CCode (cname = "sfSprite_setTextureRect")]
			set;
		}
		public Color color{
			[CCode (cname = "sfSprite_getColor")]
			get;
			[CCode (cname = "sfSprite_setColor")]
			set;
		}
		public FloatRect localBounds{
			[CCode (cname = "sfSprite_getLocalBounds")]
			get;
			[CCode (cname = "sfSprite_setLocalBounds")]
			set;
		}
		public FloatRect globalBounds{
			[CCode (cname = "sfSprite_getGlobalBounds")]
			get;
			[CCode (cname = "sfSprite_setGlobalBounds")]
			set;
		}
		public unowned Texture texture{
			[CCode (cname = "sfSprite_getTexture")]
			get;
			set{
				setTexture(value);
			}
			
		}
		public float angle{
			[CCode (cname = "sfSprite_setRotation")]
			set;
			[CCode (cname = "sfSprite_getRotation")]
			get;
		}
		
		[CCode (cname = "sfSprite_setTexture")]
		public void setTexture(Texture texture, bool resetRect = false);
		


		[CCode (cname = "sfRenderWindow_drawSprite", instance_pos = 1.2)]
		public void draw(RenderWindow window, RenderStates? state = null);

		[CCode (cname = "sfSprite_setPosition")]
		public void setPosition(Vector2f position);
		[CCode (cname = "sfSprite_setRotation")]
		public void setRotation(float angle);
		[CCode (cname = "sfSprite_setScale")]
		public void setScale(Vector2f scale);
		[CCode (cname = "sfSprite_setOrigin")]
		public void setOrigin(Vector2f origin);
		[CCode (cname = "sfSprite_getPosition")]
		public Vector2f ?getPosition();
		[CCode (cname = "sfSprite_getRotation")]
		public float getRotation();
		[CCode (cname = "sfSprite_getScale")]
		public Vector2f ?getScale();
		[CCode (cname = "sfSprite_getOrigin")]
		public Vector2f ?getOrigin();
		[CCode (cname = "sfSprite_move")]
		public void move(Vector2f offset);
		[CCode (cname = "sfSprite_rotate")]
		public void rotate(float angle);
		[CCode (cname = "sfSprite_scale")]
		public void scaling(Vector2f factors);
		[CCode (cname = "sfSprite_getTransform")]
		public Transform getTransform();
		[CCode (cname = "sfSprite_getInverseTransform")]
		public Transform getInverseTransform();
		[CCode (cname = "sfSprite_setTextureRect")]
		public void setTextureRect(IntRect rectangle);
		[CCode (cname = "sfSprite_setColor")]
		public void setColor(Color color);
		[CCode (cname = "sfSprite_getTexture")]
		public unowned Texture getTexture();
		[CCode (cname = "sfSprite_getTextureRect")]
		public IntRect getTextureRect();
		[CCode (cname = "sfSprite_getColor")]
		public Color getColor();
		[CCode (cname = "sfSprite_getLocalBounds")]
		public unowned FloatRect getLocalBounds();
		[CCode (cname = "sfSprite_getGlobalBounds")]
		public unowned FloatRect getGlobalBounds();

	}
	[CCode (cname = "sfGlslVec2")]
		public struct GlslVec2{
			float x;
			float y;
		}
	[CCode (cname = "sfGlslIvec2")]
	public struct GlslIvec2{
		int x;
		int y;
	}

	[CCode (cname = "sfGlslBvec2")]
	[SimpleType]
	public struct GlslBvec2
	{
		bool x;
		bool y;
	}

	[CCode (cname = "sfGlslVec3")]
	[SimpleType]
	public struct GlslVec3 {
		float x;
		float y;
		float z;
	}
	[CCode (cname = "sfGlslIvec3")]
	[SimpleType]
	public struct GlslIvec3
	{
		int x;
		int y;
		int z;
	}
	[CCode (cname = "sfGlslBvec3")]
	[SimpleType]
	public struct GlslBvec3
	{
		bool x;
		bool y;
		bool z;
	}
	[CCode (cname = "sfGlslVec4")]
	[SimpleType]
	public struct GlslVec4
	{
		float x;
		float y;
		float z;
		float w;
	}	
	[CCode (cname = "sfGlslIvec4")]
	[SimpleType]
	public struct GlslIvec4
	{
		int x;
		int y;
		int z;
		int w;
	}
	[CCode (cname = "sfGlslBvec4")]
	[SimpleType]
	public struct GlslBvec4
	{
		bool x;
		bool y;
		bool z;
		bool w;
	}

	[CCode (cname = "sfGlslMat3")]
	[SimpleType]
	public struct GlslMat3
	{
		float array[3 * 3];
	}

	[CCode (cname = "sfGlslMat4")]
	[SimpleType]
	public struct GlslMat4
	{
		float array[4 * 4];
	}

	[Compact]
	[CCode (cname = "sfShader", free_function = "sfShader_destroy", cprefix="sfShader_")]
	public class Shader {
		[CCode (cname = "sfShader_createFromFile")]
		public Shader.FromFile(string vertexShaderFilename, string geometryShaderFilename, string fragmentShaderFilename);
		[CCode (cname = "sfShader_createFromMemory")]
		public Shader.FromMemory(string vertexShader, string geometryShader, string fragmentShader);
		[CCode (cname = "sfShader_createFromStream")]
		public Shader.FromStream(InputStream vertexShaderStream, InputStream geometryShaderStream, InputStream fragmentShaderStream);
		
		public static bool isAvailable();
		public static bool isGeometryAvailable();
		public void setFloatUniform(string name, float x);
		public void setVec2Uniform(string name, GlslVec2 vector);
		public void setVec3Uniform(string name, GlslVec3 vector);
		public void setVec4Uniform(string name, GlslVec4 vector);
		public void setColorUniform(string name, Color color);
		public void setIntUniform(string name, int x);
		public void setIvec2Uniform(string name, GlslIvec2 vector);
		public void setIvec3Uniform(string name, GlslIvec3 vector);
		public void setIvec4Uniform(string name, GlslIvec4 vector);
		public void setIntColorUniform(string name, Color color);
		public void setBoolUniform(string name, bool x);
		public void setBvec2Uniform(string name, GlslBvec2 vector);
		public void setBvec3Uniform(string name, GlslBvec3 vector);
		public void setBvec4Uniform(string name, GlslBvec4 vector);
		public void setMat3Uniform(string name, GlslMat3 matrix);
		public void setMat4Uniform(string name, GlslMat4 matrix);
		public void setTextureUniform(string name, Texture texture);
		public void setCurrentTextureUniform(string name);
		public void setFloatUniformArray(string name, float scalarArray, size_t length);
		public void setVec2UniformArray(string name, GlslVec2 vectorArray, size_t length);
		public void setVec3UniformArray(string name, GlslVec3 vectorArray, size_t length);
		public void setVec4UniformArray(string name, GlslVec4 vectorArray, size_t length);
		public void setMat3UniformArray(string name, GlslMat3 matrixArray, size_t length);
		public void setMat4UniformArray(string name, GlslMat4 matrixArray, size_t length);
		public void setFloatParameter(string name, float x);
		public void setFloat2Parameter(string name, float x, float y);
		public void setFloat3Parameter(string name, float x, float y, float z);
		public void setFloat4Parameter(string name, float x, float y, float z, float w);
		public void setVector2Parameter(string name, Vector2f vector);
		public void setVector3Parameter(string name, Vector3f vector);
		public void setColorParameter(string name, Color color);
		public void setTransformParameter(string name, Transform transform);
		public void setTextureParameter(string name, Texture texture);
		public void setCurrentTextureParameter(string name);
		public uint getNativeHandle();
		public void bind();
	}

	[SimpleType]
	[CCode(cname = "sfTransform", cprefix="sfTransform_")]
	public struct Transform {
		public float matrix[9];
		public Transform* Identity;
		public static Transform fromMatrix(float a00, float a01, float a02,
				float a10, float a11, float a12,
				float a20, float a21, float a22);
		public void getMatrix(float matrix);
		public Transform getInverse(Transform transform);
		public Vector2f transformPoint(Vector2f point);
		public FloatRect transformRect(FloatRect rectangle);
		public void combine(Transform other);
		public void translate(float x, float y);
		public void rotate(float angle);
		public void rotateWithCenter(float angle, float centerX, float centerY);
		public void scale(float scaleX, float scaleY);
		public void scaleWithCenter(float scaleX, float scaleY, float centerX, float centerY);
		public bool equal(Transform left, Transform right);


	}

	[CCode (cname = "sfVertex")]
    [SimpleType]
	public struct Vertex
	{
		Vector2f position;  ///< Position of the vertex
		Color    color;     ///< Color of the vertex
		Vector2f texCoords; ///< Coordinates of the texture's pixel to map to the vertex
	}

	[Compact]
    [CCode (free_function = "sfVertexArray_destroy", cprefix="sfVertexArray_", cheader_filename = "SFML/Graphics.h")]
	public class VertexArray {
		[CCode (cname = "sfVertexArray_create")]
		public VertexArray();

		public VertexArray copy();
		public void destroy();
		public size_t getVertexCount();
		public Vertex getVertex(size_t index);
		public void clear();
		public void resize(size_t vertexCount);
		public void append(Vertex vertex);
		public void setPrimitiveType(PrimitiveType type);
		public PrimitiveType getPrimitiveType();
		public FloatRect getBounds();
	}
	[CCode (cname = "sfVertexBufferUsage", cprefix= "sfVertexBuffer")]
	public enum VertexBufferUsage
	{
		Stream,  ///< Constantly changing data
		Dynamic, ///< Occasionally changing data
		Static   ///< Rarely changing data
	}

	[Compact]
    [CCode (free_function = "sfVertexBuffer_destroy", cprefix="sfVertexBuffer_", cheader_filename = "SFML/Graphics.h")]
	public class VertexBuffer {
	
		public VertexBuffer(uint vertexCount, PrimitiveType type, VertexBufferUsage usage);
		public VertexBuffer copy();
		public void destroy();
		public uint getVertexCount();
		public bool update(Vertex vertices, uint vertexCount, uint offset);
		public bool updateFromVertexBuffer(VertexBuffer other);
		public void swap(VertexBuffer source);
		public uint getNativeHandle();
		public void setPrimitiveType(PrimitiveType type);
		public PrimitiveType getPrimitiveType();
		public void setUsage(VertexBufferUsage usage);
		public VertexBufferUsage getUsage();
		public void bind();
		public bool isAvailable();
}

	[CCode (cname = "sfRenderStates")]
	public struct RenderStates{
		BlendMode		blendMode; ///< Blending mode
		Transform		transform; ///< Transform
		Texture			texture;   ///< Texture
		Shader			shader;    ///< Shader

		[CCode (cname = "sfRenderStates_default")]
		public static RenderStates @default();
	}

	[CCode(cname="sfBlendFactor", cprefix="sfBlendFactor")]
	public enum BlendFactor
	{
		Zero,             ///< (0, 0, 0, 0)
		One,              ///< (1, 1, 1, 1)
		SrcColor,         ///< (src.r, src.g, src.b, src.a)
		OneMinusSrcColor, ///< (1, 1, 1, 1) - (src.r, src.g, src.b, src.a)
		DstColor,         ///< (dst.r, dst.g, dst.b, dst.a)
		OneMinusDstColor, ///< (1, 1, 1, 1) - (dst.r, dst.g, dst.b, dst.a)
		SrcAlpha,         ///< (src.a, src.a, src.a, src.a)
		OneMinusSrcAlpha, ///< (1, 1, 1, 1) - (src.a, src.a, src.a, src.a)
		DstAlpha,         ///< (dst.a, dst.a, dst.a, dst.a)
		OneMinusDstAlpha  ///< (1, 1, 1, 1) - (dst.a, dst.a, dst.a, dst.a)
	}

	[CCode(cname="sfBlendEquation", cprefix="sfBlendEquation")]
	public enum BlendEquation
	{
		Add,            ///< Pixel = Src * SrcFactor + Dst * DstFactor
		Subtract,       ///< Pixel = Src * SrcFactor - Dst * DstFactor
		ReverseSubtract ///< Pixel = Dst * DstFactor - Src * SrcFactor
	}

	[CCode(cname="sfBlendMode")]
	public struct BlendMode
	{
		public BlendFactor colorSrcFactor;  ///< Source blending factor for the color channels
		public BlendFactor colorDstFactor;  ///< Destination blending factor for the color channels
		public BlendEquation colorEquation; ///< Blending equation for the color channels
		public BlendFactor alphaSrcFactor;  ///< Source blending factor for the alpha channel
		public BlendFactor alphaDstFactor;  ///< Destination blending factor for the alpha channel
		public BlendEquation alphaEquation; ///< Blending equation for the alpha channel
	}

	[Compact]
    [CCode (free_function = "sfRenderWindow_destroy", cheader_filename = "SFML/Window.h,SFML/Graphics.h", cprefix = "sfRenderWindow_")]
	public class RenderWindow {
		[CCode (cname = "sfRenderWindow_create")]
		public RenderWindow(VideoMode mode, string title, WindowStyle style = WindowStyle.DefaultStyle, ContextSettings? settings = null);
		[CCode (cname = "sfRenderWindow_createUnicode")]
		public RenderWindow.createUnicode(VideoMode mode, uint32 []title, uint32 style, ContextSettings? settings = null);
		[CCode (cname = "sfRenderWindow_createFromHandle")]
		public RenderWindow.createFromHandle(WindowHandle handle, ContextSettings? settings = null);

		public bool visible{
		[CCode (cname = "sfRenderWindow_getVisible")]
			get;
		[CCode (cname = "sfRenderWindow_setVisible")]
			set;
		}

		public Vector2i position{
			[CCode (cname = "sfRenderWindow_getPosition")]
			get;
			[CCode (cname = "sfRenderWindow_setPosition")]
			set;
		}
		public Vector2u size{
			[CCode (cname = "sfRenderWindow_getSize")]
			get;
			[CCode (cname = "sfRenderWindow_setSize")]
			set;
		}
		public unowned string title{
			[CCode (cname = "sfRenderWindow_getTitle")]
			get;
			[CCode (cname = "sfRenderWindow_setTitle")]
			set;
		}
		public uint framerateLimit{
			[CCode (cname = "sfRenderWindow_getFramerateLimit")]
			get;
			[CCode (cname = "sfRenderWindow_setFramerateLimit")]
			set;
		}
		public float joystickThreshold{
			[CCode (cname = "sfRenderWindow_getJoystickThreshold")]
			get;
			[CCode (cname = "sfRenderWindow_setJoystickThreshold")]
			set;
		}
		public bool active{
			[CCode (cname = "sfRenderWindow_getActive")]
			get;
			[CCode (cname = "sfRenderWindow_setActive")]
			set;
		}
		public bool focus{
			[CCode (cname = "sfRenderWindow_hasFocus")]
			get;
		}
		public uint fps{
			[CCode (cname = "sfRenderWindow_setFramerateLimit")]
			set;
			[CCode (cname = "sfRenderWindow_getFramerateLimit")]
			get;
		}

		public void close();
		public bool isOpen();
		public unowned ContextSettings getSettings();
		public bool pollEvent(out Event event);
		public bool waitEvent(out Event event);
		public Vector2i getPosition();
		public void setPosition(Vector2i position);
		public Vector2u getSize();
		public void setSize(Vector2u size);
		public void setTitle(string title);
		public unowned string getTitle();
		public void setUnicodeTitle(uint32 []title);
		public void setIcon(uint width, uint height, uint8 []pixels);
		public void setVisible(bool visible);
		public void setVerticalSyncEnabled(bool enabled);
		public void setMouseCursorVisible(bool show);
		public void setMouseCursorGrabbed(bool grabbed);
		public void setMouseCursor(Cursor cursor);
		public void setKeyRepeatEnabled(bool enabled);
		public void setFramerateLimit(uint limit);
		public void setJoystickThreshold(float threshold);
		public bool setActive(bool active);
		public void requestFocus();
		public bool hasFocus();
		public void display();
		public unowned WindowHandle getSystemHandle();
		public void clear(Color color = Color.Black);
		public void setView(View view);
		public unowned View getView();
		public unowned View getDefaultView();
		public IntRect getViewport(View view);
		public Vector2f mapPixelToCoords(Vector2i point, View view);
		public Vector2i mapCoordsToPixel(Vector2f point, View view);
		public void drawSprite(Sprite object, RenderStates? states = null);
		public void drawText(Text object, RenderStates? states = null);
		public void drawShape(Shape object, RenderStates? states = null);
		public void drawCircleShape(CircleShape object, RenderStates? states = null);
		public void drawConvexShape(ConvexShape object, RenderStates? states = null);
		public void drawRectangleShape(RectangleShape object, RenderStates? states = null);
		public void drawVertexArray(VertexArray object, RenderStates? states = null);
		public void drawVertexBuffer(VertexBuffer object, RenderStates? states = null);
		public void drawVertexBufferRange(VertexBuffer object, size_t firstVertex, size_t vertexCount, RenderStates? states = null);
		public void drawPrimitives(Vertex vertices, size_t vertexCount, PrimitiveType type, RenderStates? states = null);
		public void pushGLStates();
		public void popGLStates();
		public void resetGLStates();
		[Version (deprecated = true, replacement = "")]
		public Image capture();
	}




    
	/*******************************************************************************************\
	|*******************************************************************************************|
	|*****************                        [Window]                        ******************|
	|*******************************************************************************************|
	|*******************************************************************************************|
	\*******************************************************************************************/

	[CCode (cprefix="sfClipboard_", cheader_filename = "SFML/Window.h")]
	namespace ClipBoard{
		public string getString();
		public uint32 []getUnicodeString();
		public void setString(string text);
		public void setUnicodeString(uint32 []text);
	}

	[Compact]
    [CCode (free_function = "sfContext_destroy", cprefix="sfContext_", cheader_filename = "SFML/Window.h")]
	public class Context {
		[CCode (cname = "sfContext_create")]
		public Context();

		public delegate void GlFunctionPointer();
		
		public static bool isExtensionAvailable(string name);
		public static unowned GlFunctionPointer getFunction(string name);
		public static uint64 getActiveContextId();
		public bool setActive(bool active);
		public unowned ContextSettings getSettings();
	}

	[CCode (cname = "sfCursorType", cprefix = "sfCursor")]
	public enum CursorType {
		Arrow,                  ///< Arrow cursor (default)
		ArrowWait,              ///< Busy arrow cursor
		Wait,                   ///< Busy cursor
		Text,                   ///< I-beam, cursor when hovering over a field allowing text entry
		Hand,                   ///< Pointing hand cursor
		SizeHorizontal,         ///< Horizontal double arrow cursor
		SizeVertical,           ///< Vertical double arrow cursor
		SizeTopLeftBottomRight, ///< Double arrow cursor going from top-left to bottom-right
		SizeBottomLeftTopRight, ///< Double arrow cursor going from bottom-left to top-right
		SizeAll,                ///< Combination of SizeHorizontal and SizeVertical
		Cross,                  ///< Crosshair cursor
		Help,                   ///< Help cursor
		NotAllowed              ///< Action not allowed cursor
	}

	[Compact]
    [CCode (free_function = "sfCursor_destroy", cheader_filename = "SFML/Window.h")]
	public class Cursor {
		[CCode (cname = "sfCursor_createFromPixels")]
		public Cursor.fromPixels(uint8 []pixels, Vector2u size, Vector2u hotspot);
		[CCode (cname = "sfCursor_createFromSystem")]
		public Cursor.fromSystem(CursorType type);
	}
	


	///////////////////////////////////////////////////////////////
	//							EVENT							//
	/////////////////////////////////////////////////////////////


	[CCode (cname = "sfEventType", cprefix = "sfEvt")]
    public enum EventType {
		Closed,                 ///< The window requested to be closed (no data)
		Resized,                ///< The window was resized (data in event.size)
		LostFocus,              ///< The window lost the focus (no data)
		GainedFocus,            ///< The window gained the focus (no data)
		TextEntered,            ///< A character was entered (data in event.text)
		KeyPressed,             ///< A key was pressed (data in event.key)
		KeyReleased,            ///< A key was released (data in event.key)
		MouseWheelMoved,        ///< The mouse wheel was scrolled (data in event.mouseWheel) (deprecated)
		MouseWheelScrolled,     ///< The mouse wheel was scrolled (data in event.mouseWheelScroll)
		MouseButtonPressed,     ///< A mouse button was pressed (data in event.mouseButton)
		MouseButtonReleased,    ///< A mouse button was released (data in event.mouseButton)
		MouseMoved,             ///< The mouse cursor moved (data in event.mouseMove)
		MouseEntered,           ///< The mouse cursor entered the area of the window (no data)
		MouseLeft,              ///< The mouse cursor left the area of the window (no data)
		JoystickButtonPressed,  ///< A joystick button was pressed (data in event.joystickButton)
		JoystickButtonReleased, ///< A joystick button was released (data in event.joystickButton)
		JoystickMoved,          ///< The joystick moved along an axis (data in event.joystickMove)
		JoystickConnected,      ///< A joystick was connected (data in event.joystickConnect)
		JoystickDisconnected,   ///< A joystick was disconnected (data in event.joystickConnect)
		TouchBegan,             ///< A touch event began (data in event.touch)
		TouchMoved,             ///< A touch moved (data in event.touch)
		TouchEnded,             ///< A touch event ended (data in event.touch)
		SensorChanged,          ///< A sensor value changed (data in event.sensor)
	}

    [CCode (cname = "sfKeyEvent")]
    [SimpleType]
    public struct	KeyEvent{
		EventType	type;
        KeyCode		code;
		bool		alt;
        bool		control;
        bool		shift;
        bool		system;
    }

    [CCode (cname = "sfTextEvent")]
    [SimpleType]
    public struct TextEvent{
        EventType	type;
		uint32		unicode;
	}

	[CCode (cname = "sfMouseMoveEvent")]
	[SimpleType]
	public struct MouseMoveEvent{
		sf.EventType	type;
		int				x;
		int				y;
	}

	[CCode (cname = "sfMouseButtonEvent")]
	[SimpleType]
	public struct MouseButtonEvent
	{
		EventType	type;
		MouseButton	button;
		int			x;
		int			y;
	}

	[CCode (cname = "sfMouseWheelEvent")]
	[SimpleType]
	public struct MouseWheelEvent
	{
		EventType	type;
		int			delta;
		int			x;
		int			y;
	}

    [CCode (cname = "sfMouseWheelScrollEvent")]
    [SimpleType]
    public struct MouseWheelScrollEvent
    {
        EventType 	type;
        MouseWheel	wheel;
        float		delta;
        int			x;
        int			y;
    }
	
	[CCode (cname = "sfJoystickMoveEvent")]
	[SimpleType]
	public struct JoystickMoveEvent
	{
	    EventType		type;
	    uint			joystickId;
	    JoystickAxis	axis;
	    float			position;
	}

	[CCode (cname = "sfJoystickButtonEvent")]
	[SimpleType]
	public struct JoystickButtonEvent
	{
	    EventType	type;
	    uint		joystickId;
	    uint		button;
	}
	
	[CCode (cname = "sfJoystickConnectEvent")]
	[SimpleType]
	public struct JoystickConnectEvent
	{
	    EventType		type;
	    uint			joystickId;
	}
	
	[CCode (cname = "sfSizeEvent")]
	[SimpleType]
	public struct SizeEvent
	{
	    EventType type;
	    uint width;
	    uint height;
	}
    
	[CCode (cname = "sfTouchEvent")]
    [SimpleType]
    public struct TouchEvent
    {
        EventType	type;
        uint		finger;
        int			x;
        int			y;
    }

    [CCode (cname = "sfSensorEvent")]
    [SimpleType]
    public struct SensorEvent
    {
        EventType	type;
        SensorType	sensorType;
        float		 x;
        float		 y;
        float		 z;
    }
    
	[CCode (cname = "sfEvent", cprefix="sf", default_value ="{-42}")]
	[SimpleType]
	public struct Event{
		EventType             type;             ///< Type of the event
		SizeEvent             size;             ///< Size event parameters
		KeyEvent              key;              ///< Key event parameters
		TextEvent             text;             ///< Text event parameters
		MouseMoveEvent        mouseMove;        ///< Mouse move event parameters
		MouseButtonEvent      mouseButton;      ///< Mouse button event parameters
		MouseWheelEvent       mouseWheel;       ///< Mouse wheel event parameters (deprecated)
		MouseWheelScrollEvent mouseWheelScroll; ///< Mouse wheel event parameters
		JoystickMoveEvent     joystickMove;     ///< Joystick move event parameters
		JoystickButtonEvent   joystickButton;   ///< Joystick button event parameters
		JoystickConnectEvent  joystickConnect;  ///< Joystick (dis)connect event parameters
		TouchEvent            touch;            ///< Touch events parameters
		SensorEvent           sensor;           ///< Sensor event parameters
	}
	[CCode (cname = "sfJoystickCount")]
	public const int JoystickCount;
	[CCode (cname = "sfJoystickButtonCount")]
    public const int JoystickButtonCount;
	[CCode (cname = "sfJoystickAxisCount")]
    public const int JoystickAxisCount;
	[CCode (cname = "sfJoystickAxis", cprefix = "sfJoystick")]
	public enum JoystickAxis
	{
		X,    ///< The X axis
		Y,    ///< The Y axis
		Z,    ///< The Z axis
		R,    ///< The R axis
		U,    ///< The U axis
		V,    ///< The V axis
		PovX, ///< The X axis of the point-of-view hat
		PovY  ///< The Y axis of the point-of-view hat
	}
	[CCode (cprefix = "sfKeyboard_")]
    namespace Keyboard {
		public bool isKeyPressed(KeyCode key);
		public void setVirtualKeyboardVisible(bool visible);
	}

	[CCode (cprefix = "sfJoystick_")]
    namespace Joystick {
		public bool isConnected(uint joystick);
		public uint getButtonCount(uint joystick);
		public bool hasAxis(uint joystick, JoystickAxis axis);
		public bool isButtonPressed(uint joystick, uint button);
		public float getAxisPosition(uint joystick, JoystickAxis axis);
		public JoystickIdentification getIdentification(uint joystick);
		public void update();
	}
    
	[CCode (cname = "sfJoystickIdentification")]
    public struct JoystickIdentification
    {
        string	name;
        uint	vendorId;
        uint	productId;
    }
    
	[CCode (cname = "sfKeyCode", cprefix = "sfKey")]
    public enum KeyCode
    {
        Unknown = -1, // Unhandled 
        A,            // The A 
        B,            // The B 
        C,            // The C 
        D,            // The D 
        E,            // The E 
        F,            // The F 
        G,            // The G 
        H,            // The H 
        I,            // The I 
        J,            // The J 
        K,            // The K 
        L,            // The L 
        M,            // The M 
        N,            // The N 
        O,            // The O 
        P,            // The P 
        Q,            // The Q 
        R,            // The R 
        S,            // The S 
        T,            // The T 
        U,            // The U 
        V,            // The V 
        W,            // The W 
        X,            // The X 
        Y,            // The Y 
        Z,            // The Z 
        Num0,         // The 0 
        Num1,         // The 1 
        Num2,         // The 2 
        Num3,         // The 3 
        Num4,         // The 4 
        Num5,         // The 5 
        Num6,         // The 6 
        Num7,         // The 7 
        Num8,         // The 8 
        Num9,         // The 9 
        Escape,       // The Escape 
        LControl,     // The left Control 
        LShift,       // The left Shift 
        LAlt,         // The left Alt 
        LSystem,      // The left OS specific : window (Windows and Linux), apple (MacOS X), ...
        RControl,     // The right Control 
        RShift,       // The right Shift 
        RAlt,         // The right Alt 
        RSystem,      // The right OS specific : window (Windows and Linux), apple (MacOS X), ...
        Menu,         // The Menu 
        LBracket,     // The [ 
        RBracket,     // The ] 
        Semicolon,    // The ; 
        Comma,        // The , 
        Period,       // The . 
        Quote,        // The ' 
        Slash,        // The / 
        Backslash,    // The \ 
        Tilde,        // The ~ 
        Equal,        // The = 
        Hyphen,       // The -  (hyphen)
        Space,        // The Space 
        Enter,        // The Enter/Return 
        Backspace,    // The Backspace 
        Tab,          // The Tabulation 
        PageUp,       // The Page up 
        PageDown,     // The Page down 
        End,          // The End 
        Home,         // The Home 
        Insert,       // The Insert 
        Delete,       // The Delete 
        Add,          // The + 
        Subtract,     // The -  (minus, usually from numpad)
        Multiply,     // The * 
        Divide,       // The / 
        Left,         // Left arrow
        Right,        // Right arrow
        Up,           // Up arrow
        Down,         // Down arrow
        Numpad0,      // The numpad 0 
        Numpad1,      // The numpad 1 
        Numpad2,      // The numpad 2 
        Numpad3,      // The numpad 3 
        Numpad4,      // The numpad 4 
        Numpad5,      // The numpad 5 
        Numpad6,      // The numpad 6 
        Numpad7,      // The numpad 7 
        Numpad8,      // The numpad 8 
        Numpad9,      // The numpad 9 
        F1,           // The F1 
        F2,           // The F2 
        F3,           // The F3 
        F4,           // The F4 
        F5,           // The F5 
        F6,           // The F6 
        F7,           // The F7 
        F8,           // The F8 
        F9,           // The F8 
        F10,          // The F10 
        F11,          // The F11 
        F12,          // The F12 
        F13,          // The F13 
        F14,          // The F14 
        F15,          // The F15 
        Pause,        // The Pause 
        Count,
        [Version (deprecated = true, replacement = "Hyphen")]
		Dash,
        [Version (deprecated = true, replacement = "Backspace")]
        Back,
        [Version (deprecated = true, replacement = "Backslash")]
        BackSlash,
        [Version (deprecated = true, replacement = "Semicolon")]
        SemiColon,
        [Version (deprecated = true, replacement = "Enter")]
        Return
    }

    [CCode (cname = "sfMouseButton", cprefix = "sfMouse")]
    public enum MouseButton
    {
        Left,       ///< The left mouse button
        Right,      ///< The right mouse button
        Middle,     ///< The middle (wheel) mouse button
		Button1,   ///< The first extra mouse button
        Button2,   ///< The second extra mouse button
        ButtonCount ///< Keep last -- the total number of mouse buttons
    }

    [CCode (cname = "sfMouseWheel", cprefix = "sfMouse")]
    public enum MouseWheel
    {
        Vertical,
        Horizontal
    }

	[CCode (cprefix = "sfMouse_")]
	namespace Mouse {
		public bool isButtonPressed(MouseButton button);
		public Vector2i getPosition(RenderWindow relativeTo);
		public void setPosition(Vector2i position, RenderWindow relativeTo);
	}
    
[CCode (cname = "sfSensorType", cprefix = "sfSensor")]
    public enum SensorType
    {
        Accelerometer,    ///< Measures the raw acceleration (m/s^2)
        Gyroscope,        ///< Measures the raw rotation rates (degrees/s)
        Magnetometer,     ///< Measures the ambient magnetic field (micro-teslas)
        Gravity,          ///< Measures the direction and intensity of gravity, independent of device acceleration (m/s^2)
        UserAcceleration, ///< Measures the direction and intensity of device acceleration, independent of the gravity (m/s^2)
        Orientation,      ///< Measures the absolute 3D orientation (degrees)
        Count             ///< Keep last -- the total number of sensor types
    }

[CCode (cprefix = "sfSensor_")]
	namespace Sensor {
		public bool isAvailable(SensorType sensor);
		public void setEnabled(SensorType sensor, bool enabled);
		public Vector3f getValue(SensorType sensor);
	}
    
	[CCode (cprefix = "sfTouch_")]
	namespace Touch {
		public bool isDown(uint finger);
		public Vector2i getPosition(uint finger, RenderWindow relativeTo);
	}
	
	[CCode (cname = "sfVideoMode", cheader_filename = "SFML/Window.h")]
    [SimpleType]
    public struct VideoMode{
		uint width;
        uint height;
        uint bitsPerPixel;
        [CCode (cname = "sfVideoMode_getDesktopMode")]
        public VideoMode getDesktopMode();
        [CCode (cname = "sfVideoMode_getFullscreenModes")]
        public unowned VideoMode getFullscreenModes(ref size_t count);
        [CCode (cname = "sfVideoMode_isValid")]
        public bool isValid(VideoMode mode);

    }

	[CCode (cname = "sfWindowStyle", cprefix = "sf")]
    public enum WindowStyle
    {
        None,
        Titlebar,
        Resize,
        Close,
        Fullscreen,
        DefaultStyle
    }
    [CCode (cname = "sfContextAttribute", cprefix = "sfContext")]
    public enum ContextAttribute
    {
        Default,
        Core,
        Debug
    }
    [CCode (cname = "sfContextSettings")]
    public struct ContextSettings
    {
        uint depthBits;         ///< Bits of the depth buffer
        uint stencilBits;       ///< Bits of the stencil buffer
        uint antialiasingLevel; ///< Level of antialiasing
        uint majorVersion;      ///< Major number of the context version to create
        uint minorVersion;      ///< Minor number of the context version to create
        uint32 attributeFlags;    ///< The attribute flags to create the context with
        bool sRgbCapable;       ///< Whether the context framebuffer is sRGB capable
    }

	[Compact]
    [CCode (free_function = "sfCursor_destroy", cheader_filename = "SFML/Window.h")]
	public class Window {
		[CCode (cname = "sfWindow_create")]
		public Window(VideoMode mode, string title, uint32 style, ContextSettings? settings = null);
		[CCode (cname = "sfWindow_createUnicode")]
		public Window.withUnicode(VideoMode mode, uint32 []title, uint32 style, ContextSettings? settings = null);
		[CCode (cname = "isfWindow_createFromHandle")]
		public Window.fromHandle(WindowHandle handle, ContextSettings? settings = null);

		public void destroy();
		public void close();
		public bool isOpen();
		public unowned ContextSettings getSettings();
		public bool pollEvent(out Event event);
		public bool waitEvent(out Event event);
		public Vector2i getPosition();
		public void setPosition(Vector2i position);
		public Vector2u getSize();
		public void setSize(Vector2u size);
		public void setTitle(string title);
		public void setUnicodeTitle(uint32 []title);
		public void setIcon(uint width, uint height, uint8* pixels);
		public void setVisible(bool visible);
		public void setVerticalSyncEnabled(bool enabled);
		public void setMouseCursorVisible(bool visible);
		public void setMouseCursorGrabbed(bool grabbed);
		public void setMouseCursor(Cursor cursor);
		public void setKeyRepeatEnabled(bool enabled);
		public void setFramerateLimit(uint limit);
		public void setJoystickThreshold(float threshold);
		public bool setActive(bool active);
		public void requestFocus();
		public bool hasFocus();
		public void display();
		public WindowHandle getSystemHandle();	
	}
	[CCode (cname = "sfWindowHandle")]
	[SimpleType]
	public struct WindowHandle {
	}


	/*******************************************************************************************\
	|*******************************************************************************************|
	|*****************                         [Audio]                        ******************|
	|*******************************************************************************************|
	|*******************************************************************************************|
	\*******************************************************************************************/



	[CCode (cprefix = "sfListener_")]
	namespace Listener {
		void setGlobalVolume(float volume);
		float getGlobalVolume();
		void setPosition(Vector3f position);
		Vector3f getPosition();
		void setDirection(Vector3f direction);
		Vector3f getDirection();
		void setUpVector(Vector3f upVector);
		Vector3f getUpVector();
	}



	[CCode (cname = "sfTimeSpan")]
	public struct TimeSpan
	{
		Time offset;
		Time length; 
	}

	[Compact]
    [CCode (free_function = "sfMusic_destroy", cprefix="sfMusic_", cheader_filename = "SFML/Audio.h")]
	public class Music {
		[CCode (cname = "sfMusic_createFromFile")]
		public Music.fromFile(string filename);

		[CCode (cname = "sfMusic_createFromMemory")]
		public Music.fromMemory(void *data, size_t sizeInBytes);

		[CCode (cname = "sfMusic_createFromStream")]
		public Music.fromStream(InputStream stream);

		public void setLoop(bool loop);
		public bool getLoop();
		public Time getDuration();
		public TimeSpan getLoopPoints();
		public void setLoopPoints(TimeSpan timePoints);
		public void play();
		public void pause();
		public void stop();
		public uint getChannelCount();
		public uint getSampleRate();
		public SoundStatus getStatus();
		public Time getPlayingOffset();
		public void setPitch(float pitch);
		public void setVolume(float volume);
		public void setPosition(Vector3f position);
		public void setRelativeToListener(bool relative);
		public void setMinDistance(float distance);
		public void setAttenuation(float attenuation);
		public void setPlayingOffset(Time timeOffset);
		public float getPitch();
		public float getVolume();
		public Vector3f getPosition();
		public bool isRelativeToListener();
		public float getMinDistance();
		public float getAttenuation();
	}

	[Compact]
    [CCode (free_function = "sfSound_destroy", cprefix="sfSound_", cheader_filename = "SFML/Audio.h")]
	public class Sound
	{
		[CCode (cname = "sfSound_create")]
		public Sound();
		
		public Sound copy();
		public void play();
		public void pause();
		public void stop();
		public void setBuffer(SoundBuffer buffer);
		public unowned SoundBuffer getBuffer();
		public void setLoop(bool loop);
		public bool getLoop();
		public SoundStatus getStatus();
		public void setPitch(float pitch);
		public void setVolume(float volume);
		public void setPosition(Vector3f position);
		public void setRelativeToListener(bool relative);
		public void setMinDistance(float distance);
		public void setAttenuation(float attenuation);
		public void setPlayingOffset(Time timeOffset);
		public float getPitch();
		public float getVolume();
		public Vector3f getPosition();
		public bool isRelativeToListener();
		public float getMinDistance();
		public float getAttenuation();
		public Time getPlayingOffset();
	}





	[Compact]
    [CCode (free_function = "sfSoundBuffer_destroy", cprefix="sfSoundBuffer_", cheader_filename = "SFML/Audio.h")]
	public class SoundBuffer {
		[CCode (cname = "createFromFile")]
		public SoundBuffer.fromFile(string filename);

		[CCode (cname = "createFromMemory")]
		public SoundBuffer.fromMemory(void* data, size_t sizeInBytes);

		[CCode (cname = "createFromStream")]
		public SoundBuffer.fromStream(InputStream stream);

		[CCode (cname = "createFromSamples")]
		public SoundBuffer.fromSamples(int16 []samples, uint64 sampleCount, uint channelCount, uint sampleRate);


		public SoundBuffer copy();
		public bool saveToFile(string filename);
		public int16 []getSamples();
		public uint64 getSampleCount();
		public uint getSampleRate();
		public uint getChannelCount();
		public Time getDuration();
	}


	[Compact]
	[CCode (free_function = "sfSoundBufferRecorder_destroy", cprefix="sfSoundBufferRecorder_", cheader_filename = "SFML/Audio.h")]
	public class SoundBufferRecorder {
		[CCode (cname = "sfSoundBufferRecorder_create")]
		public SoundBufferRecorder();

		bool start(uint sampleRate);
		void stop();
		uint getSampleRate();
		unowned SoundBuffer getBuffer();
		bool setDevice(string name);
		string getDevice();
	}

	[Compact]
	[CCode (free_function = "sfSoundRecorder_destroy", cprefix="sfSoundRecorder_", cheader_filename = "SFML/Audio.h")]
	public class SoundRecorder {

		[CCode (cname = "sfSoundRecorder_create")]
		SoundRecorder(StartCallback? onStart = null, ProcessCallback onProcess, StopCallback? onStop = null, void* userData);

		public static string []getAvailableDevices(size_t []count);
		public static string getDefaultDevice();
		public static bool isAvailable();

		public bool start(uint sampleRate);
		public void stop();
		public uint getSampleRate(SoundRecorder soundRecorder);
		public void setProcessingInterval(Time interval);
		public bool setDevice(string name);
		public string getDevice();
		public void setChannelCount(uint channelCount);
		public uint getChannelCount(SoundRecorder soundRecorder);

		[CCode (cname = "sfSoundRecorderStartCallback")]
		public delegate bool StartCallback(void* todo1);
		[CCode (cname = "SoundRecorderProcessCallback")]
		public delegate bool ProcessCallback(int16[] todo1, size_t todo2, void* todo3);
		[CCode (cname = "SoundRecorderStopCallback")]
		public delegate void StopCallback(void* todo1);
	}
	[CCode (cname = "sfSoundStatus", cprefix = "sf")]
	public enum SoundStatus
	{
		Stopped, ///< Sound / music is not playing
		Paused,  ///< Sound / music is paused
		Playing  ///< Sound / music is playing
	}
}

