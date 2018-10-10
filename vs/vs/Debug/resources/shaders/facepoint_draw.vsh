#version 330 core

layout(location = 0) in vec2 position;
layout(location = 1) in vec4 color;

out vec4 incolor;

uniform vec2 resolution;

void main() {
    gl_Position = vec4(position / resolution, 0.0, 1.0);
    gl_PointSize = 7.0;
    incolor = color;
}
