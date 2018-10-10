precision mediump float;
uniform sampler2D s_texture;
varying vec2 v_texCoordinates;


void main() {
    vec4 texColor = texture2D(s_texture, v_texCoordinates);
//    texColor.a = texColor.a * 0.5;
    gl_FragColor = texColor;
//    gl_FragColor
}