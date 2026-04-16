class Planet {
  // Each planet object keeps track of its own angle of rotation.
  float theta;      // Rotation around sun
  float diameter;   // Size of planet
  float distance;   // Distance from sun
  float orbitspeed; // Orbit speed
 
  // Each Planet now has a Moon!
  Moon moon;
  Moon[] moons = new Moon[5];
  int quantityMoons = 1;
  Planet(float distance_, float diameter_, int moons_) {
    distance = distance_;
    diameter = diameter_;
    theta = 0;
    orbitspeed = random(0.01,0.03);
    
    // create the Moon 24 pixels from the planet with a diameter of 5
    //moon = new Moon(24,5);
    quantityMoons = moons_;
    instantiateMoons(moons_);
  }
  
  void instantiateMoons(int quantity){
    for(int i = 0; i < quantity; i++){
      float distance = random(20, 46);
      moons[i] = new Moon(distance, 5);
    }
  }
  
  void updateMoons(){
    for(int i = 0; i < quantityMoons; i++){
      moons[i].update();
    }
  }
  
  void displayMoons(){
    for(int i = 0; i < quantityMoons; i++){
      moons[i].display();
    }
  }
  
  void update() {
    // Increment the angle to rotate
    theta += orbitspeed;
    // Update the moon
    //moon.update();
    updateMoons();
  }
  
  void display() {
    // Before rotation and translation, the state of the matrix is saved with pushMatrix().
    pushMatrix(); 
    // Rotate orbit
    rotate(theta); 
    // translate out distance
    translate(distance,0); 
    stroke(0);
    fill(175);
    ellipse(0,0,diameter,diameter);
    // The planet is drawn, now draw the moon
    //moon.display();
    displayMoons();
    // Once the planet is drawn, the matrix is restored with popMatrix() so that the next planet is not affected.
    popMatrix(); 
  }
}
