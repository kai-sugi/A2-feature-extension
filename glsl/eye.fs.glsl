in vec3 modelPos;
uniform float glowIntensity;

void main() {
	vec3 baseColor;

    if (modelPos.z > 0.96) {
        baseColor = vec3(0.0, 0.0, 0.0);        // Pupil
    } else if (modelPos.z > 0.8) {
        baseColor = vec3(0.4, 0.0, 0.4);        // Iris
    } else {
        baseColor = vec3(1.0, 0.9, 0.9);        // Whites
    }

    vec3 glowColor = vec3(1.0, 0.0, 0.0); // red laser charge color

    vec3 finalColor = baseColor + glowColor * glowIntensity * 2.0;

    finalColor = clamp(finalColor, 0.0, 1.0);

    gl_FragColor = vec4(finalColor, 1.0);
}