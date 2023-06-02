[CCode (cheader_filename = "SFML/Graphics.h")]
namespace sf{
    /* ****************************  VECTOR2-3 Color rect  *************************************/
    
    [CCode (cname = "sfVector2i", has_type_id = false, cheader_filename = "SFML/System.h")]
    [SimpleType]
    public struct Vector2i
    {
        int x;
        int y;
    }
    [CCode (cname = "sfVector2u", has_type_id = false, cheader_filename = "SFML/System.h")]
    [SimpleType]
    public struct Vector2u
    {
        uint x;
        uint y;
    }
    [CCode (cname = "sfVector2f", has_type_id = false, cheader_filename = "SFML/System.h")]
    [SimpleType]
    public struct Vector2f
    {
        float x;
        float y;
    }
    [CCode (cname = "sfVector3f", has_type_id = false, cheader_filename = "SFML/System.h")]
    [SimpleType]
    public struct Vector3f
    {
        float x;
        float y;
        float z;
    }
    [CCode (cname = "sfColor", has_type_id = false, default_value ="{0,0,0,255}", cheader_filename = "SFML/Graphics.h")]
    [SimpleType]
    public struct Color
    {
        uint8 r;
        uint8 g;
        uint8 b;
        uint8 a;
        
    }
    [CCode (cname = "sfColor_fromRGB")]
    public Color Color_RGB(uint8 red, uint8 green, uint8 blue);
    
    [CCode (cname = "sfFloatRect", has_type_id = false, cheader_filename = "SFML/Graphics.h")]
    [SimpleType]
    public struct FloatRect
    {
        public float left;
        public float top;
        public float width;
        public float height;
        [CCode (cname = "sfFloatRect_contains")]
        public bool contains(float x, float y);
        [CCode (cname = "sfFloatRect_intersects")]
        public bool intersects(FloatRect rect, FloatRect? intersection = null);
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
        public bool contains(int x, int y);
        [CCode (cname = "sfIntRect_intersects")]
        public bool intersects(IntRect rect, IntRect? intersection = null);
    }
    /* *****************************   VIDEO MODE   ************************************************/
    
	[CCode (cname = "sfVideoMode", destroy_function = "", has_type_id = false)]
    [SimpleType]
    public struct VideoMode{
		[CCode (cname = "my_static_constructor_VIDEOMODE")]
		public static VideoMode VideoMode(uint x, uint y){
			return {x, y};
		}

		[CCode (cname = "my_static_constructor_VIDEOMODE")]
		public VideoMode(uint x, uint y);
		uint width;
        uint height;
        uint bitsPerPixel;
        [CCode (cname = "sfVideoMode_getDesktopMode")]
        public VideoMode getDesktopMode();
        [CCode (cname = "sfVideoMode_getFullscreenModes")]
        public VideoMode* getFullscreenModes(size_t* count);
        [CCode (cname = "sfVideoMode_isValid")]
        public bool isValid(VideoMode mode);

    }
    /* *****************************     TEXTURE     ************************************************/
    [CCode (ref_function = "sfTexture_create", unref_function = "sfTexture_destroy", cheader_filename = "SFML/Graphics.h")]
	public class Texture{
	    [CCode (destroy_function = "sfTexture_destroy", cname = "sfTexture_create")]
	    public Texture(uint width, uint height);
	    [CCode (destroy_function = "sfTexture_destroy", cname = "sfTexture_createFromFile")]
	    public Texture.from_file(string filename, uint32? a=null);//TODO
	    [CCode (destroy_function = "sfTexture_destroy", cname = "sfTexture_createFromMemory ")]
	    public Texture.FromMemory(void* data, size_t sizeInBytes, uint32? area = null);//TODO
	    [CCode (destroy_function = "sfTexture_destroy", cname = "sfTexture_createFromStream ")]
	    public Texture.FromStream(uint32? stream = null, uint32? area = null); //TODO
	    
	}

	[CCode (ref_function = "sfCircleShape_create", unref_function = "sfCircleShape_destroy", cheader_filename = "SFML/Graphics.h")]
	public class CircleShape{
	    [CCode (destroy_function = "sfCircleShape_destroy", cname = "sfCircleShape_create")]
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
        /*[CCode (cname = "sfCircleShape_getTransform")]
        public Transform sfCircleShape_getTransform();
        [CCode (cname = "sfCircleShape_getInverseTransform")]
        public Transform sfCircleShape_getInverseTransform();*/
        [CCode (cname = "sfCircleShape_setTexture")]
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
        public Texture getTexture();
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

