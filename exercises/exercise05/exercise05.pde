// Variables for the score and time 
int score = 0;
int startTime = 0;
int timeElapsed = 0;
boolean timerRunning = false;
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
  //Run the following functions
  windowResize();
  
  // Start the time once the window is being resized
  if (width != 400 || height != 400){
    timerRunning = true;
  }
  
  // Increase & display the time
  if (timerRunning) {
  timeElapsed++;
  text("Time Elapsed: " + floor(timeElapsed/60), 20, 40);
  //println(timeElapsed);
  }
  
  scores();
  gameOver();
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


// The time and the score stops once it reaches 30 seconds or if the score hits 200
void gameOver(){
  if (timeElapsed >= 1800 || score >=200){
  timerRunning = false;
  scoreRunning = false;
  text("Game Over", width/2, height/2);
  }
}
  

// Display the scores
void scores(){
  fill (255);
  text ("Score: " + score, 20, 80); 
}