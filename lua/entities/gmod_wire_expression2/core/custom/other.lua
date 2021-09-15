e2function void lerp(t, from, to) 
	return Lerp( t, from, to )
end

e2function void lerpVec(fraction, vector from, vector to) 
	return LerpVector( fraction, Vector(from[1], from[2], from[3]), Vector(to[1], to[2], to[3]) )
end

e2function void lerpAng(ratio, angle angleStart, angle angleEnd) 
	return LerpAngle( ratio, Vector(angleStart[1], angleStart[2], angleStart[3]), Vector(angleEnd[1], angleEnd[2], angleEnd[3]) )
end