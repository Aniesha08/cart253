class SolarSystem {

  // Variables for image background and textures of planets 
  PImage sunTexture;
  
  Planet sun;
  
  // Variables of the initial state of pointLight when program is started
  int r = 128;
  int g = 128;
  int b = 128;
  int pointX = 0;
  int pointY = 0;
  int pointZ = 100;


// Function containg the sun and the number of orbiting planets & level
  SolarSystem() {
    sunTexture = loadImage("images/sun.jpg");

    // Arguments for the sun
    sun = new Planet (35, 0, 0, sunTexture);

    sun.orbitingPlanets(5, 1);
  }

  void update() {   
    //Inital pointLight state
    pointLight(r, g, b, pointX, pointY, pointZ);

    // Show the sun & the planets orbiting it 
    sun.show();
    sun.orbit();
  }

  void keyPressed() {
    sun.keyPressed();
  }

  void keyReleased() {
    sun.keyReleased();
  }
}