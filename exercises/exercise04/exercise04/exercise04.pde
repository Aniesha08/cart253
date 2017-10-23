// Griddies
// by Pippin Barr
// MODIFIED BY: 
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
int creatureSize = 10;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];
Creature[] creatures = new Creature[50];

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?
  // ANSWER: The following for loop is an array. 
  for (int i = 0; i < griddies.length; i++) { // The loop will keep adding 1 griddie after each loop until it reaches 100 griddies
    // Defined variables for the array
    // Move the griddies in random x/y direction
    // Variables to create the position of the Griddies
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    // Array for the griddies. Instead of having a 100 lines, the [i] simplifies and allows us to add 100 griddies by just having one line of code!
    // We know that the [i] value is 100 based on line 13
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }

  for (int i = 0; i < creatures.length; i++) { 
    int x = floor(random(0, width/creatureSize));
    int y = floor(random(0, height/creatureSize));
    creatures[i] = new Creature(x * creatureSize, y * creatureSize, creatureSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      // ANSWER: Check if the number of griddies run the second time is not equal to the number of griddies run the first time
      if (j != i) {
        // QUESTION: What does this line check?
        // ANSWER: Check if the griddies from the first time and second time collide with each other
        griddies[i].collide(griddies[j]);
      }
    }

    // Display the griddies
    griddies[i].display();
  }

  // ADDED Creatures
  for (int i = 0; i < creatures.length; i++) {

    // Update the griddies
    creatures[i].update();

    for (int j = 0; j < creatures.length; j++) {
      if (j != i) {
        creatures[i].collide(creatures[j]);
        creatures[i].bothCollide(creatures[j],griddies[j]);
      }
    }

    // Display the creatures
    creatures[i].display();
  }
}