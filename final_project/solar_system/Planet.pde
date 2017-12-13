// Planet
// Class that shows the Sun and the planets orbiting the Sun
class Planet {
  // Array inside the Planet class to create the planets that will orbit around the sun
  Planet[] planets;

  // Variables for the sun and planets
  // Code from tutorial
  float radius;
  float distance;
  float angle;
  float orbitSpeed;
  PVector v;
  PVector p; 
  PShape globe;

  // Get the current level (volume) going into the microphone 
  // and change orbit speed by controlling by the sound 
  float volSpeed; // Added myself
  float sound; // Added myself

  // Constructor to create the planets
  // Code from tutorial
  //Planet (float r, float d, float o, float vol, PImage img) {
  Planet (float r, float d, float o, float volSpeed, PImage img) {
    v = PVector.random3D();
    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitSpeed = o; 
    sound = volSpeed; // Added myself

    // Properties to create the Sun
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
  }

// Make the children planets orbit
// Code from tutorial
  void orbit() {
    angle = angle + orbitSpeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit(); 
      }
    }
  }

  // When a planet is created, the radius is shrinked, the distance is random, 
  // orbital speed is random (controlled by sound), texture of planets is random (picked up from array index in main program)
  // Code from tutorial - modified to go with sound interaction
  void orbitingPlanets(int total, int planetLevel) {
    // New planet array
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius/(planetLevel*2);
      float d = random((radius + r), (radius + r)*3); // distance between the planets touching and a little further away
      float o = random (-0.025, 0.025); // orbital speed range random
      int index = int(random(0, textures.length));
      planets[i] = new Planet(r, d, o, volSpeed, textures[index]); // Modified
      if (planetLevel < 2) {// level of planets 
        int num = int(random(0, 3));
        planets[i].orbitingPlanets(num, planetLevel+1);
      }
    }
  }

// Update the orbitSpeed of the planet based on the sound level 
// OrbitSpeed is contrained
// Added myself
  void updateSpeed(float level) {
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        float tempSpeed = constrain(level*10*random(0.7, 1), 0.01, 0.25);
        planets[i].orbitSpeed = tempSpeed;
      }
    }
  }

  void show() {
    // Code from tutorial
    pushMatrix(); // Save
    noStroke();
    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    rotate (angle, p.x, p.y, p.z);

    translate (v.x, v.y, v.z);
    shape(globe);
    if (planets != null) { // Only call show as long as there are planets
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix(); // Restore
  }

  // keyPressed()
  //
  // Called by the main program when the title is active.
  // Sets finished to true immediately (since it's any key)

  void keyPressed() {
    //finished = true;
  }

  // keyReleased()
  //
  // Does nothing.

  void keyReleased() {
  }
}