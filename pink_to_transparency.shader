shader_type canvas_item;

uniform vec4 chroma_key : color_hint = vec4(1.0f, 0.0f, 1.0f, 1.0f);

void fragment() {
	COLOR = texture(TEXTURE, UV);
	
	if (COLOR == chroma_key)
		COLOR.a = 0.0;
}