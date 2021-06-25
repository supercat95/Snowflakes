void drawWindow() {
    // sky
    noStroke();
    fill(0,0,0); // the outside night color
    rect(xBoundaryLeft, 0, xBoundaryRight, yBoundaryBottom);
    
    // snow layer
    fill(#FFFFFF);
    rect(xBoundaryLeft, 7*height/12, xBoundaryRight, height/12); // width of Window
}

// ================================================================
void initSnowflake(int index) { // sets coordinates
  int i = index;
  xSnowflakeStart[i] = random(xBoundaryLeft, xBoundaryLeft + xBoundaryRight);
  ySnowflakeStart[i] = random(-300, 0);
}

void drawSnowflake() { // code reused from a bug with the tree needles!
  stroke(255,255,255, 200);
  strokeWeight(1);
  
  for (int i=0; i<numSnowflakes; i++) {
    pushMatrix();
      translate(xSnowflakeStart[i], ySnowflakeStart[i]);
        for (int j = 0; j < 50; j++) {
          pushMatrix();
            rotate(random(snowflakeRotation - 10, snowflakeRotation + 10));
              line(0, 0, snowflakeRad, snowflakeRad);
          popMatrix();
          rotate(random(snowflakeRotation - 10, snowflakeRotation + 10));
        }  
    popMatrix();
    
    // resets coords once out of window
    if (ySnowflakeStart[i] < yBoundaryBottom - snowflakeRad) {
      ySnowflakeStart[i]+=5;
      xSnowflakeStart[i]+=cos(ySnowflakeStart[i]*5);
    } else {
      initSnowflake(i);
    }
  }
}
// ================================================================
void plane() {}
