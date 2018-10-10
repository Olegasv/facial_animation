#version 330 core

layout(location = 0) in vec4 vertexPosition;
layout(location = 1) in vec4 color;

uniform mat4x4 transform;
uniform vec3 resolution;

out vec4 outColor;

void main() {
//    vec3 pos = vertexPosition.xyz / resolution;
//    gl_Position = transform * vec4(pos, 1.0);
    gl_Position = transform * vertexPosition;
    outColor = color;
}
