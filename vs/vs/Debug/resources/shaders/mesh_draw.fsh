#version 330 core

out vec4 color;

uniform float alpha;

void main() {
    color = vec4(1.0, 1.0, 1.0, alpha);
}
