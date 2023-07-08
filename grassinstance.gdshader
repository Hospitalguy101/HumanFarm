shader_type canvas_item;

uniform sampler2D noise;

uniform float wave_speed = 0.2;
uniform float wave_strength = 30.0;
uniform float wave_effect_start : hint_range(0.0, 1.0) = 0.1;
uniform float wave_effect_length = 0.5;
uniform float noise_scale = 1.0;

varying vec2 world_vertex;
void vertex(){
	world_vertex = INSTANCE_CUSTOM.xy;
	
	vec2 noise_tex_size = vec2(textureSize(noise, 0));
	vec2 uv = world_vertex / noise_tex_size;
	vec3 n = texture(noise, uv * noise_scale * wave_speed).rgb;
	
	vec2 wave = (n * 2.0 - 1.0).xy;
	wave *= smoothstep(wave_effect_start, wave_effect_length, 1.0 - UV.y);
	
	VERTEX.xy += wave * wave_strength;
}
