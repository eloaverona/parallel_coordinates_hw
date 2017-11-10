class Column {
  float x1, y1, x2, y2;
  float width;
  float height;
  color originalColor = color(255, 255, 255);
  color highlightColor = color(0,0,0);
  boolean over = false;
  String dataType; 
  Value maxValue;
  Value minValue;
  HashMap<Value, ArrayList<String>> valuesToElements;
  String name; 
  
  //Column(Value minValue, Value maxValue,HashMap<Value, ArrayList<String>> valuesToElements,String dataType, String colName) {

  //  this.minValue = minValue;
  //  this.maxValue = maxValue;
  //  this.valuesToElements = valuesToElements;
  //  this.dataType = dataType;
  //  this.name = colName;
   
  //} 
    
  // Create the bar
  Column(float gap, float line_start, float line_height, int i, Float[] maxmin, int extra) {

    textSize(10);
    textAlign(CENTER, BOTTOM);
    fill(0);

    line(i*gap, line_start, i*gap, line_start + line_height);
    text(maxmin[0], i*gap, line_start +line_height + extra);
    text(maxmin[1], i*gap, line_start - 10);  
   
  } 
  void draw(float gap, float line_start, float line_height, int i, Float[] maxmin, int extra) {

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