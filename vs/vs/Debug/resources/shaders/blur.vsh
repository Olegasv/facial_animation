#version 330 core

layout(location = 0) in vec2 position;
//layout(location = 1) in vec2 texture_coordinates;

//uniform vec2 resolution;

//out vec2 v_uv;

void main() {
    
    gl_Position = vec4(position, 0.0, 1.0);
//    v_uv = texture_coordinates;
}

