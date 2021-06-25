// variables for the snowflakes
int numSnowflakes = 10;
float[] xSnowflakeStart = new float[numSnowflakes];
float[] ySnowflakeStart = new float[numSnowflakes];
float snowflakeEnd = 10.0;
float rotation;
float rotate1 = degrees(3*PI/4);
float rotate2 = degrees(PI/4);

//variables for the bricks
float xBrickStart;
float yBrickStart;
float brickWidth;
float brickHeight;


void setup() {
  size(600,400);
  
  brickWidth = width/12;
  brickHeight = height/12;
  
  for (int i=0; i<numSnowflakes; i++) {
    xSnowflakeStart[i] = random(width/6,5*width/6);
    ySnowflakeStart[i] = random(0,2*height/3);   
  }
}

void draw() {
  background(0,0,0);
  
  // box as window
  strokeWeight(1);
  noFill();
  rect(width/6, 0, 2*width/3, 2*height/3);
  
  // snowflake animation
  for (int i=0; i<numSnowflakes; i++) {
    pushMatrix();
      translate(xSnowflakeStart[i], ySnowflakeStart[i]);
        drawSnowflake();
    popMatrix();
    if (ySnowflakeStart[i] < 2*height/3) {
      ySnowflakeStart[i]+=3;
      xSnowflakeStart[i]+=cos(ySnowflakeStart[i]*5);
    } else {
      xSnowflakeStart[i] = random(width/6,5*width/6);
      ySnowflakeStart[i] = 0; 
    }
  }
  
  drawBricks(0.0,0.0,2,8);
  drawBricks(5*width/6,0.0,2,8);
}

void drawSnowflake() {
  stroke(255,255,255, 200);
  strokeWeight(1);
  noFill();
  
  for (int i = 0; i < 50; i++) {
    if (i%2==0) {
      rotation = rotate1;
    } else {
        rotation = rotate2;
    }
    pushMatrix();
      rotate(rotation);
        line(0, 0, snowflakeEnd, snowflakeEnd);
      popMatrix();
    rotate(rotation--);
  }   
}

void drawBricks(float xPos, float yPos, int numVertical, int numHorizontal) {
  fill(#C42C4F); // plum-like bricks
  strokeWeight(5);
  xBrickStart = xPos;
  yBrickStart = yPos;
  for (int i = 0; i < numVertical; i++) {
    rect(xBrickStart, yBrickStart, brickWidth, brickHeight);
    for (int j = 0; j < numHorizontal; j++) {
      rect(xBrickStart, yBrickStart, brickWidth, brickHeight);
      yBrickStart += brickHeight;
    }
    xBrickStart += brickWidth;
    yBrickStart = 0.0;
  }
}
