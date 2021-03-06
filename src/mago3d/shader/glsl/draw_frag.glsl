precision mediump float;

uniform sampler2D u_wind;
uniform vec2 u_wind_min;
uniform vec2 u_wind_max;
uniform bool u_flipTexCoordY_windMap;
uniform bool u_colorScale;

varying vec2 v_particle_pos;

void main() {
	vec2 windMapTexCoord = v_particle_pos;
	if(u_flipTexCoordY_windMap)
	{
		windMapTexCoord.y = 1.0 - windMapTexCoord.y;
	}
    vec2 velocity = mix(u_wind_min, u_wind_max, texture2D(u_wind, windMapTexCoord).rg);
    float speed_t = length(velocity) / length(u_wind_max);

	
	if(u_colorScale)
	{
		speed_t *= 1.5;
		if(speed_t > 1.0)speed_t = 1.0;
		float b = 1.0 - speed_t;
		float g;
		if(speed_t > 0.5)
		{
			g = 2.0-2.0*speed_t;
		}
		else{
			g = 2.0*speed_t;
		}
		float r = speed_t;
		gl_FragColor = vec4(r,g,b,1.0);
	}
	else{
		float intensity = speed_t*3.0;
		if(intensity > 1.0)
			intensity = 1.0;
		gl_FragColor = vec4(intensity,intensity,intensity,1.0);
	}
}
