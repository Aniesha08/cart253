// Class Bouncer is defined in the code below
// Variables for class Bouncer are listed 
class Bouncer {
 int x;
 int y;
 int vx;
 int vy;
 int size;
 int speedControl=0; // ADDED
 int tempSpeedX; // ADDED
 int tempSpeedY; // ADDED
 color clickColor = color (255,255,255); // ADDED
 color fillColor;
 color defaultColor;
 color hoverColor;
 
// This is the chunk of code that the word Bouncer after new in "bouncer = new Bouncer" from the main file will pickup
// This code will allow us to make multiple instances of the Bouncer and give them different parameters in the main file
 Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   tempSpeedX = tempVX; // Creating a second tempVX
   tempSpeedY = tempVY; // Creating a second tempVY
   size = tempSize;
   defaultColor = tempDefaultColor;
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
 }
 
// This is the code that bouncer.update() from the main file will pickup
 void update() {
   x += vx; // The x position of the bouncer is equal to the x position + the bouncer's velocity
   y += vy; // The y position of the bouncer is equal to the y position + the bouncer's velocity
   
// Run these two methods
// What do to for these methods is defined below starting from line 37
   handleBounce();
   //handleMouse(); //COMMENTED OUT since it is interferring with the mouseClicked() method
 }

 void handleBounce() {
// If the x-position of the Bouncer is either going going off the screen on the left side or right side, in other words, if the x-position is less than 0 or greater than 640px, bounce back to the opposite direction
   if (x - size/2 < 0 || x + size/2 > width) {
    // vx = -vx; 
   // If the bouncer is initialized at 0, double the velocity when it hits the left/right sides wall. 
    
     if (speedControl == 0){ 
       vx = -vx*2; 
       speedControl = 1;
     }
   // Or else, set the velocity to the bouncer's initial velocity when created.
     else {
       vx = -tempSpeedX;
       speedControl = 0;
     }
     
   }
  
// If the y-position of the Bouncer is either going going off the screen from the top or bottom, in other words, if the y-position is less than 0 or greater than 480px, bounce back to the opposite direction
   if (y - size/2 < 0 || y + size/2 > height) {
     // vy = -vy;
     // If the bouncer is initialized at 0, double the velocity when it hits the top/bottom of the wall.
    
      if (speedControl == 0){
         vy = -vy*2; 
         speedControl = 1;
       }
     // Or else, set the velocity to the bouncer's initial velocity when created.
       else {
         vy = -tempSpeedY;
         speedControl = 0;
      }
     
   }

// Make sure the direction of the Bouncer is constrained to the window size
   x = constrain(x,size/2,width-size/2); 
   y = constrain(y,size/2,height-size/2); 
 }

 
// When the mouse's x/y coordinates intersect with the ellipse's x/y coordinates, in other words, when the mouse hovers over the ellipse, change the ellipse to the hover color or else keep it the default color
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor;     
   }
  else {
    fillColor = defaultColor;
   }
 }

// ADDED When the mouse is clicked to the left, the ellipse color changes to white. If it is right clicked, it changes back to the default color.
void mouseClicked() {
  if (mouseButton == LEFT) {
    fillColor = clickColor;
  } 
  if (mouseButton == RIGHT){
    fillColor = defaultColor;
  } 
}
   
// Properties of the ellipse is defined to display the Bouncer
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
}
}