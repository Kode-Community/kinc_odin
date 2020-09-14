INC=-I./ -I../../Sources -I../../Backends/System/Linux/Sources -I../../Backends/System/POSIX/Sources -I../../Backends/Graphics4/OpenGL/Sources -I../../Backends/Graphics5/G5onG4/Sources -I../../Backends/Audio3/A3onA2/Sources 
LIB=-static-libgcc -static-libstdc++ -pthread -lasound -ldl -lX11 -lXcursor -lXinerama -lXrandr -lXi -lGL
DEF=-DKORE_G1 -DKORE_G2 -DKORE_G3 -DKORE_A1 -DKORE_A2 -DKORE_LZ4X -DKORE_LINUX -DKORE_OPENGL -DKORE_POSIX -DKORE_G4 -DKORE_G5 -DKORE_G5ONG4 -DKORE_A3 -DKINC_NO_MAIN -DKINC_DYNAMIC_COMPILE 

CFLAGS=-std=c99 -fPIC 
CPPFLAGS=-fPIC 
Kinc.so: audio.o texttospeech.winrt.o glew.o computeimpl.o indexbufferimpl.o opengl.o openglwindow.o pipelinestateimpl.o rendertargetandroid.o rendertargetimpl.o shaderimpl.o shaderstoragebufferimpl.o texturearrayimpl.o textureimpl.o vertexbufferimpl.o vrinterface.o commandlist5impl.o constantbuffer5impl.o g5ong4.o indexbuffer5impl.o pipelinestate5impl.o rendertarget5impl.o shader5impl.o texture5impl.o vertexbuffer5impl.o display.o display_xrandr.o display_xinerama.o sound.o system.o window.o gamepad.o mouse.o event.o mutex.o semaphore.o thread.o threadlocal.o convert.o display_.o error.o log.o system_.o window_.o audio_.o sound_.o soundstream.o audio__.o audio___.o compute.o color.o graphics.o image.o graphics_.o kravur.o graphics__.o texture.o graphics___.o indexbuffer.o pipelinestate.o rendertarget.o shader.o texture_.o texturearray.o vertexbuffer.o commandlist.o constantbuffer.o graphics____.o pipelinestate_.o texture__.o bufferreader.o filereader.winrt.o filewriter.o reader.o writer.o gamepad_.o keyboard.o mouse_.o pen.o sensor.o surface.o core.o quaternion.o random.o connection.o http.o socket.o event_.o mutex_.o semaphore_.o thread_.o threadlocal_.o cameraimage.o sensorstate.o vrinterface_.o vrpose.o vrposestate.o bridge.o color_.o error_.o image_.o log_.o system__.o window__.o audio____.o sound__.o soundstream_.o stb_vorbis.o audio_____.o graphics_____.o graphics______.o pipeline.o vertexbuffer_.o commandlist_.o constantbuffer_.o graphics_______.o pipeline_.o texture___.o acceleration.o gamepad__.o keyboard_.o mouse__.o pen_.o rotation.o surface_.o filereader.winrt_.o filewriter_.o lz4x.o core_.o matrix.o random_.o http_.o socket_.o 
	g++ -shared -o "Kinc.so"  -O2 audio.o texttospeech.winrt.o glew.o computeimpl.o indexbufferimpl.o opengl.o openglwindow.o pipelinestateimpl.o rendertargetandroid.o rendertargetimpl.o shaderimpl.o shaderstoragebufferimpl.o texturearrayimpl.o textureimpl.o vertexbufferimpl.o vrinterface.o commandlist5impl.o constantbuffer5impl.o g5ong4.o indexbuffer5impl.o pipelinestate5impl.o rendertarget5impl.o shader5impl.o texture5impl.o vertexbuffer5impl.o display.o display_xrandr.o display_xinerama.o sound.o system.o window.o gamepad.o mouse.o event.o mutex.o semaphore.o thread.o threadlocal.o convert.o display_.o error.o log.o system_.o window_.o audio_.o sound_.o soundstream.o audio__.o audio___.o compute.o color.o graphics.o image.o graphics_.o kravur.o graphics__.o texture.o graphics___.o indexbuffer.o pipelinestate.o rendertarget.o shader.o texture_.o texturearray.o vertexbuffer.o commandlist.o constantbuffer.o graphics____.o pipelinestate_.o texture__.o bufferreader.o filereader.winrt.o filewriter.o reader.o writer.o gamepad_.o keyboard.o mouse_.o pen.o sensor.o surface.o core.o quaternion.o random.o connection.o http.o socket.o event_.o mutex_.o semaphore_.o thread_.o threadlocal_.o cameraimage.o sensorstate.o vrinterface_.o vrpose.o vrposestate.o bridge.o color_.o error_.o image_.o log_.o system__.o window__.o audio____.o sound__.o soundstream_.o stb_vorbis.o audio_____.o graphics_____.o graphics______.o pipeline.o vertexbuffer_.o commandlist_.o constantbuffer_.o graphics_______.o pipeline_.o texture___.o acceleration.o gamepad__.o keyboard_.o mouse__.o pen_.o rotation.o surface_.o filereader.winrt_.o filewriter_.o lz4x.o core_.o matrix.o random_.o http_.o socket_.o  $(LIB)

