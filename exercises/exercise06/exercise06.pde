// Exercise 06
//
// Using the webcam as input to play with Bouncers.

// Import the video library
import processing.video.*;

// The capture object for reading from the webcam
Capture video;

// An array of bouncers to play with
Bouncer[] bouncers = new Bouncer[4]; // CHANGED Reduced # of bouncers

// setup()
//
// Creates the bouncers and starts the webcam

void setup() {
  size(640, 480);

  // Our old friend the for-loop used to go through the length of an
  // array adding new objects to it (Bouncers in this case)
  for (int i = 0; i < bouncers.length; i++) {
    // Each Bouncer just starts with random values 
    // Changed bouncers to random colors
    bouncers[i] = new Bouncer(random(0,width),random(0,height),random(-10,10),random(-10,10),random(20,50),color(random(255), random(255), random (255)));
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
  
}