// Variable to make the background color black
color backgroundColor = color(0);

// Varibles for the mini rectangles running in the background
int numStatic = 1000; // # of circles
int staticSizeMin = 1; // Min size of the circle
int staticSizeMax = 3; // Max size of the circle
color staticColor = color(200); // Circle color

// Variables for the position and movement of the paddle
int paddleX;
int paddleY; 
int paddleVX; 
int paddleSpeed = 10;

// Variables for the paddle dimensions and color
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);

// Variables for the position and movement of the ball
int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;

// Variables for the ball size and color
int ballSize = 16;
color ballColor = color(255);

// Dimensions of the window has been stated. Run the functions: setupPaddle() and setupBall() at the start of the program
void setup() {
  size(640, 480);
  
  setupPaddle(); // Will pick up code from below on what to do
  setupBall(); // Will pick up code from below on what to do
}

// States what setupPaddle() function will do
void setupPaddle() {
  paddleX = width/2; // The paddle's x positon is half the width: 320
  paddleY = height - paddleHeight; // The paddle's y position is the height (480) - the paddleHeight (16) = 464
  paddleVX = 0; // The velocity is 0 meaning the paddle will be static at the start of the program
}

// States what setupBall() function will do
void setupBall() {
  ballX = width/2; // The ball's x position is half the width: 320
  ballY = height/2; // The ball's y position is half the height: 240
  ballVX = ballSpeed; // The ball's x (horizonal) velocity is 5
  ballVY = ballSpeed; // The ball's y (verical) velocity is 5
}

void draw() {
  background(backgroundColor); // Background color will be black. Variable color value given on line 2
  // Run the functions drawStatic(); updatePaddle(); updateBall(); drawPaddle(); drawBall();
  // What to do is stated starting from line 69
  drawStatic(); // Will pick up code from below on what to do

  updatePaddle(); // Will pick up code from below on what to do
  updateBall(); // Will pick up code from below on what to do

  drawPaddle(); // Will pick up code from below on what to do
  drawBall(); // Will pick up code from below on what to do
}

// States what drawStatic() function will do
void drawStatic() {
// i is equal to 0. If i is less than, numStatic (1000), keep adding a mini rectangle up to 1000
  for (int i = 0; i < numStatic; i++) { 
   float x = random(0,width); // Random directions horizontally
   float y = random(0,height); // Random directions vertically
   float staticSize = random(staticSizeMin,staticSizeMax); // Alternate the rectangle size randomly based on the staticSizeMin & staticSizeMax variable. Therefore between sizes 1-3 (see line 6 & 7)
   fill(staticColor); // The mini rectangle's color
   rect(x,y,staticSize,staticSize); // The position and size of the rectangle will move and alternate randomly. (Based on the values given to the Variables: x, y, staticSizeMin, staticSizeMax)
  }
}

// States what updatePaddle() function will do
void updatePaddle() {
  paddleX += paddleVX;  // The x position of the paddle (320px) is equal to the x position (320px) + paddleVX (0)
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2); // The x position of the paddle should not exceed the min (0) or max (320) of the width of the window, in other words, it will stop at both edges and not go outside the window
}

// States what updateBall() function will do
void updateBall() {
  ballX += ballVX; // The x position of the ball (320px) is equal to the x position (320px) + ballVX (5)
  ballY += ballVY; // The y position of the ball (240px) is equal to the y position (240px) + ballVX (5)
  
// Run the following 3 functions
  handleBallHitPaddle(); // Will pick up code from below on what to do
  handleBallHitWall(); // Will pick up code from below on what to do
  handleBallOffBottom(); // Will pick up code from below on what to do
}

// States what drawPaddle() function will do
void drawPaddle() {
  rectMode(CENTER); // Paddle's center point
  noStroke();  // No stroke for the paddle
  fill(paddleColor);  // Paddle's fill color
  rect(paddleX, paddleY, paddleWidth, paddleHeight); // Paddle's position and dimension
}

// States what drawBall() function will do
void drawBall() {
  rectMode(CENTER); // Ball's center point
  noStroke(); // No stroke for the paddle
  fill(ballColor); // Balls's fill color
  rect(ballX, ballY, ballSize, ballSize); // Ball's position and size
}

// States what handleBallHitPaddle() function will do: What to do when the ball hits the paddle
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) { // If the function ballOverlapsPaddle() returns true, execute this
    ballY = paddleY - paddleHeight/2 - ballSize/2; // Sets the balls y-position on the paddle
    ballVY = -ballVY; // Bounce off the oppostite direction
  }
}

boolean ballOverlapsPaddle() { // Check to see if the ball hit the paddle
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) { // Check to see if the ball's parameters constraints are within the paddle's parameter contraints
    if (ballY > paddleY - paddleHeight/2) { // Check to see if the ball's Y position is above the paddle
      return true; // Returns true because the ball is above the paddle and will execute the function handleBallHitPaddle()
    }
  }
  return false; // The ball is not within the parameter constraints of the paddle therefore will not execute function handleBallHitPaddle()
}

void handleBallOffBottom() { // Resets the ball to the center of the window
  if (ballOffBottom()) { 
    ballX = width/2; // Ball's x-position is half the width
    ballY = height/2; // Ball's y-position is half the height
  }
}

boolean ballOffBottom() {
  return (ballY - ballSize/2 > height); // Checks to see if the ball is going off the window at the bottom, if so, execute function handleBallOffBottom()
}

void handleBallHitWall() { 
  if (ballX - ballSize/2 < 0) { // If the ball hits the left side of the wall, the x-positon will be 0 so it says to bounce of the left wall
    ballX = 0 + ballSize/2;
    ballVX = -ballVX; // Bounce off the wall
  } else if (ballX + ballSize/2 > width) { // If the ball hits the right side of the wall, the x-positon of the wall will be > width so bounce off the right wall
    ballX = width - ballSize/2;
    ballVX = -ballVX; // Bounce off the wall
  }
  
  if (ballY - ballSize/2 < 0) { // If the ball his the top wall, the y-position of the ball will be < 0 so bounce off the top wall
    ballY = 0 + ballSize/2;
    ballVY = -ballVY; // Bounce off the wall
  }

}

void keyPressed() {
  if (keyCode == LEFT) { // If the key is pressed to the Left, move to the left. The paddle speed will be negative since it's moving to the left.
    paddleVX = -paddleSpeed; 
  } else if (keyCode == RIGHT) { // If the key is pressed to the Right, move to the right. The paddle speed will be positive since it's moving to the right.
    paddleVX = paddleSpeed;
  }
}

void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) { // If the key is released to the left AND the paddle's x velocity is < than 0,...
    paddleVX = 0; // ...the paddle will be stopped
  } else if (keyCode == RIGHT && paddleVX > 0) { // If the key is released to the left AND the paddle's x velocity is > than 0...
    paddleVX = 0; // ...the paddle will be stopped
  }
}