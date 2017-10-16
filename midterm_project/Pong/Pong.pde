// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball[] balls = new Ball[4]; // ADDED and array so we have 4 balls

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// Sound of the game, beep sound when ball hit the paddle
import processing.sound.*; //import sound library
SoundFile file;
String audioName = "beep.wav"; //audio file 
String path; 

// ADDED Icons of the balls
PImage smileyR;
PImage smileyL;

// ADDED Background split
PImage blueBg;
PImage redBg;


// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);
  
  // ADDED Background Split
  imageMode (CORNER);
  blueBg = loadImage("player01.jpg");
  imageMode (CORNER);
  redBg = loadImage("player02.jpg");
  
  // ADDED Smileys (Balls)
  imageMode (CENTER);
  smileyR = loadImage("smileR.png");
  imageMode (CENTER);
  smileyL = loadImage("smileL.png");
  
  // Sound
  path = sketchPath(audioName);
  file = new SoundFile(this, path);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

  // Create the ball at the centre of the screen
  // ADDED an array 
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(width/2, height/2);
  }
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  // ADDED
  // Player 1 Side
  image(blueBg, 160, 240, 320, 480);
  // Player 2 Side
  image(redBg, 480, 240, 320, 480);
  // Middle Division
  fill(255, 255, 255);
  noStroke();
  rect(320, 0, 5, 960);

  // Update the paddles and ball by calling their update methods
  // ADDED the array code for the ball methods
  leftPaddle.update();
  rightPaddle.update();
  for (int i = 0; i < balls.length; i++) {
    balls[i].update();

    // Check if the ball has collided with either paddle
    balls[i].collide(leftPaddle);
    balls[i].collide(rightPaddle);

    // Display the ball
    balls[i].display();

    // Check if the ball has gone off the screen
    if (balls[i].isOffScreen()) {
      // If it has, reset the ball
      balls[i].reset();
    }
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}