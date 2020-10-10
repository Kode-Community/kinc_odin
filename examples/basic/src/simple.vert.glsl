#version 450

in vec3 pos;
in vec2 uv;

out vec2 tex_coords;

uniform mat4 projection;

void main() {
	gl_Position = vec4(pos, 1.0) * projection;
	tex_coords = uv;
}
