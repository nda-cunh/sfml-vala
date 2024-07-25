namespace sf {

	[CCode (cname="HttpMethod", cprefix="sfHttp")]
	public enum HttpMethod
	{
		Get,   
		Post,  
		Head,  
		Put,   
		Delete 
	}

	[CCode (cname="sfHttpStatus", cprefix="sfHttp")]
	public enum HttpStatus
	{
		// 2xx: success
		Ok, 
		Created, 
		Accepted, 
		NoContent, 
		ResetContent, 
		PartialContent, 

		// 3xx: redirection
		MultipleChoices, 
		MovedPermanently, 
		MovedTemporarily, 
		NotModified, 

		// 4xx: client error
		BadRequest, 
		Unauthorized, 
		Forbidden, 
		NotFound, 
		RangeNotSatisfiable, 

		// 5xx: server error
		InternalServerError, 
		NotImplemented, 
		BadGateway, 
		ServiceNotAvailable, 
		GatewayTimeout, 
		VersionNotSupported, 

		// 10xx: SFML custom codes
		InvalidResponse, 
		ConnectionFailed
	}

	[CCode (cname="sfHttpRequest", free_function="sfHttpRequest_destroy", cprefix="sfHttpRequest_")]
	[Compact]
	public class HttpRequest
	{
		[CCode(cname="sfHttpRequest_create")]
		public HttpRequest();

		public void setField(string field, string value);

		public void setMethod(HttpMethod method);

		public void setUri(out HttpRequest httpRequest, string uri);

		public void setHttpVersion(HttpRequest httpRequest, uint major, uint minor);

		public void setBody(out HttpRequest httpRequest, string body);

	}

	[CCode (cname="sfHttpResponse", free_function="sfHttpResponse_destroy", cprefix="sfHttpResponse_")]
	[Compact]
	public class HttpResponse {
		public string sfHttpResponse_getField(string field);
		public HttpStatus sfHttpResponse_getStatus();
		public uint sfHttpResponse_getMajorVersion();
		public uint sfHttpResponse_getMinorVersion();
		public string sfHttpResponse_getBody();
	}
		
	[CCode (cname="sfHttp", free_function="sfHttp_destroy", cprefix="sfHttp_")]
	[Compact]
	public class Http{
		[CCode (cname="sfHttp_create")]
		public Http();
		public void setHost(string host, ushort port);
		public HttpResponse sendRequest(HttpRequest request, Time timeout);
	}

	[CCode(cname="sfSocketStatus", cprefix="sfSocket")]
	public enum SocketStatus
	{
		Done,         ///< The socket has sent / received the data
		NotReady,     ///< The socket is not ready to send / receive data yet
		Partial,      ///< The socket sent a part of the data
		Disconnected, ///< The TCP socket has been disconnected
		Error         ///< An unexpected error happened
	}

	[CCode(cname="sfIpAddress")]
	[SimpleType]
	public struct IpAddress
	{
		/* Const */
		[CCode(cname="sfIpAddress_None")]
		public const IpAddress None;
		[CCode(cname="sfIpAddress_Any")]
		public const IpAddress Any;
		[CCode(cname="sfIpAddress_LocalHost")]
		public const IpAddress LocalHost;
		[CCode(cname="sfIpAddress_Broadcast")]
		public const IpAddress Broadcast;

		/* Function */
		[CCode (cname="sfIpAddress_fromString")]
		public IpAddress.fromString(string address);
		[CCode (cname="sfIpAddress_getPublicAddress")]
		public IpAddress.getPublicAddress(Time timeout);
		[CCode (cname="sfIpAddress_fromBytes")]
		public IpAddress.fromBytes(uint8 byte0, uint8 byte1, uint8 byte2, uint8 byte3);
		[CCode (cname="sfIpAddress_fromInteger")]
		public IpAddress.fromInteger(uint32 address);
		[CCode (cname="sfIpAddress_getLocalAddress")]
		public IpAddress.getLocalAddress();

		[CCode (cname="sfIpAddress_toString")]
		public void toString(out string str);
		[CCode (cname="sfIpAddress_toInteger")]
		public uint32 toInteger();
		
		/* property */
		uint8 address[16];
	}


	[CCode(cname="sfPacket", free_function="sfPacket_destroy", cprefix="sfPacket_")]
	[Compact]
	public class Packet {
		[CCode(cname="sfPacket_create")]
		public Packet();

		public Packet copy();

		public void append(void* data, size_t sizeInBytes);
		public size_t getReadPosition();
		public void clear();
		public void* getData();
		public size_t getDataSize();
		public bool endOfPacket();
		public bool canRead();

		public bool readBool();
		public int8 readInt8();
		public uint8 readUint8();
		public int16 readInt16();
		public uint16 readUint16();
		public int32 readInt32();
		public uint32 readUint32();
		public float readFloat();
		public double readDouble();
		public void readString(string str);

		public void writeBool(bool value);
		public void writeInt8(int8 value);
		public void writeUint8(uint8 value);
		public void writeInt16(int16 value);
		public void writeUint16(uint16 value);
		public void writeInt32(int32 value);
		public void writeUint32(uint32 value);
		public void writeFloat(float value);
		public void writeDouble(double value);
		public void writeString(string str);
	}

	[CCode (cname="sfUdpSocket", free_function="sfUdpSocket_destroy", cprefix="sfUdpSocket_")]
	[Compact]
	public class UdpSocket{

		[CCode(cname="sfUdpSocket_create")]
		public UdpSocket();

		public void setBlocking(bool blocking);
		public bool isBlocking();
		public ushort getLocalPort();
		public SocketStatus bind(ushort port, IpAddress address);
		public void unbind();
		public SocketStatus send(void* data, size_t size, IpAddress remoteAddress, ushort remotePort);
		public SocketStatus receive(void* data, size_t size, out size_t received, IpAddress remoteAddress, out ushort remotePort);
		public SocketStatus sendPacket(Packet packet, IpAddress remoteAddress, ushort remotePort);
		public SocketStatus receivePacket(Packet packet, IpAddress remoteAddress, ushort* remotePort);
		public uint maxDatagramSize();
	}

	[CCode (cname="sfTcpSocket", free_function="sfTcpSocket_destroy", cprefix="sfTcpSocket_")]
	[Compact]
	public class TcpSocket{
		[CCode(cname="sfTcpSocket_create")]
		public TcpSocket ();

		public void setBlocking(bool blocking);
		public bool isBlocking();
		public ushort getLocalPort();
		public IpAddress getRemoteAddress();
		public ushort getRemotePort();
		public SocketStatus connect(IpAddress remoteAddress, ushort remotePort, Time timeout);
		public void disconnect();
		public SocketStatus send(void* data, size_t size);
		public SocketStatus sendPartial(void* data, size_t size, out size_t sent);
		public SocketStatus receive(void* data, size_t size, out size_t received);
		public SocketStatus sendPacket(Packet packet);
		public SocketStatus receivePacket(Packet packet);
	}

	[CCode (cname="sfTcpListener", free_function="sfTcpListener_destroy", cprefix="sfTcpListener_")]
	[Compact]
	public class TcpListener{
		[CCode(cname="sfTcpListener_create")]
		public TcpListener();

		public void setBlocking(bool blocking);
		public bool isBlocking();
		public ushort getLocalPort();
		public SocketStatus listen(ushort port, IpAddress address);
		public SocketStatus accept(out TcpSocket[] connected);
	}

	// TODO FTP

}
