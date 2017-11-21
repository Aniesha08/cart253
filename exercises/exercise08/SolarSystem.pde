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
    
    // Run the quandrants function to change the pointLight state 
    // depending on the quadrant the mouse is focused on
    quadrants();

    // Show the sun & the planets orbiting it 
    sun.show();
    sun.orbit();
  }

// PROBLEM: If you move your mouse the opposite direction, 
// for example if you moved it clockwise, it's fine but when
// you move it counter-clockwise, the process of revealing the side is very slow
// or is does not work...need to figure out...

  void quadrants() {
    // Quadrant 1
    // If the mouse is pointing to the top left, increase the brightness of the sun, 
    // to reveal the top left side of the sun
    if (mouseX <= width/2 && mouseY <= height/2) {
      r += 30;
      g += 30;
      b += 30;
      pointX -= 10;
      pointY -= 10;
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
    }
    
    // Quadrant 2
    // If the mouse is pointing to the top right, increase the brightness of the sun, 
    // to reveal the top right side of the sun
    if (mouseX > width/2 && mouseY < height/2) {
      //sun.changeSpeed(-0.001);
      r += 30;
      g += 30;
      b += 30;
      pointX += 10;
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
    }
    
    // Quadrant 3
    // If the mouse is pointing to the top left, increase the brightness of the sun, 
    // to reveal the bottom left side of the sun
    if (mouseX < width/2 && mouseY > height/2) {
      r += 30;
      g += 30;
      b += 30;
      pointX -= 10;
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
    }
    
    // Quadrant 4
    // If the mouse is pointing to the bottom right, increase the brightness of the sun, 
    // to reveal the bottom right side of the sun
    if (mouseX > width/2 && mouseY > height/2) {
      r += 30;
      g += 30;
      b += 30;
      pointX += 10;
      pointY += 10;
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
    }
  }

  void keyPressed() {
    sun.keyPressed();
  }

  void keyReleased() {
    sun.keyReleased();
  }
}