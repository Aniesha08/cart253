// Exercise 06
//
// Using the webcam as input to play with Bouncers.

/** Code taken from Processing Examples
 * Mirror 
 * by Daniel Shiffman.  
 *
 * Each pixel from the video source is drawn as a rectangle with rotation based on brightness.   
*/ 

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

// ADDED vairable to display the winner text and score
color winnerText = color (255, 255, 255);
color winnerDisplayBg = color(255, 210, 31);
int winningScore = 10;

// ADDED Size of each cell in the grid
int cellSize = 20;
// ADDED Number of columns and rows in our system
int cols, rows;

// setup()
//
// Creates the bouncers and starts the webcam

void setup() {
  size(640, 480);
  background(0);

  // ADDED Scores
  textSize (25);
  textAlign (CENTER, CENTER);
  
  // ADDED from Mirror example
  frameRate(30);
  cols = width / cellSize;
  rows = height / cellSize;
  colorMode(RGB, 255, 255, 255, 100);

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
    bouncers[i] = new Bouncer(random(0, width), random(0, height), random(-10, 10), random(-10, 10), color(random(255), random(255), random (255)));
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
  //image(video, 0, 0);
  
  
  // ADDED code for having a webcam in the background
     if (video.available()) {
    video.read();
    video.loadPixels();
  
    // Begin loop for columns
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {
      
        // Where are we, pixel-wise?
        int x = i*cellSize;
        int y = j*cellSize;
        int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image
      
        float r = red(video.pixels[loc]);
        float g = green(video.pixels[loc]);
        float b = blue(video.pixels[loc]);
        // Make a new color with an alpha component
        color c = color(r, g, b, 75);
      
        // Code for drawing a single rect
        // Using translate in order for rotation to work properly
        pushMatrix();
        translate(x+cellSize/2, y+cellSize/2);
        // Rotation formula based on brightness
        rotate((2 * PI * brightness(c) / 255.0));
        rectMode(CENTER);
        fill(c);
        noStroke();
        // Rects are larger than the cell for some overlap
        ellipse(0, 0, cellSize+6, cellSize+6);
        popMatrix();
      }
    }
  }

  // Update the paddles
  leftPaddle.update();
  rightPaddle.update();

  // Display the paddles
  leftPaddle.display();
  rightPaddle.display();

  // Our old friend the for-loop running through the length of an array to
  // update and display objects, in this case Bouncers.
  // If the brightness (or other video property) is going to interact with all the
  // Bouncers, it will need to happen in here.
  for (int i = 0; i < bouncers.length; i++) {
    bouncers[i].update();

    // ADDED Check if the ball has collided with either paddle
    bouncers[i].collide(leftPaddle);
    bouncers[i].collide(rightPaddle);


    // Display the bouncers
    bouncers[i].display();


    // ADDED Check if the ball has gone off the screen
    if (bouncers[i].isOffScreen()) {
      // If it has, reset the ball
      bouncers[i].reset();
    }
  }

  // Display the scores + winner and reset the game
  scores();
  gameOver();
}

// ADDED Displays the scores
void scores() {
  fill (255);
  text ("Player 1: " + leftPaddle.score, 155, 40);
  text ("Player 2: " + rightPaddle.score, 480, 40);
}

// Displays who is the winner
void gameOver() {
  if (leftPaddle.score >= winningScore) {
    gameOverPage("Player1 wins", winnerText);
  }
  if (rightPaddle.score >= winningScore) {
    gameOverPage("Player2 wins", winnerText);
  }
}

// ADDED Pop-up when game is over
void gameOverPage (String text, color c) {
  for (int i = 0; i < bouncers.length; i++) {
    bouncers[i].vx = 0;
    bouncers[i].vy = 0;
    leftPaddle.vx = 0;
    leftPaddle.vy = 0;
  }

  fill (winnerDisplayBg);
  stroke(255, 255, 255);
  strokeWeight(4);
  rect (320, 250, 320, 200);
  fill (255);
  text ("GAME OVER", width/2, height/3 + 40);
  text (text, width/2, height/3 + 80);
  text ("Click to play again", width/2, height/3 + 120);

  if (mousePressed) {
    for (int i = 0; i < bouncers.length; i++) {
      bouncers[i].vx = floor(random (-5, 5));
      bouncers[i].vy = floor(random (-5, 5));
      bouncers[i].reset();
    }
    leftPaddle.score = 0;
    rightPaddle.score = 0;
  }
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