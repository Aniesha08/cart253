// An array of bouncers
Bouncer[] bouncers = new Bouncer[5];
Paddle paddle;

void setup() {
  size(640, 480);
  background(0);
  
  paddle = new Paddle(width/2, height-16, 128, 16, color(255));
  
  // For-loop used to go through the length of the array adding new objects
  for (int i = 0; i < bouncers.length; i++) {
  // Each Bouncer just starts with random values 
  bouncers[i] = new Bouncer(random(0, width), random(0, height), random(-10, 10), random(-10, 10), color(random(255), random(255), random (255)));
  }
}


void draw() {
  background(0);
  
  paddle.updatePaddle();
  paddle.drawPaddle();
  
  for (int i = 0; i < bouncers.length; i++) {
    bouncers[i].update();

    bouncers[i].collide(paddle);

    // Display the bouncers
    bouncers[i].display();

    // ADDED Check if the ball has gone off the screen
    if (bouncers[i].isOffScreen()) {
      // If it has, reset the ball
      bouncers[i].reset();
    }
  }
  
  // If the mouse is pressed the bouncers will reset and spread out from the center at a velocity of 5
  if (mousePressed) {
    for (int i = 0; i < bouncers.length; i++) {
      bouncers[i].vx = floor(random (-5, 5));
      bouncers[i].vy = floor(random (-5, 5));
      bouncers[i].reset();
    }
  }
}

void keyPressed() {
  paddle.keyPressed();
}

void keyReleased() {
  paddle.keyReleased();
}