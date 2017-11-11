

class Column {
  float x1, y1, x2, y2;
  int index;
  boolean Right = false;
  boolean Left = false;
  color originalColor = color(255, 255, 255);
  color highlightColor = color(0,0,0);

  float half_width;
  float line_height;
  float line_start;

  boolean over = false;
  String dataType; 
  Value maxValue;
  Value minValue;
  HashMap<Value, ArrayList<String>> valuesToElements;
  String name; 

  String label;

  RectangleModel selectedArea;
  boolean areaSelected = false;
  boolean updateSelectedElements = false;
  boolean deselected = false;
  ArrayList<String> elementsNotWithinSelectedArea = new ArrayList<String>();
  
  
  Column(Value minValue, Value maxValue, HashMap<Value, ArrayList<String>> valuesToElements, String dataType, String colName) {

    this.minValue = minValue;
    this.maxValue = maxValue;
    this.valuesToElements = valuesToElements;
    this.dataType = dataType;
    this.name = colName;
    half_width = 20;
    selectedArea = new RectangleModel();
  } 

  void draw(float gap, float line_start, float line_height, int i, int extra) {
    textSize(10);
    textAlign(CENTER, BOTTOM);
    fill(0);
    stroke(0);
    x1 = i*gap;
    x2 = x1;
    y1 = line_start;
    y2 = line_start + line_height;
    index = i;
    selectedArea.updateXcoors(x1 - half_width, x1+half_width);
    this.line_height = line_height;
    this.line_start = line_start;
    line(x1, y1, x2, y2);
    if (dataType.equals("int")) {
      text(minValue.valueInt, x1, y2 + extra);
      text(maxValue.valueInt, x1, y1 - 10);
    } else {
      
      text(minValue.valueFloat, x1, y2 + extra);
      text(maxValue.valueFloat, x1, y1 - 10);
    }
    if(i % 2 == 0) extra += 20;
    else extra += 10;
    text(name, i*gap, line_start + line_height + extra);
    y1 = line_start + line_height + extra;

   
    drawSelectionArea();
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
  

 

  void drawSelectionArea() {
    if (areaSelected) {
      PVector topLeft = selectedArea.topLeft;
      PVector bottomRight = selectedArea.bottomRight;
      textSize(24);
      rectMode(CORNERS);
      fill(255, 0, 0, 20);
      stroke(255, 0, 0, 20);
      rect(topLeft.x, topLeft.y, bottomRight.x, bottomRight.y);

    }  
    //print(":FDASFASDAFDSAFSD");
    if (mousePressed && !mouseDragged) {
       print(":FDASFASDAFDSAFSD");
      if (withinAreaOfCol()) {
        
        if(areaSelected) {
           areaSelected = false;
           deselected = true;
        }else{
          deselected = false;
          areaSelected = true;
          selectedArea.startDrawingRectAt(mouseY);
        }
      }   
    }
    if (mouseDragged) {
      if (withinAreaOfCol()) {
        selectedArea.updateBottomRight(mouseY);
      }
    }
    if (mouseReleased) {
      if (withinAreaOfCol()) {
        
        
          updateSelectedElements = true;
          
       
        mouseReleased = false;
    }}
    
  }
  boolean withinAreaOfCol() {
    //println(mouseX + " " + (x1 - half_width) + " " +(x1 + half_width));

    //println(mouseY + " " + line_start + " " +(line_start + line_height));
    print(mouseX >= x1 - half_width && mouseX <= x1 + half_width
      && mouseY >= line_start  && mouseY <= line_start + line_height);
    if (mouseX >= x1 - half_width && mouseX <= x1 + half_width
      && mouseY >= line_start  && mouseY <= line_start + line_height) return true;
    else return false;
  }
  boolean valueNotWithinSelectedArea(float val){
    float y_coor = calculateYPos( minValue.valueFloat, maxValue.valueFloat, val);
    //println(y_coor + " " + selectedArea.topLeft.y  + " " + selectedArea.bottomRight.y);
    if (y_coor >= selectedArea.topLeft.y && y_coor <= selectedArea.bottomRight.y) return false;
    else return true; 
  }
  ArrayList<String> getElementsNotWithinSelectedArea(){
        if(selectedArea.getArea() <= 100){
          areaSelected = false;
          return new  ArrayList<String>();
        } 
       elementsNotWithinSelectedArea  = new  ArrayList<String>();
       for (Map.Entry me : valuesToElements.entrySet()) {
        Value value = (Value) me.getKey();
        if(valueNotWithinSelectedArea(value.valueFloat)){
            elementsNotWithinSelectedArea.addAll((ArrayList<String>)me.getValue());
        } 
      }
       
      return elementsNotWithinSelectedArea ;
   }
}

class RectangleModel
//class based on http://studio.sketchpad.cc/sp/pad/view/RgPVoxbKp3/rev.489.html?
{  

  PVector topLeft = new PVector();
  PVector bottomRight = new PVector();                              
  float topLeftX;
  float bottomRightX;

  void updateXcoors(float topLeftX, float bottomRightX) {
    //print("getHere");
    this.topLeftX =  topLeftX;
    this.bottomRightX = bottomRightX;
  }
  void startDrawingRectAt(float yy) {  
    topLeft.set(topLeftX, yy);
    bottomRight.set(bottomRightX, yy);
  }

  void updateBottomRight(float yy) {
    bottomRight.set(bottomRightX, yy);
  }
  
  float getArea(){

    println((bottomRight.x + " " + topLeft.x) );
    println((bottomRight.y  + " " + topLeft.y));
    return (bottomRight.x - topLeft.x) * (bottomRight.y - topLeft.y);
  }


} 