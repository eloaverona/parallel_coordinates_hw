class Column {
  float x1, y1, x2, y2;
  float width;
  float height;
  color originalColor = color(255, 255, 255);
  color highlightColor = color(0,0,0);
  
  boolean over = false;
    
  // Create the bar
  Column(float gap, int numOfAttributes, float line_height, int i, Float[] maxmin) {

    textSize(10);
    textAlign(CENTER, BOTTOM);
    fill(0);

    line(i*gap + 30, 30, i*gap + 30, 590);
    text(maxmin[0], i*gap + 30, 620);
    text(maxmin[1], i*gap + 30, 25);
   
  } 
    
    
  
  
 
  //// Checking if mouse is over the bar
  //void rollover(float px, float py) {
  //  if ((px > x1 && px < x2) && (py > y1 && py < y2)) {
  //    over = true; 
  //  } else {
  //    over = false;
  //  }
  //}
 
  //// Display the Bar
  //void display() {
  //  if (over) {
  //    fill(highlightColor);
  //    rect(x1, y1, width, height);
  //  } 
  //  if (!over){
  //    fill(originalColor);
  //    rect(x1, y1, width, height);
  //  }
  //}
  }