audio.o: ../../Backends/Audio3/A3onA2/Sources/Kore/Audio.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/Audio3/A3onA2/Sources/Kore/Audio.cpp -o audio.o

texttospeech.winrt.o: ../../Backends/Audio3/A3onA2/Sources/Kore/TextToSpeech.winrt.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/Audio3/A3onA2/Sources/Kore/TextToSpeech.winrt.cpp -o texttospeech.winrt.o

glew.o: ../../Backends/Graphics4/OpenGL/Sources/GL/glew.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/GL/glew.c -o glew.o

computeimpl.o: ../../Backends/Graphics4/OpenGL/Sources/Kore/ComputeImpl.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/Kore/ComputeImpl.cpp -o computeimpl.o

indexbufferimpl.o: ../../Backends/Graphics4/OpenGL/Sources/Kore/IndexBufferImpl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/Kore/IndexBufferImpl.c -o indexbufferimpl.o

opengl.o: ../../Backends/Graphics4/OpenGL/Sources/Kore/OpenGL.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/Kore/OpenGL.cpp -o opengl.o

openglwindow.o: ../../Backends/Graphics4/OpenGL/Sources/Kore/OpenGLWindow.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/Kore/OpenGLWindow.c -o openglwindow.o

pipelinestateimpl.o: ../../Backends/Graphics4/OpenGL/Sources/Kore/PipelineStateImpl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/Kore/PipelineStateImpl.c -o pipelinestateimpl.o

rendertargetandroid.o: ../../Backends/Graphics4/OpenGL/Sources/Kore/RenderTargetAndroid.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/Kore/RenderTargetAndroid.cpp -o rendertargetandroid.o

rendertargetimpl.o: ../../Backends/Graphics4/OpenGL/Sources/Kore/RenderTargetImpl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/Kore/RenderTargetImpl.c -o rendertargetimpl.o

shaderimpl.o: ../../Backends/Graphics4/OpenGL/Sources/Kore/ShaderImpl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/Kore/ShaderImpl.c -o shaderimpl.o

shaderstoragebufferimpl.o: ../../Backends/Graphics4/OpenGL/Sources/Kore/ShaderStorageBufferImpl.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/Kore/ShaderStorageBufferImpl.cpp -o shaderstoragebufferimpl.o

texturearrayimpl.o: ../../Backends/Graphics4/OpenGL/Sources/Kore/TextureArrayImpl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/Kore/TextureArrayImpl.c -o texturearrayimpl.o

textureimpl.o: ../../Backends/Graphics4/OpenGL/Sources/Kore/TextureImpl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/Kore/TextureImpl.c -o textureimpl.o

