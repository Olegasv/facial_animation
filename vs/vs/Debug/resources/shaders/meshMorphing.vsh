#version 330 core

layout(location = 0) in vec4 vertexPosition;
layout(location = 1) in vec2 textureCoordinates;
uniform vec2 resolutionWindow;
uniform vec2 resolutionTexture;


out vec2 frag_TextureCoordinates;


void main() {
    
    vec2 coord = -1.0 + 2.0 * (vertexPosition.xy / resolutionWindow.xy);
    
    gl_Position = vec4(coord, 0.0, 1.0);
    frag_TextureCoordinates = textureCoordinates / resolutionTexture;
}
