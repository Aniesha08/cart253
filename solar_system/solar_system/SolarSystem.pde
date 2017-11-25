class SolarSystem {

  // Variables for image background and textures of planets 
  PImage sunTexture;
  
  Planet sun;
  
  // Variables of the initial state of pointLight when program is started
  int r = 128;
  int g = 128;
  int b = 128;
  float pointX = 0;
  float pointY = 0;
  float pointZ = 0;


// Function containg the sun and the number of orbiting planets & level
  SolarSystem() {
    sunTexture = loadImage("images/sun.jpg");

    // Arguments for the sun
    sun = new Planet (35, 0, 0, 0, sunTexture);

    sun.orbitingPlanets(5, 1);
  }

  void update() {   
    //Change point light according to brightest pixel
    //pointLight(255, 255, 255, brightestPixel.x - width/2, brightestPixel.y - height/2, 200);
    pointLight(255, 255, 255, mouseX - width/2, mouseY - height/2, 200);
    
    // Run the quandrants function to change the pointLight state 
    // depending on the quadrant the mouse is focused on
    //quadrants();

    // Show the sun & the planets orbiting it 
    sun.show();
    sun.orbit();
    //sun.changeSpeed();
  }

// PROBLEM: If you move your mouse the opposite direction, 
// for example if you moved it clockwise, it's fine but when
// you move it counter-clockwise, the process of revealing the side is very slow
// or is does not work...need to figure out...

  //void quadrants() {
  //  // Quadrant 1
  //  // If the mouse is pointing to the top left, increase the brightness of the sun, 
  //  // to reveal the top left side of the sun
  //  // FAST ORBITAL SPEED
  //  if (mouseX <= width/2 && mouseY <= height/2) {
  //  //if (brightestPixel.x <= width/2 && brightestPixel.y <= height/2) {
  //    r += 60;
  //    g += 30;
  //    b += 30;
  //    pointX -= 10;
  //    pointY -= 10;
  //    r = constrain(r, 0, 255);
  //    g = constrain(g, 0, 255);
  //    b = constrain(b, 0, 255);
  //    //sun.changeSpeed(+0.001);
  //  }
    
  //  // Quadrant 2
  //  // If the mouse is pointing to the top right, increase the brightness of the sun, 
  //  // to reveal the top right side of the sun
  //  if (mouseX > width/2 && mouseY < height/2) {
  //  //if (brightestPixel.x > width/2 && brightestPixel.y < height/2) {
  //    r += 30;
  //    g += 60;
  //    b += 30;
  //    pointX += 10;
  //    r = constrain(r, 0, 255);
  //    g = constrain(g, 0, 255);
  //    b = constrain(b, 0, 255);
  //  }
    
  //  // Quadrant 3
  //  // If the mouse is pointing to the top left, increase the brightness of the sun, 
  //  // to reveal the bottom left side of the sun
  //  if (mouseX < width/2 && mouseY > height/2) {
  //  //if (brightestPixel.x < width/2 && brightestPixel.y > height/2) {
  //    r += 30;
  //    g += 30;
  //    b += 60;
  //    pointX -= 10;
  //    r = constrain(r, 0, 255);
  //    g = constrain(g, 0, 255);
  //    b = constrain(b, 0, 255);
  //  }
    
  //  // Quadrant 4
  //  // If the mouse is pointing to the bottom right, increase the brightness of the sun, 
  //  // to reveal the bottom right side of the sun
  //  if (mouseX > width/2 && mouseY > height/2) {
  //  //if (brightestPixel.x > width/2 && brightestPixel.y > height/2) {
  //    r += 30;
  //    g += 30;
  //    b += 30;
  //    pointX += 10;
  //    pointY += 10;
  //    r = constrain(r, 0, 255);
  //    g = constrain(g, 0, 255);
  //    b = constrain(b, 0, 255);
  //  }
    
  //  pointX = brightestPixel.x;
  //  pointY = brightestPixel.y;
  //  pointZ = 0;
  //}
  


  void keyPressed() {
    sun.keyPressed();
  }

  void keyReleased() {
    sun.keyReleased();
  }
}