vertexbufferimpl.o: ../../Backends/Graphics4/OpenGL/Sources/Kore/VertexBufferImpl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/Kore/VertexBufferImpl.c -o vertexbufferimpl.o

vrinterface.o: ../../Backends/Graphics4/OpenGL/Sources/Kore/VrInterface.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/Graphics4/OpenGL/Sources/Kore/VrInterface.cpp -o vrinterface.o

commandlist5impl.o: ../../Backends/Graphics5/G5onG4/Sources/Kore/CommandList5Impl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics5/G5onG4/Sources/Kore/CommandList5Impl.c -o commandlist5impl.o

constantbuffer5impl.o: ../../Backends/Graphics5/G5onG4/Sources/Kore/ConstantBuffer5Impl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics5/G5onG4/Sources/Kore/ConstantBuffer5Impl.c -o constantbuffer5impl.o

g5ong4.o: ../../Backends/Graphics5/G5onG4/Sources/Kore/G5onG4.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics5/G5onG4/Sources/Kore/G5onG4.c -o g5ong4.o

indexbuffer5impl.o: ../../Backends/Graphics5/G5onG4/Sources/Kore/IndexBuffer5Impl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics5/G5onG4/Sources/Kore/IndexBuffer5Impl.c -o indexbuffer5impl.o

pipelinestate5impl.o: ../../Backends/Graphics5/G5onG4/Sources/Kore/PipelineState5Impl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics5/G5onG4/Sources/Kore/PipelineState5Impl.c -o pipelinestate5impl.o

rendertarget5impl.o: ../../Backends/Graphics5/G5onG4/Sources/Kore/RenderTarget5Impl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics5/G5onG4/Sources/Kore/RenderTarget5Impl.c -o rendertarget5impl.o

shader5impl.o: ../../Backends/Graphics5/G5onG4/Sources/Kore/Shader5Impl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics5/G5onG4/Sources/Kore/Shader5Impl.c -o shader5impl.o

texture5impl.o: ../../Backends/Graphics5/G5onG4/Sources/Kore/Texture5Impl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics5/G5onG4/Sources/Kore/Texture5Impl.c -o texture5impl.o

vertexbuffer5impl.o: ../../Backends/Graphics5/G5onG4/Sources/Kore/VertexBuffer5Impl.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Backends/Graphics5/G5onG4/Sources/Kore/VertexBuffer5Impl.c -o vertexbuffer5impl.o

display.o: ../../Backends/System/Linux/Sources/Kore/Display.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/System/Linux/Sources/Kore/Display.cpp -o display.o

display_xrandr.o: ../../Backends/System/Linux/Sources/Kore/Display_XRandr.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/System/Linux/Sources/Kore/Display_XRandr.cpp -o display_xrandr.o

display_xinerama.o: ../../Backends/System/Linux/Sources/Kore/Display_Xinerama.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/System/Linux/Sources/Kore/Display_Xinerama.cpp -o display_xinerama.o

sound.o: ../../Backends/System/Linux/Sources/Kore/Sound.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/System/Linux/Sources/Kore/Sound.cpp -o sound.o

system.o: ../../Backends/System/Linux/Sources/Kore/System.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/System/Linux/Sources/Kore/System.cpp -o system.o

window.o: ../../Backends/System/Linux/Sources/Kore/Window.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/System/Linux/Sources/Kore/Window.cpp -o window.o

gamepad.o: ../../Backends/System/Linux/Sources/Kore/Input/Gamepad.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/System/Linux/Sources/Kore/Input/Gamepad.cpp -o gamepad.o

mouse.o: ../../Backends/System/Linux/Sources/Kore/Input/Mouse.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/System/Linux/Sources/Kore/Input/Mouse.cpp -o mouse.o

event.o: ../../Backends/System/POSIX/Sources/Kore/Event.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/System/POSIX/Sources/Kore/Event.cpp -o event.o

