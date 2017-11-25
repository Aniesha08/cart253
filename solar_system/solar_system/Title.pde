// Title
//
// A simple class to display the title of the game on the
// screen and listen for a press of any key. When a key is pressed
// it remembers the title is finished and the main program checks
// this in order to advance to the menu.

class Title {

  // A variable to track whether the title screen is finished
  boolean finished = false;

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
    textSize(64);
    fill(255);  
    translate(0,-50,-200);
    text("Light Effect", 0,0);
    fill(255); 
    textSize(25);
    translate(0,80,-200);
    text("Move light source & mouse to play with planets speed & brightness", 0,0);
    fill(255); 
    textSize(25);
    translate(0,100,-200);
    text("PRESS ANY KEY TO START", 0,0);
   
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