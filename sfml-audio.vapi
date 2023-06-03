namespace sf {
void sfListener_setGlobalVolume(float volume);

float sfListener_getGlobalVolume(void);

void sfListener_setPosition(sfVector3f position);

sfVector3f sfListener_getPosition();

void sfListener_setDirection(sfVector3f direction);

sfVector3f sfListener_getDirection();

void sfListener_setUpVector(sfVector3f upVector);

sfVector3f sfListener_getUpVector();
}







[CCode (cname = "sfTimeSpan")]
public struct TimeSpan
{
Time offset;
Time length; 
}

sfMusic* sfMusic_createFromFile(const char* filename);
sfMusic* sfMusic_createFromMemory(const void* data, size_t sizeInBytes);
sfMusic* sfMusic_createFromStream(sfInputStream* stream);
void sfMusic_destroy(sfMusic* music);
void sfMusic_setLoop(sfMusic* music, sfBool loop);
sfBool sfMusic_getLoop(const sfMusic* music);
sfTime sfMusic_getDuration(const sfMusic* music);
sfTimeSpan sfMusic_getLoopPoints(const sfMusic* music);
void sfMusic_setLoopPoints(sfMusic* music, sfTimeSpan timePoints);
void sfMusic_play(sfMusic* music);
void sfMusic_pause(sfMusic* music);
void sfMusic_stop(sfMusic* music);
unsigned int sfMusic_getChannelCount(const sfMusic* music);
unsigned int sfMusic_getSampleRate(const sfMusic* music);
sfSoundStatus sfMusic_getStatus(const sfMusic* music);
sfTime sfMusic_getPlayingOffset(const sfMusic* music);
void sfMusic_setPitch(sfMusic* music, float pitch);
void sfMusic_setVolume(sfMusic* music, float volume);
void sfMusic_setPosition(sfMusic* music, sfVector3f position);
void sfMusic_setRelativeToListener(sfMusic* music, sfBool relative);
void sfMusic_setMinDistance(sfMusic* music, float distance);
void sfMusic_setAttenuation(sfMusic* music, float attenuation);
void sfMusic_setPlayingOffset(sfMusic* music, sfTime timeOffset);
float sfMusic_getPitch(const sfMusic* music);
float sfMusic_getVolume(const sfMusic* music);
sfVector3f sfMusic_getPosition(const sfMusic* music);
sfBool sfMusic_isRelativeToListener(const sfMusic* music);
float sfMusic_getMinDistance(const sfMusic* music);
float sfMusic_getAttenuation(const sfMusic* music);

{

sfSound* sfSound_create(void);
sfSound* sfSound_copy(const sfSound* sound);
void sfSound_destroy(sfSound* sound);
void sfSound_play(sfSound* sound);
void sfSound_pause(sfSound* sound);
void sfSound_stop(sfSound* sound);
void sfSound_setBuffer(sfSound* sound, const sfSoundBuffer* buffer);
const sfSoundBuffer* sfSound_getBuffer(const sfSound* sound);
void sfSound_setLoop(sfSound* sound, sfBool loop);
sfBool sfSound_getLoop(const sfSound* sound);
sfSoundStatus sfSound_getStatus(const sfSound* sound);
void sfSound_setPitch(sfSound* sound, float pitch);
void sfSound_setVolume(sfSound* sound, float volume);
void sfSound_setPosition(sfSound* sound, sfVector3f position);
void sfSound_setRelativeToListener(sfSound* sound, sfBool relative);
void sfSound_setMinDistance(sfSound* sound, float distance);
void sfSound_setAttenuation(sfSound* sound, float attenuation);
void sfSound_setPlayingOffset(sfSound* sound, sfTime timeOffset);
float sfSound_getPitch(const sfSound* sound);
float sfSound_getVolume(const sfSound* sound);
sfVector3f sfSound_getPosition(const sfSound* sound);
sfBool sfSound_isRelativeToListener(const sfSound* sound);
float sfSound_getMinDistance(const sfSound* sound);
float sfSound_getAttenuation(const sfSound* sound);
sfTime sfSound_getPlayingOffset(const sfSound* sound);
}







{
	sfSoundBuffer* sfSoundBuffer_createFromFile(const char* filename);

sfSoundBuffer* sfSoundBuffer_createFromMemory(const void* data, size_t sizeInBytes);

sfSoundBuffer* sfSoundBuffer_createFromStream(sfInputStream* stream);

sfSoundBuffer* sfSoundBuffer_createFromSamples(const sfInt16* samples, sfUint64 sampleCount, unsigned int channelCount, unsigned int sampleRate);

sfSoundBuffer* sfSoundBuffer_copy(const sfSoundBuffer* soundBuffer);

void sfSoundBuffer_destroy(sfSoundBuffer* soundBuffer);

sfBool sfSoundBuffer_saveToFile(const sfSoundBuffer* soundBuffer, const char* filename);

const sfInt16* sfSoundBuffer_getSamples(const sfSoundBuffer* soundBuffer);

sfUint64 sfSoundBuffer_getSampleCount(const sfSoundBuffer* soundBuffer);

unsigned int sfSoundBuffer_getSampleRate(const sfSoundBuffer* soundBuffer);

unsigned int sfSoundBuffer_getChannelCount(const sfSoundBuffer* soundBuffer);

sfTime sfSoundBuffer_getDuration(const sfSoundBuffer* soundBuffer);
}


}
