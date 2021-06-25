void drawBricks(float xPos, float yPos, int numVertical, int numHorizontal) {
  fill(#C42C4F); // plum-like bricks
  strokeWeight(5);
  stroke(252,249,236); // off-white
  xBrickStart = xPos;
  yBrickStart = yPos;
  for (int i = 0; i < numVertical; i++) {
    rect(xBrickStart, yBrickStart, brickWidth, brickHeight);
    for (int j = 0; j < numHorizontal; j++) {
      rect(xBrickStart, yBrickStart, brickWidth, brickHeight);
      yBrickStart += brickHeight;
    }
    xBrickStart += brickWidth;
    yBrickStart = yPos;
  }
}

// ============================================================
void initTree() {
  // for varying body branch lengths
  for (int i = 0; i < numBodyBranches; i++) {  
    yBodyEnd[i] = random(-5.0, 5.0); // random length variation between each branch
    // branches gradually get longer towards the bottom
    if (i < numBodyBranches/2) { xBodyEnd[i] = random(45.0 + i*bodyGrowth, 50.0 + i*bodyGrowth); }
    else { xBodyEnd[i] = random(45.0 + bodyGrowth*(i - numBodyBranches/2), 50.0 + bodyGrowth*(i - numBodyBranches/2)); } 
  }
  
  // for varying rotation and sweeping length of skirt branches
  for (int i = 0; i < numSkirtBranches; i++) {
    treeSkirtRotation[i] = random(PI/40-radians(3), PI/40+radians(3));
    if (i < numSkirtBranches/2) { // branches lengthen from right to middle
      xSkirtEnd[i]+= random(0.1,0.7);
    } else { // branches shorten from middle to left
      xSkirtEnd[i]-= random(0.1,0.7);
    }   
    ySkirtEnd[i] = random(-5.0 + numBodyBranches * skirtGrowth, 5.0 + numBodyBranches * skirtGrowth); // random length variation
  }
}

void drawTreeNeedles() {
  int bodyStart;
  int bodyEnd;
  int skirtStart;
  int skirtEnd;
   strokeWeight(2);
    for (int i = 0; i < 2; i++) { // to alternate colors
      pushMatrix();
      translate(width/2, height/8); 
        if (i==0) { 
          stroke(123, 152, 62); // light pine needle green
          bodyStart = 0;
          bodyEnd = numBodyBranches/2;
          skirtStart = 0;
          skirtEnd = numSkirtBranches/2;
        } else { 
          stroke(89, 112, 44); // dark pine needle green
          bodyStart = numBodyBranches/2;
          bodyEnd = numBodyBranches;
          skirtStart = numSkirtBranches/2;
          skirtEnd = numSkirtBranches;
        } 
        
        for (int j = bodyStart; j < bodyEnd; j++) { 
          // alternating directions
          if (j%2==0) { treeBodyRotation = leftRotation; }
          else { treeBodyRotation = rightRotation; }
          pushMatrix();
            rotate(treeBodyRotation);
              line(0, 0, xBodyEnd[j], yBodyEnd[j]);
          popMatrix();
            
            // change applies after each left-right pair
            translate(0,6);
          }   
        
        // for the curved branches at the bottom
        pushMatrix();
          rotate(-1*PI/4);
            for (int j = skirtStart; j < skirtEnd; j++) {
                line(0, 0, xSkirtEnd[j], ySkirtEnd[j]);
                rotate(treeSkirtRotation[j]);       
            }
        popMatrix();
      popMatrix();
    }
}

void trunk() {
  pushMatrix();
    translate(width/2, 2*height/3);
      fill(#833C30); // brown 
      noStroke();
      rect(-25.0,0.0, width/12,height/4);
  popMatrix();
    
  // spine
  //pushMatrix();
  //  translate(width/2, 50.0);
  //  stroke(#833C30); // brown 
  //  strokeWeight(5.0);
  //  line(0.0,0.0, 0.0, 270.0);
  //popMatrix();
  
}
// ================================================================
void rug() {
  pushMatrix();
    translate(width/2, 350); // center-ish of trunk
    fill(#6216DE); // purple 
    noStroke();
    ellipse(0,0, 150.0, 100.0);
  popMatrix();
}
// ================================================================
void initOrnaments() {
   numberOfOrnaments = int(random(15, 25));
  xCenter = new float[numberOfOrnaments];
  for (int i = 0; i < numberOfOrnaments; i++) {
    xCenter[i] = random(-.75*xBodyEnd[0], .75*xBodyEnd[0]);
  }
  yCenter = new float[numberOfOrnaments];
  for (int i = 0; i < numberOfOrnaments; i++) {
    yCenter[i] = random(-115.0, 90.0);
  }
}

void drawOrnaments(float xCenter[], float yCenter[]) {
  pushMatrix();
    ellipseMode(CENTER);
    noStroke();
    translate(width/2, height/2); // middle of trees
      for (int i = 0; i < numberOfOrnaments; i++) {
        fill(random(200,255), random(0,50), random(0,50));
        circle(xCenter[i], yCenter[i], ornRad);
      }
  popMatrix();
}

void star() {
  pushMatrix();
    translate(width/2, 50.0); // location of trees
      fill(#FFEA00); // golden
      noStroke();
      triangle(0,5, 15,-15, -15,-15); 
      pushMatrix();
        rotate(PI);
          triangle(0,20, 15,0, -15,0);
      popMatrix();
  popMatrix();
}
// ================================================================
void bluePresent() {
  fill(#90D2FA); // lighter blue
  noStroke();
  rect(7.5*width/12,10.0*height/12, 2.0*width/12,1.5*height/12);
  stroke(#0B8298); // blue
  strokeWeight(5);
  // horizontal line
  line(7.5*width/12+2.9,10.75*height/12, 9.5*width/12-3.0,10.75*height/12);
  // vertical line
  line(8.5*width/12+2.9,10.0*height/12+3.0, 8.5*width/12+2.9,11.5*height/12-3.0);     
}

void yellowPresent() {
  pushMatrix();
    translate(3.25*width/12,9.25*height/12); 
      fill(234,231,027); // yellow
      noStroke();
      rect(0.0,0.0, 1.25*width/12,2.5*height/12);
      stroke(#3BD609); // light green
      strokeWeight(5);
      // horizontal line
      line(2.9,1.25*height/12, 1.25*width/12-3.0,1.25*height/12);
      // vertical line
      line(0.625*width/12,2.8, 0.625*width/12,2.5*height/12-3.0);     
  popMatrix();
}

void whitePresent() {
  pushMatrix();
    translate(410.0,293.0); // on top of blue present
      fill(255,255,255);
      noStroke();
      rect(0.0,0.0, 1.25*width/12,1.25*height/12);
      stroke(255,0,0);
      strokeWeight(5);
      // horizontal line
      line(2.9,0.625*height/12, 1.25*width/12-2.9,0.625*height/12);
      // vertical line
      line(0.625*width/12,2.8, 0.625*width/12,1.25*height/12-3.0);
  popMatrix();
}
