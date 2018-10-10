#version 330 core

//in vec2 frag_TextureCoordinates;


//uniform float time;
//
//uniform int type;
//
//uniform vec2 center;
//uniform vec2 leftEye;
//uniform vec2 rightEye;
uniform vec2 nose;
uniform vec2 mouth;

uniform vec2 underlip;
uniform vec2 rightEye;
uniform vec2 leftEye;
uniform vec2 radiusUnderlip;

uniform sampler2D ourTexture;
uniform vec2 resolution;

//const int maxNumberOfVertexes = 16;
//uniform vec2 srcArea[maxNumberOfVertexes];
//uniform vec2 dstArea[maxNumberOfVertexes];
//uniform vec2 direction;
//uniform int count;

out vec4 resultColor;

vec2 getRightCoordinates()
{
    vec2 coord = gl_FragCoord.xy / resolution.xy;
    coord.y = 1.0 - coord.y;
    return coord;
}

//vec4 mirror()
//{
//    vec2 uv = getRightCoordinates();
//    
//    uv.x = 0.5 - abs(0.5 - uv.x);
//    
//    return texture(ourTexture, uv);
//}
//
//vec4 waves()
//{
//    float x = gl_FragCoord.x / (resolution.x * 2.0);
//    float y = 1.0 - gl_FragCoord.y / (resolution.y * 2.0);
//    float t = (15.0 + sin(pow(x * x + y * y, 0.3f) * 32.0)) / 16.0;
//    
//    x = x * t;
//    y = y * t;
//    
//    return texture(ourTexture, vec2(x,y));
//}
//
//vec4 quadeye()
//{
//    vec2 uv = getRightCoordinates();
//    float tx = 0.3 + pow(uv.x * .85f, 2.0);// 4 * (x / 2) * (x / 2); //sinf(PIf * abs(x) * .5f);
//    float ty = 0.3 + pow(uv.y * .85f, 2.0); //sinf(PIf * abs(y) * .5f);
//    
//    uv.x = uv.x * tx;
//    uv.y = uv.y * ty * 1.5f;
//    
//    return texture(ourTexture, uv);
//}
//
//vec2 barrelDistort(vec2 pos, float power)
//{
//    float t = atan(pos.y, pos.x);
//    float r = pow(length(pos), power);
//    pos.x = r * cos(t);
//    pos.y = r * sin(t);
//    return 0.5 * (pos + 1.0);
//}
//
//vec4 barrel()
//{
//    vec2 q = getRightCoordinates();
//    vec2 p = -1.0 + 2.0 * q;
//    
//    float d = length(p);
//    float s = 1.0 - min(1.0, d * d);
//    
//    float t = time;
//	float barrel_pow = 0.2 + 0.9 * (1.0 + (cos(t)));
//    barrel_pow = 2.0;
//    p = barrelDistort(p, barrel_pow);
//    
//    return texture(ourTexture, s * (p-q) + q );
//}
//
////vec4 printCircle()
////{
////    vec2 currentPoint = gl_FragCoord.xy;
////    vec2 centerPoint = resolution.xy / 2.0;
////    
////    vec4 color = texture(ourTexture, getRightCoordinates());
////    float radius = 200.0;
////    if (distance(centerPoint, currentPoint) > radius)
////        return color;
////    else
////        return color + vec4(0.2, 0.0, 0.0, 0.0);
////    
////}
//
//vec4 printEllipse()
//{
//    vec2 centerPoint = resolution.xy / 2.0;
//    
//    float x = gl_FragCoord.x - centerPoint.x;
//    float y = gl_FragCoord.y - centerPoint.y;
//    
//    float b = 250.0;
//    float a = 250.0;
//    
//    float result = (x * x) / (a * a) + (y * y) / (b * b);
//    
//    vec4 color = texture(ourTexture, getRightCoordinates());
//    if (result > 1.0 || x < 0.0)
//        return color;
//    else {
////        float t = time;
////        float barrel_pow = 0.2 + 0.9 * (1.0 + (cos(t)));
////        float p = p = barrelDistort(p, barrel_pow);
//        return color + vec4(0.4, 0.0, 0.0, 0.0);
//    }
//    
//    
//}
//
//
//vec4 something()
//{
//    float radius = 0.19;
//    float depth = radius / 1.5;
//
//    vec2 uv = gl_FragCoord.xy / resolution.xy;
//    uv = getRightCoordinates();
////    vec2 center = (gl_FragCoord.xy / 2.0) / resolution.xy;
//    vec2 cen = center;
////    float center_ = center / resolution.xy;
//    float ax = ((uv.x - cen.x) * (uv.x - cen.x)) / (0.2 * 0.2) + ((uv.y - cen.y) * (uv.y - cen.y)) / (0.2 / (resolution.x / resolution.y));
//    float dx = 0.0 + (-depth / radius) * ax + (depth / (radius * radius)) * ax * ax;
//    float f = (ax + dx);
//    if (ax > radius)
//        f = ax;
//    vec2 magnifierArea = cen + (uv - cen) * f / ax;
////    return texture(ourTexture, uv);
////    return texture(ourTexture, vec2(1.0, -1.0) * magnifierArea);
//    return texture(ourTexture, magnifierArea);
//}
//
//vec2 getModifiedUV(vec2 actualUV, vec2 pointUV, float radius, float strength)
//{
//    vec2 vecToPoint = pointUV - actualUV;
//    float distToPoint = length(vecToPoint);
//    
//    float mag = (1.0 - (distToPoint / radius)) * strength;
//    mag *= step(distToPoint, radius);
//    
//    return actualUV + (mag * vecToPoint);
//}
//
//vec4 something2()
//{
//    const float radius = 0.3;
//    float strength = 1.0;
//    
//    float minRes = min(resolution.x, resolution.y);
//    vec2 uv = gl_FragCoord.xy / minRes;
//    vec2 pos = vec2(
//                    mod(time, (resolution.x / minRes) + (radius * 2.0)) - radius,
//                    0.5 + 0.2 * cos(time)
//                    );
//    pos = vec2(0.5, 0.5);
//    
//    // Uncomment this line to control with the mouse.
//    //pos = iMouse.xy / min(iResolution.x, iResolution.y);
//    
//    vec2 modifiedUV = getModifiedUV(uv, pos, radius, strength);
//    modifiedUV.y = 1.0 - modifiedUV.y;
//    return texture(ourTexture, modifiedUV);
//}
//
//vec4 superlens()
//{
////    return printCircle();
//    return printEllipse();
//    
//}
//
//vec4 pinch()
//{
//    vec2 uv = getRightCoordinates();
//    
////    float itime = 9.3;
//    vec2 center = vec2(0.5);
//    vec2 dir = normalize(center - uv);
//    float d = length(center - uv);
//    float factor = 0.5 * sin(time);
//    float f = exp(factor * (d - 0.5)) - 1.0;
//    if (d > 0.5)
//        f = 0.0;
//    
//    return texture(ourTexture, uv + f * dir);
//    
//}
//
//
//
//vec4 pinch2()
//{
//    vec2 center = vec2(0.0, 0.0);
//    float radius = 0.5;
//    float scale = 0.3;
//    
//    vec2 coord = getRightCoordinates();
//    
//    vec2 textureCoordinateToUse = coord;
//    float dist = distance(center, coord);
//    textureCoordinateToUse -= center;
//    if (dist < radius) {
//        float percent = 1.0 + ((0.5 - dist) / 0.5) * scale;
//        
//        textureCoordinateToUse = textureCoordinateToUse * percent;
//    }
//    textureCoordinateToUse += center;
//    
//    return texture(ourTexture, textureCoordinateToUse);
//}
//
//vec4 pinch3()
//{
//    precision mediump float;
//    
//    vec2 position = gl_FragCoord.xy/ resolution.xy / 2.0;
//	position.y = 1.0 - position.y;
//    
//        // normalize to the center
//    vec2 p = position - 0.2;
//        
//        // cartesian to polar coordinates
//    float r = length(p);
//    float a = atan(p.y, p.x);
//        
//        // distort
//    r = sqrt(r); // pinch
//        //r = r*r; // bulge
//        
//        // polar to cartesian coordinates
//    p = r * vec2(cos(a), sin(a));
//        
//        // sample the webcam
//    return texture(ourTexture, p + 0.2);
//}
//
//vec4 fisheye()
//{
//    const float PI = 3.1415926535;
//    
//    float aperture = 160.0;
//    float apertureHalf = 0.5 * aperture * (PI / 180.0);
//    float maxFactor = sin(apertureHalf);
//        
//    vec2 coord = gl_FragCoord.xy/ resolution.xy / 2.0;
//    coord.y = 1.0 - coord.y;
//    vec2 uv;
//    vec2 xy = 2.0 * coord.xy - 1.0;
//    float d = length(xy);
//    
//    if (d < (2.0 - maxFactor)) {
//        d = length(xy * maxFactor);
//        float z = sqrt(1.0 - d * d);
//        float r = atan(d, z) / PI;
//        float phi = atan(xy.y, xy.x);
//            
//        uv.x = r * cos(phi) + 0.5;
//        uv.y = r * sin(phi) + 0.5;
//    } else {
//        uv = coord.xy;
//	}
//        return texture(ourTexture, uv);
////        gl_FragColor = c;
//}
//
//vec4 pixeletion()
//{
//    float vx_offset = 0.65;
//    float rt_w = 5.0; // GeeXLab built-in
//    float rt_h = 6.0; // GeeXLab built-in
//    float pixel_w = 0.075; // 15.0
//    float pixel_h = 0.070; // 10.0
//    
//    vec2 uv = frag_TextureCoordinates.xy;
//    uv.y = 1.0 - uv.y;
//        
//    vec3 tc = vec3(1.0, 0.0, 0.0);
//    if (uv.x < (vx_offset - 0.005)) {
//    
//        float dx = pixel_w * (1. / rt_w);
//        float dy = pixel_h * (1. / rt_h);
//        vec2 coord = vec2(dx * floor(uv.x / dx), dy * floor(uv.y / dy));
//        tc = texture(ourTexture, coord).rgb;
//    } else if (uv.x >= (vx_offset + 0.005)) {
//        tc = texture(ourTexture, uv).rgb;
//    }
//	return vec4(tc, 1.0);
//}
//
//vec4 sinc()
//{
//    vec2 coord = getRightCoordinates();
//    vec2 cPos = -1.0 + 2.0 * coord;
//    float cLength = length(cPos);
//    float itime = time;
//    vec2 uv = coord + (cPos / cLength) * cos(cLength * 12.0 - itime * 4.0) * 0.03;
////    uv.y = 1.0 - uv.y;
//    return texture(ourTexture, uv);
//}
//
//vec4 bulge()
//{
//    vec2 coord = getRightCoordinates();
//    float r = sqrt(pow(coord.x - 0.5, 2.0) + pow(coord.y - 0.5, 2.0));
//    float a = atan(coord.x - 0.5, coord.y - 0.5);
//    float rn = pow(r, 2.5) / 0.5;
//    
//    coord.x = rn * cos(a) + 0.5;
//    coord.y = rn * sin(a) + 0.5;
//    return texture(ourTexture, coord);
//}
//
//vec4 cube()
//{
//    
//    vec2 tex = getRightCoordinates();
//    float k = -1.0;
//        
//    // cubic distortion value
//    float kcube = 0.5;
//    float halfOne = 0.5;
//        
//    float r2 = (tex.x - halfOne) * (tex.x - halfOne) + (tex.y - halfOne) * (tex.y - halfOne);
//    float f = 0.0;
//        
//        
//    //only compute the cubic distortion if necessary
//    if (kcube == 0.0) {
//        f = 1.0 + r2 * k;
//    } else{
//        f = 1.0 + r2 * (k + kcube * sqrt(r2));
//    };
//        
//        // get the right pixel for the current position
//    float x = f * (tex.x - 0.5) + 0.5;
//    float y = f * (tex.y - 0.5) + 0.5;
//    vec4 inputDistord = texture(ourTexture,vec2(x,y));
//        
//        
//    return inputDistord;
//
//}
//
//vec4 barrel2()
//{
//    vec2 uv = getRightCoordinates();
//    uv = uv * 2.0 - 1.0;
//    float distortion = -0.1;
//    float r = dot(uv,uv);
//    uv *= 1.6 + distortion * r + distortion * r * r;
//    
//
//    uv = 0.5 * (uv * 0.5 + 1.0);
//    return texture(ourTexture, uv);
//}
//
//vec4 magnify()
//{
//    const float radius = 0.04;
//    float strength = -1.0;
//    
//    float minRes = min(resolution.x, resolution.y);
//    vec2 coord = getRightCoordinates();
//    vec2 uv = coord;
////    vec2 uv = frag_TextureCoordinates;
////    vec2 pos = vec2(mod(time, (resolution.x / minRes) + (radius * 2.0)) - radius, 0.5 + 0.2 * cos(time));
//    vec2 pos = center;
//    
////    pos.y = 1.0 - pos.y;
//    
////    pos = vec2(0.0, 0.0);
//    
//    
//    vec2 vecToPoint = pos - uv;
//    float distToPoint = length(vecToPoint);
//    
//    float mag = (1.0 - (distToPoint / radius)) * strength;
//    mag *= step(distToPoint, radius);
//    
//    vec2 modifiedUV = uv + (mag * vecToPoint);
////    modifiedUV.y = 1.0 - modifiedUV.y;
//    return texture(ourTexture, modifiedUV);
//}
//
//vec4 nolens()
//{
//    vec4 color = texture(ourTexture, getRightCoordinates());
//    return color;
//}
//
//vec4 getEffect()
//{
//    switch (type) {
//        case 0: return nolens();
//        case 1: return quadeye();
//        case 2: return barrel();
//        case 3: return pinch();
//        case 4: return pinch2();
//        case 5: return pinch3();
//        case 6: return fisheye();
//        case 7: return pixeletion();
//        case 8: return sinc();
//        case 9: return bulge();
//        case 10: return cube();
//        case 11: return barrel2();
//        case 12: return mirror();
//        case 13: return magnify();
//        case 666: return superlens();
//        case 999: return something2();
//        default: return vec4(0.6, 0.6, 0.0, 0.38);
//    }
//}

