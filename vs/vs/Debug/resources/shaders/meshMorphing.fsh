#version 330 core

in vec2 frag_TextureCoordinates;

uniform sampler2D Texture2D;

out vec4 resultColor;

//vec2 getRightCoordinates()
//{
//    vec2 coord = gl_FragCoord.xy / resolution.xy;
//    coord.y = 1.0 - coord.y;
//    return coord;
//}




void main()
{
    vec2 uv = frag_TextureCoordinates;
//    uv.y = 1.0 - uv.y;
	resultColor = texture(Texture2D, uv);
}
