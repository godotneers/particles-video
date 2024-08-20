shader_type spatial;
render_mode specular_toon;

uniform sampler2D displacement_map;
uniform float multiplier;

vec3 calc_normal(vec2 uv) { 
    const vec3 off = vec3(-1,0,1);
    vec2 texelSize = 1.0 / vec2(textureSize(displacement_map, 0));

    float left = texture(displacement_map, uv + texelSize * off.xy).x;
    float right = texture(displacement_map, uv + texelSize * off.zy).x;
    float top = texture(displacement_map, uv + texelSize * off.yx).x;
    float down = texture(displacement_map, uv + texelSize * off.yz).x;

    return normalize(vec3(left-right, 2.0, down-top));
}

void vertex() {
	VERTEX.z += texture(displacement_map, UV).r * multiplier;
	NORMAL = calc_normal(UV);
}


