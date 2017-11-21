class SolarSystem {
  PImage sunTexture;
  
  Planet sun;


// Function containg the sun and the number of orbiting planets & level
  SolarSystem() {
    sunTexture = loadImage("images/sun.jpg");

    // Arguments for the sun
    sun = new Planet (35, 0, 0, sunTexture);

    sun.orbitingPlanets(5, 1);
  }

  void update() {   
    pointLight(128, 128, 128, 0, 0, 100);
    
    // Show the sun & the planets orbiting it 
    sun.show();
    sun.orbit();
  }

}