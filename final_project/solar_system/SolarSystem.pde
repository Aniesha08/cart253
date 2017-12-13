class SolarSystem {

  // Variables for the texture of the sun
  PImage sunTexture;
  Planet sun; 

  // Function containg the sun and the number of orbiting planets & level
  SolarSystem() {
    sunTexture = loadImage("images/2k_sun.jpg");

    // Arguments for the sun
    sun = new Planet (35, 0, 0, 0, sunTexture);

    sun.orbitingPlanets(5, 1);
  }

  void update() {   
    // Update point light according to brightest pixel detected by the the camera
    // pointLight (r,g,b,x,y,z)
    pointLight(255, 255, 255, brightestPixel.x, brightestPixel.y, 150);

    // Show the sun & the planets orbiting it 
    // Update the orbital speed based on sound level from microphone
    sun.show();
    sun.orbit();
    sun.updateSpeed(level);
  }
}