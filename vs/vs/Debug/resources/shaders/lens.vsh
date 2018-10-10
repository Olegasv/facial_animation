#version 330 core

layout(location = 0) in vec4 vertexPosition;
//layout(location = 1) in vec2 textureCoordinates;
//layout(location = 2) in vec2 centerLens;
//layout(location = 3) in float radiusLens;
//layout(location = 4) in float distanceLensZ;

//out vec2 frag_TextureCoordinates;
//out vec2 frag_centerCoordinates;

//out float fr_distanceLensZ;
//out float radiusLens

void main() {
    gl_Position = vertexPosition;
    
//    frag_TextureCoordinates = textureCoordinates;
//    frag_centerCoordinates = centerLens;
}
