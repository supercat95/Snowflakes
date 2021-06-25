//variables for the bricks
float xBrickStart;
float yBrickStart;
float brickWidth;
float brickHeight;

// variables for the trees
int numBodyBranches = 50;
int numSkirtBranches = 40;
float[] xBodyEnd = new float[numBodyBranches];
float[] yBodyEnd = new float[numBodyBranches];
float[] xSkirtEnd = new float[numSkirtBranches];
float[] ySkirtEnd = new float[numSkirtBranches];
float bodyGrowth = 4.0;
float skirtGrowth = 2.5;
float leftRotation = 3*PI/4;
float rightRotation = PI/4;
float treeBodyRotation;
float[] treeSkirtRotation = new float[numSkirtBranches];


// variables for the ornaments
float[] xCenter;
float[] yCenter;
float ornRad = 12.0;
int numberOfOrnaments;

// variables for outside and snowflakes
float xBoundaryLeft;
float xBoundaryRight;
float yBoundaryBottom;

// variables for the snowflakes
int numSnowflakes = 10;
float[] xSnowflakeStart = new float[numSnowflakes];
float[] ySnowflakeStart = new float[numSnowflakes];
float snowflakeRad = 10.0;
float snowflakeRotation = degrees(3*PI/4);

void setup() {
  frameRate(20);
  size(600,400);
  
  // for drawBricks()
  brickWidth = width/12;
  brickHeight = height/12;
  
  // for drawWindow()
  xBoundaryLeft = width/6;
  xBoundaryRight = 2*width/3;
  yBoundaryBottom = 7*height/12;
  
  // initializations
  for (int i=0; i<numSnowflakes; i++) {
    initSnowflake(i);
  }
  initTree();
  initOrnaments();
  
  // static structures
  drawBricks(0,2*height/3,12,4); // horizontal area below window
  rug();
  trunk();
  bluePresent();
  yellowPresent();
  whitePresent();
}
// ================================================================
void draw() {
  drawWindow();
  drawSnowflake();
  
  // vertical areas beside window
  drawBricks(0.0,0.0,2,8);
  drawBricks(5*width/6,0.0,2,8);
  
  drawTreeNeedles();
  drawOrnaments(xCenter, yCenter); // make this flashy again
  star();
}
