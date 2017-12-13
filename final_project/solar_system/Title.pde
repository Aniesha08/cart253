// Title
//
// A simple class to display the title of the game on the
// screen and listen for a press of any key. When a key is pressed
// it remembers the title is finished and the main program checks
// this in order to advance to the menu.

class Title {

  // A variable to track whether the title screen is finished
  boolean finished = false;
  
  PFont impactFont = createFont("Impact",50);

  // The constructor does nothing
  Title() {
  }

  // update()
  //
  // Just displays the title

  void update() {
    display();
  }

  // display()
  //
  // Displays the title of the game and the basic instructions
  // to press any key
  void display() {
    textAlign(CENTER, CENTER);
    textSize(55);
    textFont(impactFont);
    fill(255);  
    pushMatrix();
    translate(0,-50,-200);
    text("PLANET EFFECT", 0,0);
    popMatrix();
    fill(255); 
    pushMatrix();
    textSize(25);
    translate(0,10,-200);
    text("Control planets using torch light & sound", 0,0); 
    popMatrix();
    fill(255); 
    pushMatrix();
    textSize(25);
    translate(0,60,-200);
    text("PRESS ANY KEY TO START", 0,0);
    popMatrix();
  }
  
  // keyPressed()
  //
  // Called by the main program when the title is active.
  // Sets finished to true immediately (since it's any key)

  void keyPressed() {
    finished = true;
  }

  // keyReleased()
  //
  // Does nothing.
  
  void keyReleased() {
  }
}