// Exercise 00 code
//
// Code that does some symmetric drawing and colour changing.
// And also introduces the idea of "comments" in programming.
//
// A "comment" is something your write in your code that is NOT part
// of your instructions to the computer. It's not something the program
// DOES. This means it has two main uses:
//
// - We use comments to EXPLAIN our program in plain language, but for
//   ourselves and for other people who read our code
// - We use comments to DISABLE lines of code in our program, so that we can
//   temporarily run the program without those lines.
//
// What you are reading right now is all a comment.
//
// Maybe you've figured out that we write a comment by writing
// two forward-slash characters (e.g. //), a space, and then whatever we
// wanted to say about the program at that point.
//
// You can also turn a line or selection into a comment by selecting
// Edit > Comment/Uncomment from the menu or hitting Command-/ on a mac.
// You can reverse that process by doing the same thing again.
//
// You can write comments anywhere, including at the END OF A LINE OF CODE.
// This exercise code demonstrates the common uses of commenting.
//
// Notice that there is commenting at the top here which explains
// the overall program, including giving it a title at the very top.
//
// Then there are comments explaining each function like setup()
// and draw() and so on.
//
// Finally there are comments explaining each line of code in the functions.
// Over time we'll be able to write fewer comments because some of the things
// will just be clear without explanation, but for now it's a good idea
// to explain everything precisely as we learn to understand it.


// setup()
//
// Sets the size, background, stroke, and fill to start with.
// Background is only set once, so we'll see a "drawing" effect.

void setup() {
  // Set the size of the window
  size(640, 480);
  // Set the background colour
  //background(255, 150, 150);
  // No lines around shapes
  //noStroke();
  // Set the initial fill colour for shapes
  //fill(255, 200, 200);
}

// draw()
//
// Draws four circles on the screen symmetrically around the center based on the mouse location.

//void draw() {
  // Draw a circle in the top left area of the screen
  //ellipse(width/2 + mouseX/2, height/2 + mouseY/2, 10, 10);
  //stroke(45,170,255);
  //line(30, 20, 100, 90);
  //line(mouseX, mouseY, pmouseX, pmouseY);
//}

void draw() { 
  background(204); 
  line(mouseX, 180, pmouseX, 50); 
} 

// mousePressed()
//
// Called when the mouse button goes down.
// Changes the fill.

void mousePressed() {
  // Change the fill colour
  stroke(255, 255, 200);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

// mouseReleased()
//
// Called when the mouse button goes up.
// Changes the fill.

void mouseReleased() {
  // Change the fill colour
  stroke(200, 255, 200);
}

// keyPressed()
//
// Called when a key is pressed down
// Changes the fill.

void keyPressed() {
  // Change the fill colour
  stroke(255, 200, 255);
}

// keyReleased()
//
// Called when a key is released
// Changes the fill.

void keyReleased() {
  // Change the fill colour
  stroke(200, 200, 255);
}