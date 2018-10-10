#version 330 core

uniform sampler2D image_texture;
uniform vec2 resolution;
//in vec2 v_uv;

out vec4 color;

void main()
{
    vec2 uv = gl_FragCoord.xy / resolution;
    uv.y = 1.0 - uv.y;
    
    vec4 sample0,
    sample1,
    sample2,
    sample3;
    
    float fStep = 0.005;
    
    sample0 = texture(image_texture, vec2(uv.x - fStep, uv.y - fStep));
    sample1 = texture(image_texture, vec2(uv.x + fStep, uv.y + fStep));
    sample2 = texture(image_texture, vec2(uv.x + fStep, uv.y - fStep));
    sample3 = texture(image_texture, vec2(uv.x - fStep, uv.y + fStep));
    
    color = (sample0 + sample1 + sample2 + sample3) / 4.0;
    
//    color = texture(image_texture, uv);
}