	/* *****************************     RECTANGLESHAPE     ************************************************/
	[CCode (unref_function = "sfRectangleShape_destroy", cheader_filename = "SFML/Graphics.h")]
	public class RectangleShape{
	    [CCode (destroy_function = "sfRectangleShape_destroy", cname = "sfRectangleShape_create")]
	    public RectangleShape();
        [CCode (cname = "sfRectangleShape_copy")]
        public RectangleShape* copy();
        [CCode (cname = "sfRectangleShape_setPosition")]
        public void setPosition(Vector2f position);
        [CCode (cname = "sfRectangleShape_setRotation")]
        public void setRotation(float angle);
        [CCode (cname = "sfRectangleShape_setScale")]
        public void setScale(Vector2f scale);
        [CCode (cname = "sfRectangleShape_setOrigin")]
        public void setOrigin(Vector2f origin);
        [CCode (cname = "sfRectangleShape_getPosition")]
        public Vector2f? getPosition();
        [CCode (cname = "sfRectangleShape_getRotation")]
        public float getRotation();
        [CCode (cname = "sfRectangleShape_getScale")]
        public Vector2f? getScale();
        [CCode (cname = "sfRectangleShape_getOrigin")]
        public Vector2f? getOrigin();
        [CCode (cname = "sfRectangleShape_move")]
        public void move(Vector2f offset);
        [CCode (cname = "sfRectangleShape_rotate")]
        public void rotate(float angle);
        [CCode (cname = "sfRectangleShape_scale")]
        public void scale(Vector2f factors);
        //[CCode (cname = "sfRectangleShape_getTransform")]
        //TODO public Transform getTransform();
        //[CCode (cname = "sfRectangleShape_getInverseTransform")]
        //TODO public Transform getInverseTransform();
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
        public Vector2f etPoint(size_t index);
        [CCode (cname = "sfRectangleShape_setSize")]
        public void setSize(Vector2f size);
        [CCode (cname = "sfRectangleShape_getSize")]
        public Vector2f getSize( );
        [CCode (cname = "sfRectangleShape_getLocalBounds")]
        public FloatRect getLocalBounds( );
        [CCode (cname = "sfRectangleShape_getGlobalBounds")]
        public FloatRect getGlobalBounds( );
	}