mutex.o: ../../Backends/System/POSIX/Sources/Kore/Mutex.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/System/POSIX/Sources/Kore/Mutex.cpp -o mutex.o

semaphore.o: ../../Backends/System/POSIX/Sources/Kore/Semaphore.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/System/POSIX/Sources/Kore/Semaphore.cpp -o semaphore.o

thread.o: ../../Backends/System/POSIX/Sources/Kore/Thread.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/System/POSIX/Sources/Kore/Thread.cpp -o thread.o

threadlocal.o: ../../Backends/System/POSIX/Sources/Kore/ThreadLocal.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Backends/System/POSIX/Sources/Kore/ThreadLocal.cpp -o threadlocal.o

convert.o: ../../Sources/Kore/Convert.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Convert.cpp -o convert.o

display_.o: ../../Sources/Kore/Display.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Display.cpp -o display_.o

error.o: ../../Sources/Kore/Error.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Error.cpp -o error.o

log.o: ../../Sources/Kore/Log.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Log.cpp -o log.o

system_.o: ../../Sources/Kore/System.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/System.cpp -o system_.o

window_.o: ../../Sources/Kore/Window.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Window.cpp -o window_.o

audio_.o: ../../Sources/Kore/Audio1/Audio.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Audio1/Audio.cpp -o audio_.o

sound_.o: ../../Sources/Kore/Audio1/Sound.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Audio1/Sound.cpp -o sound_.o

soundstream.o: ../../Sources/Kore/Audio1/SoundStream.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Audio1/SoundStream.cpp -o soundstream.o

audio__.o: ../../Sources/Kore/Audio2/Audio.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Audio2/Audio.cpp -o audio__.o

audio___.o: ../../Sources/Kore/Audio3/Audio.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Audio3/Audio.cpp -o audio___.o

compute.o: ../../Sources/Kore/Compute/Compute.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Compute/Compute.cpp -o compute.o

color.o: ../../Sources/Kore/Graphics1/Color.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics1/Color.cpp -o color.o

graphics.o: ../../Sources/Kore/Graphics1/Graphics.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics1/Graphics.cpp -o graphics.o

image.o: ../../Sources/Kore/Graphics1/Image.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics1/Image.cpp -o image.o

graphics_.o: ../../Sources/Kore/Graphics2/Graphics.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics2/Graphics.cpp -o graphics_.o

kravur.o: ../../Sources/Kore/Graphics2/Kravur.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics2/Kravur.cpp -o kravur.o

graphics__.o: ../../Sources/Kore/Graphics3/Graphics.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics3/Graphics.cpp -o graphics__.o

texture.o: ../../Sources/Kore/Graphics3/Texture.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics3/Texture.cpp -o texture.o

graphics___.o: ../../Sources/Kore/Graphics4/Graphics.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics4/Graphics.cpp -o graphics___.o

indexbuffer.o: ../../Sources/Kore/Graphics4/IndexBuffer.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics4/IndexBuffer.cpp -o indexbuffer.o

pipelinestate.o: ../../Sources/Kore/Graphics4/PipelineState.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics4/PipelineState.cpp -o pipelinestate.o

rendertarget.o: ../../Sources/Kore/Graphics4/RenderTarget.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics4/RenderTarget.cpp -o rendertarget.o

shader.o: ../../Sources/Kore/Graphics4/Shader.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics4/Shader.cpp -o shader.o

texture_.o: ../../Sources/Kore/Graphics4/Texture.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics4/Texture.cpp -o texture_.o

texturearray.o: ../../Sources/Kore/Graphics4/TextureArray.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics4/TextureArray.cpp -o texturearray.o

vertexbuffer.o: ../../Sources/Kore/Graphics4/VertexBuffer.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics4/VertexBuffer.cpp -o vertexbuffer.o

commandlist.o: ../../Sources/Kore/Graphics5/CommandList.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics5/CommandList.cpp -o commandlist.o