//float anti(float t, float k)
//{
//    float d = 1.0+t*t-t*t*k*k;
//    if (d <= 0.0)
//        return -1.0;
//    float x = (k + sqrt(d))/(1.0 + t*t);
//    if (x < k)
//        return acos(-1.0)-asin(x*t);
//    else
//        return asin(x*t);
//}
//
//float sphere(float t, float k)
//{
//    float d = 1.0+t*t-t*t*k*k;
//    if (d <= 0.0)
//        return -1.0;
//    float x = (k - sqrt(d))/(1.0 + t*t);
//    return asin(x*t);
//}
//
//void mainImage( out vec4 fragColor, in vec2 fragCoord )
//{
//    vec2 uv = fragCoord.xy - 0.5*iResolution.xy;
//    float v = iResolution.x;
//    if (v > iResolution.y)
//        v = iResolution.y;
//    uv /= v;
//    uv *= 2.0;
//    float t = length(uv);
//    float coef = sin(iGlobalTime);
//    float k = abs(coef);
//    float len2;
//    if (k < 0.05)
//        k = 0.05;
//    if (coef > 0.0)
//        len2 = sphere(t*k,sqrt(2.0))/sphere(1.0*k,sqrt(2.0));
//    else
//        len2 = anti(t*k*2.0,1.0)/anti(1.0*k*2.0,1.0);
//    uv = uv * len2 * 0.5 / t;
//    uv = uv + 0.5;
//    if (len2 < 0.0 || uv.x < 0. || uv.y < 0. || uv.x > 1. || uv.y > 1.)
//    {
//        fragColor = vec4(0,0,0,1.0);
//        return;
//    }
//    fragColor = texture2D(iChannel0,uv);
//}

