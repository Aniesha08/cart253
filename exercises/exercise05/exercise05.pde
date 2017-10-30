// Variables for the score and time 
int score = 0;
int startTime = 0;
boolean scoreRunning = true;

void setup() {
  background(255, 255, 255);
  size(400, 400);
  surface.setResizable(true); // The window is resizable
  textSize(20);
  fill(102, 153, 51);
  text("Resize the window and try to hit", 10, 60);
  fill(102, 153, 51);
  text("200 points within 30 seconds!", 10, 90);
}

void draw() {
  //println(width, height);
  windowResize();
  scores();
}

// Scores increase or decrease according to the window size
void windowResize() {
  background(255, 0, 0);
  if (scoreRunning) {
    if  (width < 400 && height < 400 ){
    score++;
    } else if  (width > 500 && height > 500 ){
    score--;
    }
    
    if  (width > 650 && height > 650 ){
    score = score + 2;
    } else if  (width > 700 && height > 700 ){
    score--;
    }
  }
}

// Display the scores
void scores(){
  fill (255);
  text ("Score: " + score, 20, 80); 
}