constantbuffer.o: ../../Sources/Kore/Graphics5/ConstantBuffer.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics5/ConstantBuffer.cpp -o constantbuffer.o

graphics____.o: ../../Sources/Kore/Graphics5/Graphics.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics5/Graphics.cpp -o graphics____.o

pipelinestate_.o: ../../Sources/Kore/Graphics5/PipelineState.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics5/PipelineState.cpp -o pipelinestate_.o

texture__.o: ../../Sources/Kore/Graphics5/Texture.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Graphics5/Texture.cpp -o texture__.o

bufferreader.o: ../../Sources/Kore/IO/BufferReader.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/IO/BufferReader.cpp -o bufferreader.o

filereader.winrt.o: ../../Sources/Kore/IO/FileReader.winrt.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/IO/FileReader.winrt.cpp -o filereader.winrt.o

filewriter.o: ../../Sources/Kore/IO/FileWriter.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/IO/FileWriter.cpp -o filewriter.o

reader.o: ../../Sources/Kore/IO/Reader.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/IO/Reader.cpp -o reader.o

writer.o: ../../Sources/Kore/IO/Writer.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/IO/Writer.cpp -o writer.o

gamepad_.o: ../../Sources/Kore/Input/Gamepad.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Input/Gamepad.cpp -o gamepad_.o

keyboard.o: ../../Sources/Kore/Input/Keyboard.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Input/Keyboard.cpp -o keyboard.o

mouse_.o: ../../Sources/Kore/Input/Mouse.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Input/Mouse.cpp -o mouse_.o

pen.o: ../../Sources/Kore/Input/Pen.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Input/Pen.cpp -o pen.o

sensor.o: ../../Sources/Kore/Input/Sensor.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Input/Sensor.cpp -o sensor.o

surface.o: ../../Sources/Kore/Input/Surface.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Input/Surface.cpp -o surface.o

core.o: ../../Sources/Kore/Math/Core.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Math/Core.cpp -o core.o

quaternion.o: ../../Sources/Kore/Math/Quaternion.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Math/Quaternion.cpp -o quaternion.o

random.o: ../../Sources/Kore/Math/Random.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Math/Random.cpp -o random.o

connection.o: ../../Sources/Kore/Network/Connection.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Network/Connection.cpp -o connection.o

http.o: ../../Sources/Kore/Network/Http.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Network/Http.cpp -o http.o

socket.o: ../../Sources/Kore/Network/Socket.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Network/Socket.cpp -o socket.o

event_.o: ../../Sources/Kore/Threads/Event.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Threads/Event.cpp -o event_.o

mutex_.o: ../../Sources/Kore/Threads/Mutex.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Threads/Mutex.cpp -o mutex_.o

semaphore_.o: ../../Sources/Kore/Threads/Semaphore.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Threads/Semaphore.cpp -o semaphore_.o

thread_.o: ../../Sources/Kore/Threads/Thread.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Threads/Thread.cpp -o thread_.o

threadlocal_.o: ../../Sources/Kore/Threads/ThreadLocal.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Threads/ThreadLocal.cpp -o threadlocal_.o

cameraimage.o: ../../Sources/Kore/Vr/CameraImage.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Vr/CameraImage.cpp -o cameraimage.o

sensorstate.o: ../../Sources/Kore/Vr/SensorState.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Vr/SensorState.cpp -o sensorstate.o

vrinterface_.o: ../../Sources/Kore/Vr/VrInterface.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Vr/VrInterface.cpp -o vrinterface_.o

vrpose.o: ../../Sources/Kore/Vr/VrPose.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Vr/VrPose.cpp -o vrpose.o

vrposestate.o: ../../Sources/Kore/Vr/VrPoseState.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/Kore/Vr/VrPoseState.cpp -o vrposestate.o

bridge.o: ../../Sources/kinc/bridge.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/kinc/bridge.cpp -o bridge.o

color_.o: ../../Sources/kinc/color.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/color.c -o color_.o

error_.o: ../../Sources/kinc/error.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/error.c -o error_.o