//float cross_vec2(vec2 one, vec2 two)
//{
//    return one.x * two.y - one.y * two.x;
//}
//
//int segment_crossing(vec2 a, vec2 b, vec2 c, vec2 d)
//{
//    float crosses[4];
//    crosses[0] = cross_vec2(c - a, b - a);
//    crosses[1] = cross_vec2(d - a, b - a);
//    crosses[2] = cross_vec2(a - c, d - c);
//    crosses[3] = cross_vec2(b - c, d - c);
//    
//    if (crosses[0] * crosses[1] < 0.0 && crosses[2] * crosses[3] < 0.0)
//        return 1;
//    else return 0;
//}
//
//vec4 src_result()
//{
//    int c = 0;
//    for (int i = 0; i < count - 1; ++i) {
//        vec2 trueFragCoord = gl_FragCoord.xy;
//        trueFragCoord.y = resolution.y - trueFragCoord.y;
//        c += segment_crossing(srcArea[i], srcArea[i + 1], trueFragCoord, vec2(resolution.x + 2.0, trueFragCoord.y));
//    }
//    
//    vec4 clr = texture(ourTexture, getRightCoordinates());
//    if (mod(c, 2) == 0)
//        return clr;
//    clr.x = 1.0;
//    return clr;
//}

vec4 mylens()
{
    
    return texture(ourTexture, getRightCoordinates());
}


