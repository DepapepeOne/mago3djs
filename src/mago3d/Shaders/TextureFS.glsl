precision mediump float;
varying vec4 vColor;
varying vec2 vTextureCoord;
uniform sampler2D uSampler;

void main()
{
    gl_FragColor = texture2D(uSampler, vec2(vTextureCoord.s, vTextureCoord.t));
}