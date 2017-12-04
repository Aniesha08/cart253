// Imported PeasyCam from Library. This lets us zoom in and out, move the planets using the mouse. 
import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

// Importer Video library
import processing.video.*;

// Import background music
import processing.sound.*;
SoundFile bgMusic;

// Import Minim library and let us access the microphone
import ddf.minim.*;
Minim minim;
AudioInput mic;
// Variable for the level of sound
float level;

// An enum is a way to group together a set of named options
// In this case I'm using it for tracking the state the program is in.
enum State {
  NONE, 
    TITLE, 
    SOLARSYSTEM
}

// Added class for Sun and Peasy cam
PeasyCam cam;
State state;
Title title;
SolarSystem solarSystem;

// The capture object for reading from the webcam
Capture video;

// A PVector allows us to store an x and y location in a single object
// When we create it we give it the starting x and y (which I'm setting to -1, -1
// as a default value)
PVector brightestPixel = new PVector(-1, -1);

// Array to store the texture images of the planets. 
// The array can store 9 texture images of the planets 
// which will later be randomly alternating each time the program is runned
PImage[] textures = new PImage[9];

PImage stars;


void setup () {
  // Setup the program to run in 3D
  fullScreen(P3D);
  
  imageMode (CORNER);
  stars = loadImage("images/2k_stars_milky_way.jpg");

  // Each index of the array has an image stored in it to use as texture for the planets
  textures[0] = loadImage("images/mars.jpg");
  textures[1] = loadImage("images/earth.jpg");
  textures[2] = loadImage("images/mercury.jpg");
  textures[3] = loadImage("images/jupiter.jpg");
  textures[4] = loadImage("images/venus.jpg");
  textures[5] = loadImage("images/saturn.jpg");
  textures[6] = loadImage("images/uranus.jpg");
  textures[7] = loadImage("images/neptune.jpg");
  textures[8] = loadImage("images/pluto.jpg");

  minim = new Minim(this);
  // We use minim.getLineIn() to get access to the microphone data
  mic = minim.getLineIn();

  // Variables to show the state of the program
  title = new Title();
  solarSystem = new SolarSystem();
  state = State.TITLE;

  // Start up the webcam
  video = new Capture(this, 640, 480, 30);
  video.start();

  // Make the PeasyCam for us to look at from the center from 150 units away when the program is run
  cam = new PeasyCam(this, 150);
  //cam = new PeasyCam(this, 0,0,0,150);

  // Loop the background music
  bgMusic = new SoundFile(this, "sounds/space.wav");
  bgMusic.loop();
}

void draw() {
  background(0);
  pushMatrix();
  translate(0,0,-400);
  imageMode(CENTER);
  image(stars, 0,0, width, height);
  popMatrix();
  
  // Get the volume level going through the microphone
  level = mic.mix.level();
  // Print it
  println("level: " + level);

  // A function that processes the current frame of video
  handleVideoInput();

  // A "switch" statement is like an "if" statement with different
  // syntax. Notice how we use "break;" after the instructions for
  // each state are finished.
  switch (state) {
    // If our state is NONE, we do nothing
  case NONE:
    break;

    // If our state is TITLE we update the title object
    // which displays it, and then we check whether the title
    // screen is finished and if so we go to the menu state
  case TITLE:
    title.update();
    if (title.finished) {
      state = State.SOLARSYSTEM;
    }
    break;

  case SOLARSYSTEM:
    solarSystem.update();
    fill(#ff0000);
    stroke(#ffffff);
    strokeWeight(5);
    pushMatrix();
    translate(0, 0, -400);
    ellipse(brightestPixel.x, brightestPixel.y, 20, 20);
    popMatrix();
    break;
  }
}

// handleVideoInput
//
// Checks for available video, reads the frame, and then finds the brightest pixel
// in that frame and stores its location in brightestPixel.

void handleVideoInput() {

  // Check if there's a frame to look at
  if (!video.available()) {
    // If not, then just return, nothing to do
    return;
  }

  // If we're here, there IS a frame to look at so read it in
  video.read();

  video.loadPixels();

  // Start with a very low "record" for the brightest pixel
  // so that we'll definitely find something better
  float brightnessRecord = 0;

  // Go through every pixel in the grid of pixels made by this
  // frame of video
  for (int x = 0; x < video.width; x++) {
    for (int y = 0; y < video.height; y++) {
      // Calculate the location in the 1D pixels array
      int loc = x + y * video.width;
      // Get the color of the pixel we're looking at
      color pixelColor = video.pixels[loc];
      // Get the brightness of the pixel we're looking at
      float pixelBrightness = brightness(pixelColor);
      // Check if this pixel is the brighest we've seen so far
      if (pixelBrightness > brightnessRecord) {
        // If it is, change the record value
        brightnessRecord = pixelBrightness;
        // Remember where this pixel is in the the grid of pixels
        // (and therefore on the screen) by setting the PVector
        // brightestPixel's x and y properties.
        brightestPixel.x = x;
        brightestPixel.y = y;
      }
    }
  }
}

// keyPressed()
//
// Here we just call the keyPressed() method of the appropriate
// object for the state we're in.

void keyPressed() {
  switch (state) {
  case NONE:
    break;

  case TITLE:
    title.keyPressed();
    break;

  case SOLARSYSTEM:
    solarSystem.keyPressed();
    break;
  }
}


// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  switch (state) {
  case NONE:
    break;

  case TITLE:
    title.keyReleased();
    break;

  case SOLARSYSTEM:
    solarSystem.keyReleased();
    break;
  }
}