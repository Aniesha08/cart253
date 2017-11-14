// Bouncer
//
// A class that defines a circle that can bounce around on the screen
// at a specific velocity.

class Bouncer {

  int SPEED = 2;

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
  // Constructor: creates a Bouncer with the provided values by remembering them.

  Bouncer(float tempX, float tempY, float tempVX, float tempVY, color tempDefaultColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    defaultColor = tempDefaultColor;
    fillColor = defaultColor;
  }

  // update()
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

      int quadrant = handleBallQuadrant();
      if (quadrant == 1) {
        quad1.play();
      } else if (quadrant == 2) {
        quad2.play();
      } else if (quadrant == 3) {
        quad3.play();
      }else if (quadrant == 4) {
        quad4.play();
      }
      
    }

    // Check the top and bottom
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      // Bounce on the y-axis
      vy = -vy;

      int quadrant = handleBallQuadrant();
      if (quadrant == 1) {
        quad1.play();
      } else if (quadrant == 2) {
        //quad2.play();
      } else if (quadrant == 3) {
        //quad3.play();
      }else if (quadrant == 4) {
        quad4.play();
      }
    }

    // Make sure the Bouncer isn't off the edge
    x = constrain(x, SIZE/2, width-SIZE/2);
    y = constrain(y, SIZE/2, height-SIZE/2);
  }

  int handleBallQuadrant() { 
    // Depending on the quadrant, return a different sound
    if (x <= width/2 && y <= height/2) {
      return 1;
    }
    if (x > width/2 && y < height/2) {
      return 2;
    }
    if (x < width/2 && y > height/2) { 
      return 3;
    }
    if (x > width/2 && y > height/2) { 
      return 4;
    }
    return 0;
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
  // Returns true if the ball is off the left or right side of the window
  // otherwise false

  boolean isOffScreen() {
    return (x + SIZE/2 < 0 || x - SIZE/2 > width);
  }

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > paddle.px - paddle.w/2);
    boolean insideRight = (x - SIZE/2 < paddle.px + paddle.w/2);
    boolean insideTop = (y + SIZE/2 > paddle.py - paddle.h/2);
    boolean insideBottom = (y - SIZE/2 < paddle.py + paddle.h/2);

    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
      y = paddle.py - paddle.h/2 - SIZE/2; 
      vy = -vy;
    }
  }

  // display()
  // Draw an ellipse in the Bouncer's location, with its size and fill
  void display() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, SIZE, SIZE);
  }
}