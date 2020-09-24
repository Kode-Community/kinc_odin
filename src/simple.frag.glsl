#version 450

in vec2 tex_coords;

uniform sampler2D texture;

out vec4 FragColor;

void main() {
	FragColor = texture2D(texture, tex_coords);
}
