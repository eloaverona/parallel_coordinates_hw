class Column {
  float x1, y1, x2, y2;
  float width;
  float height;
  int index;
  boolean Right = false;
  boolean Left = false;
  color originalColor = color(255, 255, 255);
  color highlightColor = color(0,0,0);
  boolean over = false;
  String dataType; 
  Value maxValue;
  Value minValue;
  HashMap<Value, ArrayList<String>> valuesToElements;
  String name; 
  String label;
  
  Column(Value minValue, Value maxValue,HashMap<Value, ArrayList<String>> valuesToElements,String dataType, String colName) {

    this.minValue = minValue;
    this.maxValue = maxValue;
    this.valuesToElements = valuesToElements;
    this.dataType = dataType;
    this.name = colName;
   
  } 
     
  void draw(float gap, float line_start, float line_height, int i, int extra) {
    textSize(10);
    textAlign(CENTER, BOTTOM);
    fill(0);
    
    x1 = i*gap;
    index = i;

    line(x1, line_start, x1, line_start + line_height);
    if(dataType == "int") {
      text(minValue.valueInt, x1, line_start + line_height + extra);
      text(maxValue.valueInt, x1, line_start - 10);  
    }else{
   
      text(minValue.valueFloat, i*gap, line_start +line_height + extra);
      text(maxValue.valueFloat, i*gap, line_start - 10);  
    }
    
    if(i % 2 == 0) extra += 20;
    else extra += 10;
    text(name, i*gap, line_start + line_height + extra);
    y1 = line_start + line_height + extra;

  } 
  
  // Checking if mouse is over the bar
  void rollover(float px, float py) {
    if (px >= x1 - 10 && py >= y1 - 10 && px <= x1 + textWidth(name) + 10 && py <= y1 + 20) {
      over = true; 
      fill(highlightColor);
      rect(x1, line_height + 110, 500 , 30);
      keyPressed();
      
    } else {
      over = false;
    }
  }
  
  void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      fill(0,0,255);
      rect(x1, y1, 50 , 30);
      Right = true;
    } else if (keyCode == LEFT) {
      fill(0,255,0);
      rect(x1, y1, 50 , 30);
      Left = true;
    } else {
    }
  }
  
 }
  

  }