	[FLAGS]
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
[CCode (cname = "sfText", free_function = "sfText_destroy", cprefix = "sfText_")]
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
	public string @string{
		[CCode (cname = "sfText_getString")]
		get;
		[CCode (cname = "sfText_setString")]
		set;
	}
	public Font font{
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

	public string getString();

	public uint32* getUnicodeString();

	public Font getFont();

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




/* *****************************     SPRITE     ************************************************/
	[CCode (ref_function = "sfSprite_create", unref_function = "sfSprite_destroy", cheader_filename = "SFML/Graphics.h")]
	public class Sprite{
	    [CCode (destroy_function = "sfSprite_destroy", cname = "sfSprite_create")]
	    public Sprite();
    [CCode (cname = "sfSprite_copy")]
    public Sprite? copy();

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
	public Color prite_setColor{
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




	[CCode (cname = "sfSprite_setTexture")]
	public void setTexture(Texture texture, bool resetRect = false);
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
    //[CCode (cname = "sfSprite_getTransform")]
    //TODO public Transform getTransform();
    //[CCode (cname = "sfSprite_getInverseTransform")]
    //TODO public Transform getInverseTransform();
    [CCode (cname = "sfSprite_setTextureRect")]
    public void setTextureRect(IntRect rectangle);
    [CCode (cname = "sfSprite_setColor")]
    public void setColor(Color color);
    [CCode (cname = "sfSprite_getTexture")]
    public Texture? getTexture();
    [CCode (cname = "sfSprite_getTextureRect")]
    public IntRect getTextureRect();
    [CCode (cname = "sfSprite_getColor")]
    public Color getColor();
    [CCode (cname = "sfSprite_getLocalBounds")]
    public FloatRect getLocalBounds();
    [CCode (cname = "sfSprite_getGlobalBounds")]
    public FloatRect getGlobalBounds();

	}
	/* *****************************  RENDERWINDOW  ************************************************/


	[Compact]
	[CCode (cname = "sfShader", free_function = "sfShader_destroy", cprefix="sfShader_")]
	public class Shader {
		public static bool isAvailable();

		public static bool isGeometryAvailable();
// 
		public static Shader createFromFile(string vertexShaderFilename, string geometryShaderFilename, string fragmentShaderFilename);
// 
		public static Shader createFromMemory(string vertexShader, string geometryShader, string fragmentShader);

		// public static Shader createFromStream(sfInputStream vertexShaderStream, sfInputStream geometryShaderStream, sfInputStream fragmentShaderStream);


		public void setFloatUniform(string name, float x);

		// public void setVec2Uniform(string name, sfGlslVec2 vector);
// 
		// public void setVec3Uniform(string name, sfGlslVec3 vector);
// 
		// public void setVec4Uniform(string name, sfGlslVec4 vector);

		public void setColorUniform(string name, Color color);

		public void setIntUniform(string name, int x);

		// public void setIvec2Uniform(string name, sfGlslIvec2 vector);
// 
		// public void setIvec3Uniform(string name, sfGlslIvec3 vector);
// 
		// public void setIvec4Uniform(string name, sfGlslIvec4 vector);

		public void setIntColorUniform(string name, Color color);

		public void setBoolUniform(string name, bool x);
// 
		// public void setBvec2Uniform(string name, sfGlslBvec2 vector);
// 
		// public void setBvec3Uniform(string name, sfGlslBvec3 vector);
// 
		// public void setBvec4Uniform(string name, sfGlslBvec4 vector);
// 
		// public void setMat3Uniform(string name, sfGlslMat3 matrix);
// 
		// public void setMat4Uniform(string name, sfGlslMat4 matrix);

		public void setTextureUniform(string name, Texture texture);

		public void setCurrentTextureUniform(string name);

		public void setFloatUniformArray(string name, float scalarArray, size_t length);
// 
		// public void setVec2UniformArray(string name, sfGlslVec2 vectorArray, size_t length);
// 
		// public void setVec3UniformArray(string name, sfGlslVec3 vectorArray, size_t length);
// 
		// public void setVec4UniformArray(string name, sfGlslVec4 vectorArray, size_t length);
// 
		// public void setMat3UniformArray(string name, sfGlslMat3 matrixArray, size_t length);
// 
		// public void setMat4UniformArray(string name, sfGlslMat4 matrixArray, size_t length);

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

		public uint getNativeHandle(Shader shader);

		public void bind(Shader shader);
	}




	[SimpleType]
	[CCode(cname = "sfTransform", cprefix="sfTransform_")]
	public struct Transform {
		public float matrix[9];



		public Transform *Identity;

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







	[CCode (cname = "sfRenderStates")]
	public struct RenderStates{
		BlendMode      blendMode; ///< Blending mode
		Transform      transform; ///< Transform
		Texture texture;   ///< Texture
		Shader  shader;    ///< Shader

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

    [CCode (ref_function = "sfRenderWindow_create", unref_function = "sfRenderWindow_destroy", cheader_filename = "SFML/Window.h")]
	public class RenderWindow{
		[CCode (destroy_function = "sfRenderWindow_destroy", cname = "sfRenderWindow_create")]
		public RenderWindow(VideoMode mode, string title, sf.WindowStyle flags = WindowStyle.DefaultStyle, ContextSettings? settings = null);
		[CCode (destroy_function = "sfRenderWindow_createUnicode", cname = "sfRenderWindow_create")]
		public RenderWindow.with_unicode(VideoMode mode, uint32 *title, sf.WindowStyle flags, ContextSettings? settings = null);
		[CCode (cname = "sfRenderWindow_setTitle")]
		public void set_title(string title);
		[CCode (cname = "sfRenderWindow_close")]
		public void close();
		[CCode (cname = "sfRenderWindow_isOpen")]
		public bool isOpen();
		[CCode (cname = "sfRenderWindow_getSettings")]
		public ContextSettings getSettings();
		[CCode (cname = "sfRenderWindow_pollEvent")]
		public bool pollEvent(out sf.Event event);
		[CCode (cname = "sfRenderWindow_pollEvent")]
		public bool waitEvent(out sf.Event event);
		[CCode (cname = "sfRenderWindow_getPosition")]
		public Vector2i getPosition();
		[CCode (cname = "sfRenderWindow_setPosition")]
		public void setPosition(Vector2i position);
		[CCode (cname = "sfRenderWindow_getSize")]
		public Vector2u getSize();
		[CCode (cname = "sfRenderWindow_setSize")]
		public void setSize(Vector2u size);
		[CCode (cname = "sfRenderWindow_setUnicodeTitle")]
		void setUnicodeTitle(uint32 []title);
		[CCode (cname = "sfRenderWindow_setIcon")]
		void setIcon(uint width, uint height,  uint8 []pixels);
		[CCode (cname = "sfRenderWindow_setVisible")]
		void setVisible(bool visible);
		[CCode (cname = "sfRenderWindow_setVerticalSyncEnabled")]
		void setVerticalSyncEnabled(bool enabled);
		[CCode (cname = "sfRenderWindow_setMouseCursorVisible")]
		void setMouseCursorVisible(bool show);
		[CCode (cname = "sfRenderWindow_setMouseCursorGrabbed")]
		void setMouseCursorGrabbed(bool grabbed);
		[CCode (cname = "sfRenderWindow_setKeyRepeatEnabled")]
		void setKeyRepeatEnabled(bool enabled);
		

		[CCode (cname = "sfRenderWindow_getUnicodeTitle")]
		uint32 []getUnicodeTitle();
		[CCode (cname = "sfRenderWindow_getVisible")]
		bool getVisible();
		[CCode (cname = "sfRenderWindow_getVerticalSyncEnabled")]
		bool getVerticalSyncEnabled();
		[CCode (cname = "sfRenderWindow_getMouseCursorVisible")]
		bool getMouseCursorVisible();
		[CCode (cname = "sfRenderWindow_getMouseCursorGrabbed")]
		bool getMouseCursorGrabbed();
		[CCode (cname = "sfRenderWindow_getKeyRepeatEnabled")]
		bool getKeyRepeatEnabled();
		
		// [CCode (cname = "sfRenderWindow_setView")]
		// void setView(sfView view);
		// [CCode (cname = "sfRenderWindow_sfView ")]
		// sfView getView();
		// [CCode (cname = "sfRenderWindow_getDefaultView")]
		// sfView getDefaultView();
// [CCode (cname = "sfRenderWindow_getViewport")]
	// IntRect getViewport(View view);
// [CCode (cname = "sfRenderWindow_mapPixelToCoords")]
	// Vector2f mapPixelToCoords(Vector2i point, View view);
		// TODO void setMouseCursor(sfCursor cursor);
// [CCode (cname = "sfRenderWindow_mapCoordsToPixel")]
		// Vector2i mapCoordsToPixel(Vector2f point, sfView view);






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
		public string title{
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
		//TODO
		// CSFML_GRAPHICS_API sfContextSettings sfRenderWindow_getSettings(const sfRenderWindow* renderWindow);

		[CCode (cname = "sfRenderWindow_setFramerateLimit")]
		public void setFramerateLimit(uint limit);
		[CCode (cname = "sfRenderWindow_setJoystickThreshold")]
		public void setJoystickThreshold(float threshold);	
		[CCode (cname = "sfRenderWindow_setActive")]
		public bool setActive(bool active);
		[CCode (cname = "sfRenderWindow_requestFocus")]
		public void requestFocus();
		[CCode (cname = "sfRenderWindow_hasFocus")]
		public bool hasFocus();
		[CCode (cname = "sfRenderWindow_display")]
	    public void display();
	    [CCode (cname = "sfRenderWindow_clear")]
	    public void clear(Color color = {0,0,0});
	    // [CCode (cname = "sfRenderWindow_drawSprite")]
	    // public void draw_sprite(Sprite sprite, int ?a = null);
	    // [CCode (cname = "sfRenderWindow_drawShape")]
	    // public void draw_shape(RectangleShape shape, int ?a = null);
	    // [CCode (cname = "sfRenderWindow_drawCircleShape")]
	    // public void draw_circle(CircleShape shape, int ?a = null);

[CCode (cname = "sfRenderWindow_drawSprite")]
public void drawSprite(Sprite object, RenderStates? states = null);
[CCode (cname = "sfRenderWindow_drawText")]
public void drawText(Text object, RenderStates? states = null);
// [CCode (cname = "sfRenderWindow_drawShape")]
// public void drawShape(Shape object, RenderStates? states = null);
[CCode (cname = "sfRenderWindow_drawCircleShape")]
public void drawCircleShape(CircleShape object, RenderStates? states = null);
// [CCode (cname = "sfRenderWindow_drawConvexShape")]
// public void drawConvexShape(ConvexShape object, RenderStates? states = null);
[CCode (cname = "sfRenderWindow_drawRectangleShape")]
public void drawRectangleShape(RectangleShape object, RenderStates? states = null);
// [CCode (cname = "sfRenderWindow_drawVertexArray")]
// public void drawVertexArray(VertexArray object, RenderStates? states = null);
// [CCode (cname = "sfRenderWindow_drawVertexBuffer")]
// public void drawVertexBuffer(VertexBuffer object, RenderStates? states = null);



	    //TODO windowshandle
	}
	[CCode (cname = "int", cprefix = "sf", has_type_id = false)]
    public enum WindowStyle
    {
        None,
        Titlebar,
        Resize,
        Close,
        Fullscreen,
        DefaultStyle
    }
    [CCode (cname = "int", cprefix = "sf", has_type_id = false)]
    public enum ContextAttribute
    {
        ContextDefault,
        ContextCore,
        ContextDebug
    }
    [CCode (cname = "sfContextSettings", has_type_id = false)]
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
    /*              //TODO context
public Context* sfContext_create(void);

public void sfContext_destroy(sfContext* context);

public sfBool sfContext_setActive(sfContext* context, sfBool active);

public sfContextSettings sfContext_getSettings(const sfContext* context);

public sfUint64 sfContext_getActiveContextId();*/

    /* *****************************    EVENT    ************************************************/
    [CCode (cname = "int", cprefix = "sfKey", has_type_id = false)]
    public enum KeyCode
    {
        Unknown = -1, ///< Unhandled 
        A,            ///< The A 
        B,            ///< The B 
        C,            ///< The C 
        D,            ///< The D 
        E,            ///< The E 
        F,            ///< The F 
        G,            ///< The G 
        H,            ///< The H 
        I,            ///< The I 
        J,            ///< The J 
        K,            ///< The K 
        L,            ///< The L 
        M,            ///< The M 
        N,            ///< The N 
        O,            ///< The O 
        P,            ///< The P 
        Q,            ///< The Q 
        R,            ///< The R 
        S,            ///< The S 
        T,            ///< The T 
        U,            ///< The U 
        V,            ///< The V 
        W,            ///< The W 
        X,            ///< The X 
        Y,            ///< The Y 
        Z,            ///< The Z 
        Num0,         ///< The 0 
        Num1,         ///< The 1 
        Num2,         ///< The 2 
        Num3,         ///< The 3 
        Num4,         ///< The 4 
        Num5,         ///< The 5 
        Num6,         ///< The 6 
        Num7,         ///< The 7 
        Num8,         ///< The 8 
        Num9,         ///< The 9 
        Escape,       ///< The Escape 
        LControl,     ///< The left Control 
        LShift,       ///< The left Shift 
        LAlt,         ///< The left Alt 
        LSystem,      ///< The left OS specific : window (Windows and Linux), apple (MacOS X), ...
        RControl,     ///< The right Control 
        RShift,       ///< The right Shift 
        RAlt,         ///< The right Alt 
        RSystem,      ///< The right OS specific : window (Windows and Linux), apple (MacOS X), ...
        Menu,         ///< The Menu 
        LBracket,     ///< The [ 
        RBracket,     ///< The ] 
        Semicolon,    ///< The ; 
        Comma,        ///< The , 
        Period,       ///< The . 
        Quote,        ///< The ' 
        Slash,        ///< The / 
        Backslash,    ///< The \ 
        Tilde,        ///< The ~ 
        Equal,        ///< The = 
        Hyphen,       ///< The -  (hyphen)
        Space,        ///< The Space 
        Enter,        ///< The Enter/Return 
        Backspace,    ///< The Backspace 
        Tab,          ///< The Tabulation 
        PageUp,       ///< The Page up 
        PageDown,     ///< The Page down 
        End,          ///< The End 
        Home,         ///< The Home 
        Insert,       ///< The Insert 
        Delete,       ///< The Delete 
        Add,          ///< The + 
        Subtract,     ///< The -  (minus, usually from numpad)
        Multiply,     ///< The * 
        Divide,       ///< The / 
        Left,         ///< Left arrow
        Right,        ///< Right arrow
        Up,           ///< Up arrow
        Down,         ///< Down arrow
        Numpad0,      ///< The numpad 0 
        Numpad1,      ///< The numpad 1 
        Numpad2,      ///< The numpad 2 
        Numpad3,      ///< The numpad 3 
        Numpad4,      ///< The numpad 4 
        Numpad5,      ///< The numpad 5 
        Numpad6,      ///< The numpad 6 
        Numpad7,      ///< The numpad 7 
        Numpad8,      ///< The numpad 8 
        Numpad9,      ///< The numpad 9 
        F1,           ///< The F1 
        F2,           ///< The F2 
        F3,           ///< The F3 
        F4,           ///< The F4 
        F5,           ///< The F5 
        F6,           ///< The F6 
        F7,           ///< The F7 
        F8,           ///< The F8 
        F9,           ///< The F8 
        F10,          ///< The F10 
        F11,          ///< The F11 
        F12,          ///< The F12 
        F13,          ///< The F13 
        F14,          ///< The F14 
        F15,          ///< The F15 
        Pause,        ///< The Pause 
        Count,      ///< Keep last -- the total number of board s
        // Deprecated values:
        Dash      = Hyphen,       ///< \deprecated Use Hyphen instead
        Back      = Backspace,    ///< \deprecated Use Backspace instead
        BackSlash = Backslash,    ///< \deprecated Use Backslash instead
        SemiColon = Semicolon,    ///< \deprecated Use Semicolon instead
        Return    = Enter
    }
    [CCode (cname = "sfKeyboard_isKeyPressed")]
    public bool keyboard_isKeyPressed(KeyCode key);
    [CCode (cname = "sfKeyboard_setVirtualKeyboardVisible")]
    public void keyboard_setVirtualKeyboardVisible(bool visible);
    [CCode (cname = "int", cprefix = "sfEvt", has_type_id = false)]
    public enum EventType {
        Closed,
        Resized,
        LostFocus,
        GainedFocus,
        TextEntered,
        KeyPressed,
        KeyReleased,
        MouseWheelMoved,
        MouseWheelScrolled,
        MouseButtonPressed,
        MouseButtonReleased,
        MouseMoved,
        MouseEntered,
        MouseLeft,
        JoystickButtonPressed,
        JoystickButtonReleased,
        JoystickMoved,
        JoystickConnected,
        JoystickDisconnected,
        TouchBegan,
        TouchMoved,
        TouchEnded,
        SensorChanged,
        Count
    }
    [CCode (cname = "sfKeyEvent", has_type_id = false)]
    [SimpleType]
    public struct KeyEvent{
        sf.EventType type;
        uint32   code;//TODO
        bool      alt;
        bool      control;
        bool      shift;
        bool      system;
    }
    [CCode (cname = "sfTextEvent", has_type_id = false)]
    [SimpleType]
    public struct TextEvent{
        sf.EventType type;
        uint32 unicode;
    }
    [CCode (cname = "sfMouseMoveEvent", has_type_id = false)]
    [SimpleType]
    public struct MouseMoveEvent{
        sf.EventType type;
        int x;
        int y;
    }
    [CCode (cname = "sfMouseButtonEvent", has_type_id = false)]
    [SimpleType]
    public struct MouseButtonEvent
    {
        EventType   type;
        //TODO MouseButton button;
        int x;
        int y;
    }
    [CCode (cname = "sfMouseWheelEvent", has_type_id = false)]
    [SimpleType]
    public struct MouseWheelEvent
    {
        EventType type;
        int delta;
        int x;
        int y;
    }
    [CCode (cname = "sfMouseWheelScrollEvent", has_type_id = false)]
    [SimpleType]
    public struct MouseWheelScrollEvent
    {
        EventType  type;
        //TODO MouseWheel wheel;
        float delta;
        int x;
        int y;
    }

    [CCode (cname = "int", cprefix = "sfCursor", has_type_id = false)]
    public enum CursorType
    {
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
    
    [CCode (cname = "int", cprefix = "sfJoystick", has_type_id = false)]
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

    [CCode (cname = "sfJoystick_isConnected")]
    public bool Joystick_isConnected(uint joystick);
    [CCode (cname = "sfJoystick_getButtonCount")]
    public uint Joystick_getButtonCount(uint joystick);
    [CCode (cname = "sfJoystick_hasAxis")]
    public bool Joystick_hasAxis(uint joystick, JoystickAxis axis);
    [CCode (cname = "sfJoystick_isButtonPressed")]
    public bool Joystick_isButtonPressed(uint joystick, uint button);
    [CCode (cname = "sfJoystick_getAxisPosition")]
    public float Joystick_getAxisPosition(uint joystick, JoystickAxis axis);
    [CCode (cname = "sfJoystick_getIdentification")]
    public JoystickIdentification Joystick_getIdentification(uint joystick);
    [CCode (cname = "sfJoystick_update")]
    public void Joystick_update();
        
    [CCode (cname = "sfJoystickIdentification")]
    public struct JoystickIdentification
    {
        string name;
        uint vendorId;
        uint productId;
    }
    [CCode (cname = "sfJoystickMoveEvent", has_type_id = false)]
    [SimpleType]
    public struct JoystickMoveEvent
    {
        EventType    type;
        uint   joystickId;
        //TODO sfJoystickAxis axis;
        float position;
    }
    [CCode (cname = "sfJoystickButtonEvent", has_type_id = false)]
    [SimpleType]
    public struct JoystickButtonEvent
    {
        EventType type;
        uint joystickId;
        uint button;
    }
    [CCode (cname = "sfJoystickConnectEvent", has_type_id = false)]
    [SimpleType]
    public struct JoystickConnectEvent
    {
        EventType type;
        uint joystickId;
    }
    [CCode (cname = "sfSizeEvent", has_type_id = false)]
    public struct SizeEvent
    {
        EventType type;
        uint width;
        uint height;
    }
    [CCode (cname = "sfTouchEvent", has_type_id = false)]
    [SimpleType]
    public struct TouchEvent
    {
        EventType type;
        uint finger;
        int x;
        int y;
    }
    [CCode (cname = "sfSensorEvent", has_type_id = false)]
    [SimpleType]
    public struct SensorEvent
    {
        EventType type;
        //TODO SensorType sensorType;
        float x;
        float y;
        float z;
    }
    [CCode (cname = "int", cprefix = "sfMouse", has_type_id = false)]
    public enum MouseButton
    {
        Left,       ///< The left mouse button
        Right,      ///< The right mouse button
        Middle,     ///< The middle (wheel) mouse button
        Button1,   ///< The first extra mouse button
        Button2,   ///< The second extra mouse button
        ButtonCount ///< Keep last -- the total number of mouse buttons
    }

    [CCode (cname = "int", has_type_id = false)]
    public enum MouseWheel
    {
        [CCode (cname = "sfMouseVerticalWheel", has_type_id = false)]
        Vertical,
        [CCode (cname = "sfMouseHorizontalWheel", has_type_id = false)]
        Horizontal
    }
    
    [CCode (cname = "sfMouse_isButtonPressed")]
    public bool Mouse_isButtonPressed(MouseButton button);
    [CCode (cname = "sfMouse_getPosition")]
    public Vector2i? Mouse_getPosition(ref RenderWindow relativeTo);
    [CCode (cname = "sfMouse_setPosition")]
    public void Mouse_setPosition(Vector2i position, ref RenderWindow relativeTo);
    
    [CCode (cname = "int", cprefix = "sfSensor", has_type_id = false)]
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
    [CCode (cname = "sfSensor_isAvailable")]
    public bool? Sensor_isAvailable(SensorType sensor);
    [CCode (cname = "sfSensor_setEnabled")]
    public void Sensor_setEnabled(SensorType sensor, bool enabled);
    [CCode (cname = "sfSensor_getValue")]
    public Vector3f? Sensor_getValue(SensorType sensor);
    [CCode (cname = "sfTouch_isDown")]
    public bool? Touch_isDown(uint finger);
    [CCode (cname = "sfTouch_getPosition")]
    public Vector2i? Touch_getPosition(uint finger, ref RenderWindow relativeTo);
    
    [CCode (cname = "sfEvent", default_value ="{-42}")]
    [SimpleType]
    public struct Event{
        [CCode (cname = "type")]
        public EventType type;
        [CCode (cname = "size")]
        public SizeEvent size;
        [CCode (cname = "key")]
        public KeyEvent key;
        [CCode (cname = "text")]
        public TextEvent text;
        public MouseMoveEvent        mouseMove;
        public MouseButtonEvent      mouseButton;
        public MouseWheelEvent       mouseWheel;
        public MouseWheelScrollEvent mouseWheelScroll;
        public JoystickMoveEvent     joystickMove;
        public JoystickButtonEvent   joystickButton;
        public JoystickConnectEvent  joystickConnect;
        public TouchEvent            touch;
        public SensorEvent           sensor;
    }
}
