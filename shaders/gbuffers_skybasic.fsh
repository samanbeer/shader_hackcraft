#version 330 compatibility

/* RENDERTARGETS: 0 */
layout(location = 0) out vec4 color;

void main() { 
	color = vec4(0.05, 0.05, 0.05, 1.0); // collor of fog so the sky matches it
}