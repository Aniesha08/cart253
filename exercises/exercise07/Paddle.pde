// Paddle
//
// A class that defines a paddle that can be moved right and left on the screen
// using keys passed through to the constructor.

class Paddle {

  // Variables for position, velocity, speed
  // paddle width, paddle height & color
  float px;
  float py;
  float vx;
  float speed;
  float w;
  float h;
  color c;

  // Constructor: creates a Paddle with the provided values by remembering them. 
  Paddle(float paddleX, float paddleY, float paddleWidth, float paddleHeight, color paddleColor) {
    px = paddleX;
    py = paddleY;
    vx = 0;
    speed = 10;
    w = paddleWidth;
    h = paddleHeight;
    c = paddleColor;
  }

  // update()
  //
  // Updates position based on velocity and constraints the paddle to the window

  // States what updatePaddle() function will do
  void updatePaddle() {
    px += vx;  // The x position of the paddle (320px) is equal to the x position (320px) + paddleVX (0)
    px = constrain(px, 0+w/2, width-w/2); // The x position of the paddle should not exceed the min (0) or max (320) of the width of the window, in other words, it will stop at both edges and not go outside the window
  }

  // Draw the paddle
  void drawPaddle() {
    rectMode(CENTER); // Paddle's center point
    noStroke();  // No stroke for the paddle
    fill(c);  // Paddle's fill color
    rect(px, py, w, h); // Paddle's position and dimension
  }

  void keyPressed() {
    if (keyCode == LEFT) { // If the key is pressed to the Left, move to the left. The paddle speed will be negative since it's moving to the left.
      vx = -speed;
    } else if (keyCode == RIGHT) { // If the key is pressed to the Right, move to the right. The paddle speed will be positive since it's moving to the right.
      vx = speed;
    }
  }

  void keyReleased() {
    if (keyCode == LEFT && vx < 0) { // If the key is released to the left AND the paddle's x velocity is < than 0,...
      vx = 0; // ...the paddle will be stopped
    } else if (keyCode == RIGHT && vx > 0) { // If the key is released to the left AND the paddle's x velocity is > than 0...
      vx = 0; // ...the paddle will be stopped
    }
  }
}