#version 330 compatibility

uniform sampler2D lightmap;
uniform sampler2D gtexture;

uniform float alphaTestRef = 0.1;

in vec2 lmcoord;
in vec2 texcoord;
in vec4 glcolor;

/* RENDERTARGETS: 0 */
layout(location = 0) out vec4 color;

void main() {
	color = texture(gtexture, texcoord) * glcolor;
	color *= texture(lightmap, lmcoord);
	if (color.a < alphaTestRef) {
		discard;
	}

	float vzdalenost = gl_FragCoord.z / gl_FragCoord.w; 
	
	float hustota = 0.06; 
	vec3 barvaMlhy = vec3(0.05, 0.05, 0.05); 
	
	float intenzita = 1.0 - exp(-pow(vzdalenost * hustota, 2.0));
	intenzita = clamp(intenzita, 0.0, 1.0);
	
	color.rgb = mix(color.rgb, barvaMlhy, intenzita);
}