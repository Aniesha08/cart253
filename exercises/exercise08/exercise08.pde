// Imported PeasyCam from Library. This lets us zoom in and out, move the planets using the mouse. 
import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import processing.video.*;


// Added class for Sun and Peasy cam
PeasyCam cam;
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


void setup () {
  // Setup the program to run in 3D
  fullScreen(P3D);
  //size (640, 480, P3D);

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

  // Variables to show the state of the program
  solarSystem = new SolarSystem();

  // Start up the webcam
  video = new Capture(this, 640, 480, 30);
  video.start();

  // Make the PeasyCam for us to look at from the center from 150 units away when the program is run
  cam = new PeasyCam(this, 150);
}

void draw() {
  background(0);

  // A function that processes the current frame of video
  handleVideoInput();


  // For now we just draw a crappy ellipse at the brightest pixel
  fill(#ff0000);
  stroke(#ffff00);
  strokeWeight(10);
  //ellipse(brightestPixel.x, brightestPixel.y, 20, 20);

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