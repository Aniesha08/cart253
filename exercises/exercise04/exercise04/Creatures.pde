// Creature
//
// A class defining the behaviour of a single Creature
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Creature.

class Creature {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 5;
  
  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  
  int r=round(random(0,255)); // ADDED
  int g=round(random(0,255)); // ADDED
  int b=round(random(0,255)); // ADDED
  color fill = color (r,g,b); // ADDED 

  // Creature(tempX, tempY, tempSize)
  //
  // Set up the Creature with the specified location and size
  // Initialise energy to the maximum
  Creature(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

  // update()
  //
  // Move the Creature and update its energy levels
  void update() {
    
    if (energy == 0) {
      return;
    }
    
    int xMoveType = floor(random(-1,2));
    int yMoveType = floor(random(-1,2));
    x += size * xMoveType;
    y += size * yMoveType;
    
    if (x < 0) {
      x += width;
    }
    else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    }
    else if (y >= height) {
      y -= height;
    }

    // Update the Creature's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;
    
    // Constrain the Creature's energy level to be within the defined bounds
    energy = constrain(energy,0,maxEnergy);
  }

  // collide(other)
  //
  // Checks for collision with the other Creature
  // and updates energy level
  
  void collide(Creature other) {
    if (energy == 0 || other.energy == 0) {
      return;
    }
    
    if (x == other.x && y == other.y) {
      // Increase this Creature's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy,0,maxEnergy);
    }
  }

  // display()
  //
  // Draw the Creature 
  void display() {
    fill(fill, energy); 
    noStroke();
    ellipse(x, y, size, size);
  }
}