image_.o: ../../Sources/kinc/image.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/image.c -o image_.o

log_.o: ../../Sources/kinc/log.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/log.c -o log_.o

system__.o: ../../Sources/kinc/system.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/system.c -o system__.o

window__.o: ../../Sources/kinc/window.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/window.c -o window__.o

audio____.o: ../../Sources/kinc/audio1/audio.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/kinc/audio1/audio.cpp -o audio____.o

sound__.o: ../../Sources/kinc/audio1/sound.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/kinc/audio1/sound.cpp -o sound__.o

soundstream_.o: ../../Sources/kinc/audio1/soundstream.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/kinc/audio1/soundstream.cpp -o soundstream_.o

stb_vorbis.o: ../../Sources/kinc/audio1/stb_vorbis.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/audio1/stb_vorbis.c -o stb_vorbis.o

audio_____.o: ../../Sources/kinc/audio2/audio.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/audio2/audio.c -o audio_____.o

graphics_____.o: ../../Sources/kinc/graphics1/graphics.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/graphics1/graphics.c -o graphics_____.o

graphics______.o: ../../Sources/kinc/graphics4/graphics.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/graphics4/graphics.c -o graphics______.o

pipeline.o: ../../Sources/kinc/graphics4/pipeline.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/graphics4/pipeline.c -o pipeline.o

vertexbuffer_.o: ../../Sources/kinc/graphics4/vertexbuffer.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/graphics4/vertexbuffer.c -o vertexbuffer_.o

commandlist_.o: ../../Sources/kinc/graphics5/commandlist.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/graphics5/commandlist.c -o commandlist_.o

constantbuffer_.o: ../../Sources/kinc/graphics5/constantbuffer.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/graphics5/constantbuffer.c -o constantbuffer_.o

graphics_______.o: ../../Sources/kinc/graphics5/graphics.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/graphics5/graphics.c -o graphics_______.o

pipeline_.o: ../../Sources/kinc/graphics5/pipeline.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/graphics5/pipeline.c -o pipeline_.o

texture___.o: ../../Sources/kinc/graphics5/texture.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/graphics5/texture.c -o texture___.o

acceleration.o: ../../Sources/kinc/input/acceleration.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/input/acceleration.c -o acceleration.o

gamepad__.o: ../../Sources/kinc/input/gamepad.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/input/gamepad.c -o gamepad__.o

keyboard_.o: ../../Sources/kinc/input/keyboard.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/input/keyboard.c -o keyboard_.o

mouse__.o: ../../Sources/kinc/input/mouse.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/input/mouse.c -o mouse__.o

pen_.o: ../../Sources/kinc/input/pen.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/input/pen.c -o pen_.o

rotation.o: ../../Sources/kinc/input/rotation.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/input/rotation.c -o rotation.o

surface_.o: ../../Sources/kinc/input/surface.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/input/surface.c -o surface_.o

filereader.winrt_.o: ../../Sources/kinc/io/filereader.winrt.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/kinc/io/filereader.winrt.cpp -o filereader.winrt_.o

filewriter_.o: ../../Sources/kinc/io/filewriter.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/io/filewriter.c -o filewriter_.o

lz4x.o: ../../Sources/kinc/libs/lz4x.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/libs/lz4x.c -o lz4x.o

core_.o: ../../Sources/kinc/math/core.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/math/core.c -o core_.o

matrix.o: ../../Sources/kinc/math/matrix.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/math/matrix.c -o matrix.o

random_.o: ../../Sources/kinc/math/random.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/math/random.c -o random_.o

http_.o: ../../Sources/kinc/network/http.c
	gcc  -O2 $(INC) $(DEF) $(CFLAGS) -c ../../Sources/kinc/network/http.c -o http_.o

socket_.o: ../../Sources/kinc/network/socket.cpp
	g++  -O2 $(INC) $(DEF) $(CPPFLAGS) -c ../../Sources/kinc/network/socket.cpp -o socket_.o
