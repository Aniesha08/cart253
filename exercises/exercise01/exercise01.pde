// Below (from line 3-18) are Variables. The structure of a variable usually consists of having a name, type and value. For example, if you want to give a variable for a background color, you would name your variable something like: backgroundColor. Below is an int, meaning integer, this could be the number 0 or a positive or negative number. int is a Type. A type of variable could also be a color or a string of text as well. 
// Notice how the variable names are relevant to the change you want to make. It will make it easier to code and to understand what is happening and changing in the program. 
int CIRCLE_SPEED = 7; // The value given to the variable, CIRCLE_SPEED, is 7. Since the value is a number, the type is an int (integer). 

// The value given to following 4 variables below is a color, written in (r,g,b) therefore the Type of variable would be color.
color NO_CLICK_FILL_COLOR = color(250, 100, 100); // Make the color for the variable NO_CLICK_FILL_COLOR, red.
color CLICK_FILL_COLOR = color(100, 100, 250); // Make the color for the variable CLICK_FILL_COLOR, purplish blue. 
color BACKGROUND_COLOR = color(250, 150, 150); // Make the color for the variable BACKGROUND_COLOR, light red.
color BACKGROUND_COLOR_KEY = color(20, 150, 150); // ADDED a new variable
color STROKE_COLOR = color(250, 150, 150); // Make the color for the variable STROKE_COLOR, light red.
color COLORWHITE = color(255, 255, 255); // ADDED a new variable

int CIRCLE_SIZE = 50; // The value given to the variable, CIRCLE_SIZE, is 50. In other words, it is saying to make the circle size 50. 

// The following 4 lines of code is saying that the value of the variables circleX, circleY, circleVX, circleVY are int (integers) meaning numbers. 
// These values will be determined in the next section of code which starts on line 23-26. 
int circleX; // Circle's x location
int circleY; // Circle's y location
int circleVX; // Circle's x (horizontal) velocity
int circleVY; // Circle's y (vertical) velocity


void setup() { // void setup() function means that we are going to say what we want to happen at the start of the program. 
  size(640, 480); // This is the size of the window. The dimensions are in pixels.
  circleX = width/2; // The value for the variable circleX is half the width of the window size, therefore 320px. Therefore, the circle's x location is 320px. 
  circleY = height/2; // The value for the variable circleY is half the height of the window size, therefore 240px. Therefore, the circle's y location is 240px. 
  circleVX = CIRCLE_SPEED; // The circle's x (horizontal) velocity is equal to the CIRCLE_SPEED (value given in line 3, velocity is 7)
  circleVY = CIRCLE_SPEED; // The circle's y (vertical) velocity is equal to the CIRCLE_SPEED (value given in line 3, velocity is 7)
  stroke(STROKE_COLOR); // The stroke is the color value given on line 9, color(250, 150, 150);
  fill(NO_CLICK_FILL_COLOR); // The fill color is the color value given on line 6, color(250, 100, 100);
  background(BACKGROUND_COLOR); // The background is the color value given on line 8, color(250, 150, 150);
}

// At this stage if you run the code with what's just on the top, you will only get a background color. You will not see a circle because we havn't yet given the size of the circle or have told it to draw a circle yet. 
// We will be doing this in the following line of code which will be under the void draw() function.

void draw() { // void draw function will tell us what we want to happen in every frame of our program 
// The following lines of code are CONDITIONAL statements where we state, IF something happens, do this or ELSE do this. 
// If the position of the mouse's and circle's x/y coordinates meet and is less than (<) the CIRCLE_SIZE(which is 50), divided by 2, fill it with the color value given to the variable, CLICK_FILL_COLOR, color(100, 100, 250) which is the purplish blue. 
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR);
  } 
  
// Or else, fill it with the color value given to the variable NO_CLICK_FILL_COLOR, color(100, 100, 250);
  else {
    fill(NO_CLICK_FILL_COLOR);
  }

//CHANGED Added a CONDITIONAL. If the mouse's X position is greater than half the width OR mouse's Y position is greater than half the height, change to a white rectangle (variable COLORWHITE).  
  if (mouseX > width/2 || mouseY > height/2) {
  fill(COLORWHITE);
  rect(circleX, circleY, CIRCLE_SIZE/2, CIRCLE_SIZE/2); // Is the same thing as ellipse(320, 240, 50, 50);
  circleX += circleVX; // The x (horizontal) velocity is equal to circleX + circleVX (determined on lines: 23,25) therefore, circleX = 320 + 7 which is 327
  circleY += circleVY; // The y (vertical) velocity is equal to circleY + circleVX  (determined on lines: 24,26) therefore, circleY = 240 + 7 which is 247
  
  }
// Or else, keep it an ellipse, fill it with the color value given to the variable NO_CLICK_FILL_COLOR, color(100, 100, 250);
  else {
  fill(NO_CLICK_FILL_COLOR);
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE); // Is the same thing as ellipse(320, 240, 50, 50);
  circleX += circleVX; // The x (horizontal) velocity is equal to circleX + circleVX (determined on lines: 23,25) therefore, circleX = 320 + 7 which is 327
  circleY += circleVY; // The y (vertical) velocity is equal to circleY + circleVX  (determined on lines: 24,26) therefore, circleY = 240 + 7 which is 247
  }

// If the circle's X location + the circle size is greater than the width of the window OR if the circle's X location - half the circle size is less than 0, then make the circle move the opposite direction.
// In other words, if the circle goes outside the window on the x-axis, reverse the direction of the circle the opposite side so that is stays in the window. 
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX;
  }
// If the circle's Y location + the circle size is greater than the height of the window OR if the circle's Y location - half the circle size is less than 0, then make the circle move the opposite direction.
// In other words, if the circle goes outside the window on the y-axis, reverse the direction of the circle the opposite side so that is stays in the window. 
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;
  }
}

// When the mouse is pressed, make the color of the background the color given to the variable, BACKGROUND_COLOR, color(250, 150, 150);
void mousePressed() {
  background(BACKGROUND_COLOR);
}

// CHANGED - Added the keyPressed function. The background color will change when the key is pressed and will change back to red when the mouse is clicked. 
void keyPressed() {
  background(BACKGROUND_COLOR_KEY);
}