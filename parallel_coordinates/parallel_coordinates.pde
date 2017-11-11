
import java.util.Map;

TableReader data;
boolean useCars = true; //if not the cars dataset then it will be cameras
int numOfAttributes;
float line_height;
float line_start;
float gap;
Column[] mutableOrderColumns;
boolean mouseDragged = false;
boolean mouseReleased = false;
boolean singleClicked = false;




void setup() {
  size(1200, 700, P2D);
  pixelDensity(displayDensity());
  if (useCars) {
    data = new TableReader("cars-cleaned.tsv");
  } else {
    data = new TableReader("cameras-cleaned.tsv");
  }  
  numOfAttributes = data.headers.length;
  mutableOrderColumns = data.columns;
  //rowsToShow = data.rowsToShow;
  gap = (width*0.9)/numOfAttributes;
}

void draw() {
  background(255);
    for(int i = 0; i < mutableOrderColumns.length; i++){

    mutableOrderColumns[i].rollover(mouseX,mouseY);
    if(i < mutableOrderColumns.length-1 && mutableOrderColumns[i].Right == true){
      Column switchee = mutableOrderColumns[i+1];
      
      mutableOrderColumns[i+1] = mutableOrderColumns[i];
      mutableOrderColumns[i] = switchee;
      mutableOrderColumns[i].Right = false;
      mutableOrderColumns[i].Left = false;
      
      
      
    } else if(i> 1 && mutableOrderColumns[i].Left == true) {
      Column switchee = mutableOrderColumns[i-1];
      
      mutableOrderColumns[i-1] = mutableOrderColumns[i];
      mutableOrderColumns[i] = switchee;
      mutableOrderColumns[i].Right = false;
      mutableOrderColumns[i].Left = false;
      

    }
    mutableOrderColumns[i].Right = false;
    mutableOrderColumns[i].Left = false;

  }
  drawAxis();

  for (int i = 1; i < data.table.getRowCount(); i++) {
    TableRow row = data.table.getRow(i);
    String rowName = row.getString(data.headers[0]);
    if(data.rowsToShow.get(rowName)){
      for (int j = 1; j < mutableOrderColumns.length; j++) {
        Column col = mutableOrderColumns[j];
        float val = row.getFloat(col.name);
        //print(val+"   ");
        //Float[] maxmin = data.getMinAndMaxFromColumn(data.headers[j]);
        if (j < data.headers.length-1) {
          Column col2 = mutableOrderColumns[j+1];
          float val2 = row.getFloat(col2.name);
          //float val2 = row.getFloat(data.headers[j+1]);
          //Float[] maxmin2 = data.getMinAndMaxFromColumn(data.headers[j+1]);
          stroke(30, 20);
          line(j*gap, calculateYPos(col.minValue.valueFloat, col.maxValue.valueFloat, val), (j+1)*gap, 
          calculateYPos(col2.minValue.valueFloat, col2.maxValue.valueFloat, val2));
        }
      }
    }

}
//updateRowsToShow();

}

void drawAxis() {
  
  line_start = height * 0.1;
  line_height = height*0.8;
  //float r = 0;

  textSize(10);
  textAlign(CENTER, BOTTOM);
  stroke(0);
  fill(0);
  //print(mutableOrderColumns);
  for(int i = 1; i < mutableOrderColumns.length; i++){
    int extra = 15;
    Column col = mutableOrderColumns[i];
    col.draw(gap,line_start, line_height ,i, extra);
    //if(i % 2 == 0) extra += 20;
    //else extra += 10;
    //text(col.name, i*gap, line_start + line_height + extra);

  } 

}



void mouseDragged() {
  mouseDragged = true;
  //rectModel.updateBottomRight(mouseX, mouseY);
}

void mouseReleased() {
  mouseDragged = false;
  mouseReleased = true;
  updateRowsToShow();
  //rectModel.finishDrawing();
}

float calculateYPos( float minVal, float maxVal, float val) {
  float pos = line_start + (((maxVal-val)/(maxVal-minVal))*line_height);
  return pos;
}

void updateRowsToShow(){
    for (int i = 1; i < mutableOrderColumns.length; i++) {
       Column col = mutableOrderColumns[i];
       //println(col.areaSelected + " " + col.updateSelectedElements);
       if(col.deselected){ //&& col.updateSelectedElements){
        // print("getHere");
         ArrayList<String> rowNames =  col.elementsNotWithinSelectedArea;
         for(int j = 0; j < rowNames.size(); j++){
           data.rowsToShow.put(rowNames.get(j), true);
         }
       
       }
    
    }
    for (int i = 1; i < mutableOrderColumns.length; i++) {
       Column col = mutableOrderColumns[i];
       //println(col.areaSelected + " " + col.updateSelectedElements);
       if(col.areaSelected){ //&& col.updateSelectedElements){
        // print("getHere");
         ArrayList<String> rowNames =  col.getElementsNotWithinSelectedArea();
         for(int j = 0; j < rowNames.size(); j++){
           data.rowsToShow.put(rowNames.get(j), false);
         }
         col.updateSelectedElements = false;
       
       }
    
    }

}