// Exercise 06
//
// Using the webcam as input to play with Bouncers.

// Import the video library
import processing.video.*;

// The capture object for reading from the webcam
Capture video;

// ADDED class for paddles
Paddle leftPaddle;
Paddle rightPaddle;

// An array of bouncers to play with
Bouncer[] bouncers = new Bouncer[4]; // CHANGED Reduced # of bouncers

// ADDED The distance from the edge of the window to the paddle
int PADDLE_INSET = 8;

// setup()
//
// Creates the bouncers and starts the webcam

void setup() {
  size(640, 480);
  
  // ADDED Create the paddles on both sides of the screen. 
  // The PADDLE_INSET will position them on the x and position them in the center on the y axis
  // Identified which keys to press to control the paddles to make them move
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

  // Our old friend the for-loop used to go through the length of an
  // array adding new objects to it (Bouncers in this case)
  for (int i = 0; i < bouncers.length; i++) {
    // Each Bouncer just starts with random values 
    // Changed bouncers to random colors
    bouncers[i] = new Bouncer(random(0,width),random(0,height),random(-10,10),random(-10,10),color(random(255), random(255), random (255)));
  }
  
  // Start up the webcam
  video = new Capture(this, 640, 480, 30);
  video.start();
}

// draw()
//
// Processes the frame of video, draws the video to the screen, updates the Bouncers
// and then just draws an ellipse at the brightest pixel location. You code should
// do something much more interesting in order to actually interact with the Bouncers.

void draw() {

  // Draw the video frame to the screen
  image(video, 0, 0);
  
  // Our old friend the for-loop running through the length of an array to
  // update and display objects, in this case Bouncers.
  // If the brightness (or other video property) is going to interact with all the
  // Bouncers, it will need to happen in here.
  for (int i = 0; i < bouncers.length; i++) {
   bouncers[i].update();
   bouncers[i].display();
  }
  
  // ADDED Update the Paddles
  leftPaddle.update();
  rightPaddle.update();
  
  // ADDED Display the paddles
  leftPaddle.display();
  rightPaddle.display();
  
}


// ADDED keyPressed()
//
// Paddles will move when the keys are pressed

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// ADDED keyReleased()
//

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}