// Planet
// Class that shows the Sun and the planets orbiting the Sun
class Planet {
  // Array inside the Planet class to create the planets that will orbit around the sun
  Planet[] planets;

  // Variables for the sun and planets
  float radius;
  float distance;
  float angle;
  float orbitSpeed;
  PVector v;
  PVector p; // Perpendicular 
  PShape globe;


  // Constructor to create the planets
  Planet (float r, float d, float o, PImage img) {


    v = PVector.random3D();
    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitSpeed = o;

    // Properties to create the Sun
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
  }

  void orbit() {
    angle = angle + orbitSpeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit(); // Make the children planets orbit
      }
    }
  }

  // When a planet is created, the radius is shrinked, the distance
  // is random, orbital speed is random, texture of planets is random (picked up from array index)
  void orbitingPlanets(int total, int level) {
    // New planet array
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius/(level*2);
      float d = random((radius + r), (radius + r)*3); // distance between the planets touching and a little further away
      float o = random (-0.050, 0.050); // orbital speed range
      int index = int(random(0, textures.length));
      planets[i] = new Planet(r, d, o, textures[index]);
      if (level < 2) {// level of planets 
        int num = int(random(0, 3));
        planets[i].orbitingPlanets(num, level+1);
      }
    }
  }

// Function to change the speed of the orbiting planets
  void changeSpeed(float amount) {
    orbitSpeed += (amount);
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].changeSpeed(amount);
      }
    }
  }

  void show() {
    pushMatrix(); // Save
    noStroke();
    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    rotate (angle, p.x, p.y, p.z);

    // Lines to help visualize the Perpendicular rotation of the Planets 
    //stroke (255);
    //line (0, 0, 0, v.x, v.y, v.z); // perpendicular rotation
    //line (0, 0, 0, p.x, p.y, p.z); // axis in which it is rotating

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