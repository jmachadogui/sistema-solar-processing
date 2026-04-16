class Moon {
  // Each planet object keeps track of its own angle of rotation.
  float theta;      // Rotation around sun
  float diameter;   // Size of planet
  float distance;   // Distance from sun
  float orbitspeed; // Orbit speed
  color moonColor;
  
  Moon(float distance_, float diameter_, color moonColor_) {
    distance = distance_;
    diameter = diameter_;
    theta = 0;
    orbitspeed = random(-0.1,0.1);
    moonColor = moonColor_;
  }
  
  void update() {
    // Increment the angle to rotate
    theta += orbitspeed;
  }
  
  void display() {
    // Before rotation and translation, the state of the matrix is saved with pushMatrix().
    pushMatrix(); 
    // Rotate orbit
    rotate(theta); 
    // translate out distance
    translate(distance,0); 
    stroke(0);
    fill(moonColor);
    ellipse(0,0,diameter,diameter);
    // Once the planet is drawn, the matrix is restored with popMatrix() so that the next planet is not affected.
    popMatrix(); 
  }
}