vec2 magnify(vec2 uv, vec2 center, float radius, float power)
{
    vec2 direction = center - uv;
    float dist = length(direction);
    
    float mag = (1.0 - (dist / radius)) * power;
    mag *= step(dist, radius);
    
    return uv + (mag * direction);
}

#define PI 3.141592
#define EPSILON 0.00001
void main()
{
    // уравнение прямой, общий вид:
    // Ax + By + C = 0
    // через две точки:
    // (y1-y2)x + (x2-x1)y + (x1y2-x2y1) = 0
    // точка M(Mx, My)
    // distance = |A*Mx + B*My + C| / sqrt(A*A + B*B)
    
    float power = 2.0;
    
//    float x1 = underlip.x - radiusUnderlip.x;
//    float y1 = underlip.y;
//    float x2 = underlip.x + radiusUnderlip.x;
//    float y2 = underlip.y;
//    float Mx = gl_FragCoord.x;
//    float My = resolution.y - gl_FragCoord.y;
//    
//    float A = 0.0; // y1 == y2
//    float B = radiusUnderlip.x * 2.0; // (underlip.x + radius.x) - (undrlip.x - radius.x) = radius.x + radius.x = 2 * radius.x
//    float C = x1 * y2 - x2 * y1;
//    float d = abs(A * Mx + B * My + C) / sqrt(A * A + B * B); // distance

    // формула эллипса (x^2) / (a^2) + (y^2)/(b^2) = 1
//    float x = Mx - underlip.x;
//    float y = My - underlip.y;
    
    float x = gl_FragCoord.x - underlip.x;
    float y = gl_FragCoord.y - (resolution.y - underlip.y);
    
    float result = (x * x) / (radiusUnderlip.x * radiusUnderlip.x) + (y * y) / (radiusUnderlip.y * radiusUnderlip.y);

    
    if (result <= 1.0 && y >= 0.0) {
        float sqr_a = radiusUnderlip.x * radiusUnderlip.x;  // a^2
        float sqr_b = radiusUnderlip.y * radiusUnderlip.y;  // b^2
        float l = sqrt(sqr_b - x * x * sqr_b / sqr_a);
        
/// результат полосками
//        float prop = (l - gl_FragCoord.y) / l * power;
//        float prop = (gl_FragCoord.y - (resolution.y - underlip.y)) / (l);
//        float i = resolution.y - underlip.y;
//        float len = 0.0;
//        float k = 0.0;
//        while (i < gl_FragCoord.y) {
//            k = abs(l - len) / l * power;
////            if (fract(k) < 0.5)
////                k = floor(k);
////            else
////                k = ceil(k);
//            k = round(k);
//            if (k < EPSILON)
//                k = 5.0;
//            len += k;
//            i += k;
//        }
//////////////////////
        
        
//// увеличение
        vec2 uv = magnify(gl_FragCoord.xy / resolution, vec2(gl_FragCoord.x, resolution.y - underlip.y) / resolution, l / resolution.y, 0.0);
//        uv = gl_FragCoord.xy / resolution;
        uv.y = 1.0 - uv.y;
        resultColor = texture(ourTexture, uv);
//////////////////////
        
        
//        const float per1 = 0.9;
//        const float loc_power = 1.2;  //local power
//        const float per2 = 1.0 - per1;
//        vec2 uv;
//        float p = l / radiusUnderlip.y * loc_power;
//        p = loc_power;
//        if (y / l < per1 * p) {
//            uv.x = gl_FragCoord.x;
//            uv.y = (resolution.y - (gl_FragCoord.y - y / p));
//        } else if (y / l < 1.0) {
//            uv.x = gl_FragCoord.x;
//            uv.y = resolution.y - (gl_FragCoord.y - l * per1);
//        } else {
//            uv = gl_FragCoord.xy;
//            uv.y = resolution.y - uv.y;
//        }
//        
//        uv /= resolution;
//        uv.y = uv.y;
//        
//        resultColor = texture(ourTexture, uv);
        
        
        
        
//        resultColor = texture(ourTexture, vec2(gl_FragCoord.x / resolution.x,  1.0 - (i - k + 1.0) / resolution.y));
//        resultColor = vec4(0.0, 0.0, 0.0, 1.0);
        
//        float prop = d / l;
        
//        power = 1.0 - prop;
        
//        resultColor.r = 1.0;
//        resultColor.g -= 0.2;
//        resultColor.b -= 0.2;
//        resultColor.r = 0.0;
        
//        resultColor.r *= prop;
//        resultColor.g *= prop;
//        resultColor.b *= prop;
    } else {
        resultColor = texture(ourTexture, getRightCoordinates());
    }

    
    
    //////////////////////////////////////
//	// first mask: power = 0.4
//    float u_power = 0.7;
//    vec2 u_radius = vec2(0.07, 0.1);
//    
//    vec2 _p = gl_FragCoord.xy / resolution;
//    _p.y = 1.0 - _p.y;
//    vec2 _l = leftEye / resolution;
//    vec2 _r = rightEye / resolution;
//    vec2 _u = underlip / resolution;
//    vec2 _n = nose / resolution;
//    vec2 _m = mouth / resolution;
//    
//    vec2 center = _p;
//    if (distance(_p, _l) < u_radius.x) { // me
//        center = _l;
////    } else if (distance(_p, _u) < u_radius.x) {
//        float Mx = gl_FragCoord.x;
//        float My = resolution.y - gl_FragCoord.y;
//        float x = Mx - underlip.x;
//        float y = My - underlip.y;
//        x /= resolution.x;
//        y /= resolution.y;
//        vec2 radius = radiusUnderlip / resolution;
//        radius = u_radius;
////        radius = vec2(0.25, 0.1);
////        float result = (x * x) / (radius.x * radius.x) + (y * y) / (radius.y * radius.y);
////        if (result <= 1.0 && y <= 0.0) {
////        	center = _u;
////            u_radius = radius;
////        }
////    }
//    vec2 uv = gl_FragCoord.xy / resolution;
//    uv.y = 1.0 - uv.y;
//    
//    vec2 modifiedUV = magnify(uv, center, u_radius.x, 0.5);
//    
//    resultColor = texture(ourTexture, modifiedUV);
//    
//
//        
//        
//        
////        resultColor = texture(ourTexture, getRightCoordinates());
//    
//    } else if (distance(_p, _r) < u_radius.x) { // Oleg
//        vec2 p = gl_FragCoord.xy / resolution.xy;
//        p.y = 1.0 - p.y;
//        
//        //screen proportion
//        float prop = resolution.x / resolution.y;
//        
//        vec2 m = rightEye / resolution;
//        vec2 d = p - m;
//        float r = sqrt(dot(d, d));
//        
//        //amount of effect
//        
//        float power = PI / 0.7 * 0.5 * u_power;
//        
//        if (r > u_radius.x)
//            power = 0.0;
//        else {
//            power = power * (1.0 - r / u_radius.x);
//        }
//        //radius of 1:1 effect
//        float bind;
//        if (power > 0.0)
//            bind = 0.7;//stick to corners
//        else
//        {
//            if (prop < 1.0)
//                bind = m.x;
//            else
//                bind = m.y;
//        }//stick to borders
//        
//        vec2 uv;
//        if (power > 0.0)//fisheye
//            uv = m + normalize(d) * tan(r * power) * bind / tan( bind * power);
//        else if (power < 0.0)//antifisheye
//            uv = m + normalize(d) * atan(r * -power * 10.0) * bind / atan(-power * bind * 10.0);
//        else 
//            uv = p;//no effect for power = 1.0
//        
//        //Second part of cheat
//        //for round effect, not elliptical
//    //    uv.y = 1.0 - uv.y;
//        vec3 col = texture(ourTexture, vec2(uv.x, uv.y)).xyz;
//        
//        resultColor = vec4(col, 1.0);
//    } else {
//        resultColor = texture(ourTexture, getRightCoordinates());
//    }
}
