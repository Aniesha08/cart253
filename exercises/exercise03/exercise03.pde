// Variable is created for the Bouncer 
// There are two instances of the Bouncer (bouncer1 & bouncer2)
color backgroundColor = color(200,150,150);
Bouncer bouncer;
Bouncer bouncer2;

void setup() {
  size(640,480);
  background(backgroundColor);
  // Arguments are added to the constructor
  // Because of the arguments, we are now able to create 2 instances of the bouncer with two different parameters
  // The two Bouncers will go in different directions and have different colors 
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}

// This is the code to draw the two bouncers and loop 
// It will pickup the update and draw methods from the Bouncer file
void draw() {
  bouncer.update();
  bouncer2.update();
  bouncer.draw();
  bouncer2.draw();
}