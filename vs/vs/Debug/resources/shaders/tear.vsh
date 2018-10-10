uniform float u_width;
uniform float u_height;

attribute float a_speed;
attribute float a_angle;
attribute float a_gravity;
attribute float a_timeMoving;
attribute vec2 a_startPosition;
attribute vec2 a_texCoordinates;
attribute float a_lifetime;
attribute vec2 a_offsetPosition;

varying vec2 v_texCoordinates;

const float tearVectorX = -3.0;
const float tearVectorY = -5.0;
const float lenOfTearVector = 5.8309519;

void main() {
    if (a_timeMoving > 0.0 && a_timeMoving < a_lifetime) {
        float newX, newY;
        float x = a_speed * a_timeMoving * cos(radians(a_angle));
        float y = a_speed * a_timeMoving * sin(radians(a_angle)) - 0.5 * a_gravity * a_timeMoving * a_timeMoving;
        float lenVector = sqrt(x * x + y * y);
		
        if (a_speed < 0.0) {
        	float cosAngle = (x * tearVectorX + y * tearVectorY) / lenOfTearVector / lenVector;
        	float sinAngle = sqrt(1.0 - cosAngle * cosAngle);
        
        	newX = (a_offsetPosition.x * cosAngle + a_offsetPosition.y * sinAngle) / u_width;
        	newY = (a_offsetPosition.y * cosAngle - a_offsetPosition.x * sinAngle) / u_height;
        } else {
            float cosAngle = (x * tearVectorX * -1.0 + y * tearVectorY) / lenOfTearVector / lenVector;
            float sinAngle = sqrt(1.0 - cosAngle * cosAngle);
            newX = (a_offsetPosition.x * cosAngle - a_offsetPosition.y * sinAngle) / u_width;
            newY = (a_offsetPosition.y * cosAngle + a_offsetPosition.x * sinAngle) / u_height;
        }
        
        gl_Position.x = (x + newX + a_startPosition.x);
        gl_Position.y = (y + newY + a_startPosition.y);

        gl_Position.w = 1.0;
        gl_Position.z = -1.0;
        
    } else {
        gl_Position = vec4(a_startPosition, -1000.0, 1.0);
    }
    
    v_texCoordinates = a_texCoordinates;
}