// Bouncer
//
// A class that defines a circle that can bounce around on the screen
// at a specific velocity.

class Bouncer {
  
  int SPEED = 3;

  // Variables for position
  float x;
  float y;

  // Variables for velocity
  float vx;
  float vy;

  // The size of the Bouncer
  float SIZE = 42;

  // The current fill colour of the Bouncer
  color fillColor;

  // The default fill colour of the Bouncer
  color defaultColor;

  // Bouncer(tempX,tempY,tempVX,tempVY,tempSize,tempDefaultColor)
  //
  // Creates a Bouncer with the provided values by remembering them.

  Bouncer(float tempX, float tempY, float tempVX, float tempVY, color tempDefaultColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    defaultColor = tempDefaultColor;
    fillColor = defaultColor;
  }

  // update()
  //
  // Adds the Bouncer's current velocity to its position
  // and checks for bouncing off the walls.
  void update() {
    x += vx;
    y += vy;

    handleBounce();
  }

  // handleBounce()
  //
  // Checks if the bouncer is overlapping a side of the window
  // and if so reverses its velocity appropriately

  void handleBounce() {
    // Check the left and right
    if (x - SIZE/2 < 0 || x + SIZE/2 > width) {
      // Bounce on the x-axis
      vx = -vx;
    }

    // Check the top and bottom
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      // Bounce on the y-axis
      vy = -vy;
    }

    // Make sure the Bouncer isn't off the edge
    x = constrain(x, SIZE/2, width-SIZE/2);
    y = constrain(y, SIZE/2, height-SIZE/2);
  }

// reset()
//
// Resets the ball to the centre of the screen.
// Note that it KEEPS its velocity
  
  void reset() {
    x = width/2;
    y = height/2;
  }

  
// isOffScreen()
//
// Returns true if the ball is off the left or right side of the window
// otherwise false
// (If we wanted to return WHICH side it had gone off, we'd have to return
// something like an int (e.g. 0 = not off, 1 = off left, 2 = off right)
// or a String (e.g. "ON SCREEN", "OFF LEFT", "OFF RIGHT")
  
boolean isOffScreen() {
   return (x + SIZE/2 < 0 || x - SIZE/2 > width);
}
  
// ADDED 
// collide(Paddle paddle)
//
// Checks whether this ball is colliding with the paddle passed as an argument
// If it is, it makes the ball bounce away from the paddle by reversing its
// x velocity

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > paddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < paddle.y + paddle.HEIGHT/2);
    
    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
        paddle.score++; // ADDED the score 
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
        paddle.score++; // ADDED the score 
        
      }
      // And make it bounce
      vx = -vx;
    }
  }  
  
  

void keyPressed() {
  if (key == CODED) {
   if (keyCode == UP) {
   vx = 0;
   vy = 0;
  } else if (keyCode == DOWN){
   vx = SPEED;
   vy = SPEED;
  }
  }
}


  // display()
  //
  // Draw an ellipse in the Bouncer's location, with its size
  // and with its fill
  void display() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, SIZE, SIZE);
  }
}