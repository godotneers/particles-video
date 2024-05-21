shader_type particles;

uniform vec2 dimensions;
uniform float rotations = 1;
uniform sampler2D scale_curve;

float hash12(vec2 p)
{
	vec3 p3  = fract(vec3(p.xyx) * .1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

mat4 translate(float x, float y, float z) {
	return mat4(  // careful, this takes COLUMNS
		vec4(1,0,0,0),
		vec4(0,1,0,0),
		vec4(0,0,1,0),
		vec4(x, y, z, 1.0)
	);
}

mat4 scale(float x, float y, float z) {
	return mat4(
		vec4(x, 0.0, 0.0, 0.0),
		vec4(0.0, y, 0.0, 0.0),
		vec4(0.0, 0.0, z, 0.0),
		vec4(0, 0, 0, 1)
	);
}

void start() {
	float angle = 0.0;
	TRANSFORM = EMISSION_TRANSFORM 
		* translate(cos(angle) * dimensions.x * 0.5, sin(angle) * dimensions.y * 0.5, 0);
	CUSTOM.x = LIFETIME;
	CUSTOM.y = hash12(vec2(float(INDEX), float(TIME)));
}

void process() {
	CUSTOM.x += DELTA;
	float lifetime_offset = CUSTOM.x / LIFETIME;
	float angle = TAU * (rotations-CUSTOM.y) * lifetime_offset + TAU * CUSTOM.y * 0.2;
	float particle_scale = texture(scale_curve, vec2(mod(lifetime_offset + CUSTOM.y, 1.0), 0)).r;
	vec2 offset = vec2(cos(angle), sin(angle)) * dimensions * 0.5;
	TRANSFORM = EMISSION_TRANSFORM * translate(offset.x, offset.y, 0) * scale(particle_scale, particle_scale, 1);  
}
