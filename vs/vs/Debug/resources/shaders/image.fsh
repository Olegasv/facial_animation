#version 330 core

uniform sampler2D image_texture;
in vec2 v_uv;

out vec4 color;

void main()
{
    color = texture(image_texture, v_uv);
}
