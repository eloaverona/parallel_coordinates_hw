<<<<<<< HEAD
TableReader data;

TableReader cars;
TableReader cameras;
Column[] columns;

boolean useCars = true; //if not the cars dataset then it will be cameras
=======

TableReader data;
boolean useCars = false; //if not the cars dataset then it will be cameras

Column[] columns;


>>>>>>> 2bb776908bc8448773673c597a0749ab92f9af9a
int numOfAttributes;
float line_height;
float line_start;
PVector beginCorner = new PVector();
PVector endCorner = new PVector();
RectangleModel rectModel;
float gap;


void setup(){
  size(1200, 700, P2D);
  pixelDensity(displayDensity());
  if(useCars) {
      data = new TableReader("cars-cleaned.tsv");
  }else{
      data = new TableReader("cameras-cleaned.tsv");
  }  
<<<<<<< HEAD

  numOfAttributes = data.headers.length;
  columns = new Column[numOfAttributes];

   rectModel = new RectangleModel();
  numOfAttributes = data.headers.length;

=======
  numOfAttributes = data.headers.length;
  columns = new Column[numOfAttributes];

  rectModel = new RectangleModel();
 
>>>>>>> 2bb776908bc8448773673c597a0749ab92f9af9a
}

void draw(){
  background(255);
  drawAxis();

<<<<<<< HEAD
  int numOfAttributes = data.headers.length;

  //int numOfAttributes = cars.headers.length;

  gap = (width*0.9)/numOfAttributes;
   for(int i = 1; i < data.table.getRowCount(); i++){
=======
  //int numOfAttributes = cars.headers.length;
  float gap = (width*0.9)/numOfAttributes;
   for(int i = 0; i < data.table.getRowCount(); i++){
>>>>>>> 2bb776908bc8448773673c597a0749ab92f9af9a
     TableRow row = data.table.getRow(i);
     for(int j = 1; j < data.headers.length; j++){
       float val = row.getFloat(data.headers[j]);
       //print(val+"   ");
       Float[] maxmin = data.getMinAndMaxFromColumn(data.headers[j]);
       if(j < data.headers.length-1){
         float val2 = row.getFloat(data.headers[j+1]);
         Float[] maxmin2 = data.getMinAndMaxFromColumn(data.headers[j+1]);
         stroke(30, 20);
         line(j*gap, calculateYPos(maxmin[0], maxmin[1], val), (j+1)*gap, calculateYPos(maxmin2[0], maxmin2[1], val2));
       }
     }  
   }
   if  ( rectModel.hasRectangle ){
         // get rect corners and render the rect.
         PVector topLeft = rectModel.topLeft;
         PVector bottomRight = rectModel.bottomRight;
         textSize(24);
         rectMode(CORNERS);
         fill(255, 0,0, 20);
         stroke(255, 0,0, 20);
         rect(topLeft.x, topLeft.y, bottomRight.x, bottomRight.y);
  }
}

void drawAxis(){
 
  float gap = (width*0.9)/numOfAttributes;
<<<<<<< HEAD

  line_height = 590;
  line_start = height * 0.1;
  line_height = height*0.8;

=======
  line_start = height * 0.1;
  line_height = height*0.8;
>>>>>>> 2bb776908bc8448773673c597a0749ab92f9af9a
  //float r = 0;
  textSize(10);
  textAlign(CENTER, BOTTOM);
  stroke(0);
  fill(0);
  for(int i = 1; i < numOfAttributes; i++){

<<<<<<< HEAD
    //line(i*gap + 30, 30, i*gap + 30, 590);
    text(data.headers[i], i*gap, line_height + 110);

    line(i*gap, line_start, i*gap, line_start + line_height);
    int extra = 15;

    Float[] maxmin = data.getMinAndMaxFromColumn(data.headers[i]);

    //line(i*gap + 30, 30, i*gap + 30, 590);
    //text(cars.headers[i], i*gap + 30, 610);
    //Float[] maxmin = cars.getMinAndMaxFromColumn(cars.headers[i]);
    columns[i] = new Column(gap,numOfAttributes,line_height,i,maxmin, line_start);
=======
    int extra = 15;
    Float[] maxmin = data.getMinAndMaxFromColumn(data.headers[i]);
    columns[i] = new Column(gap,line_start, line_height ,i,maxmin, extra);
    if(i % 2 == 0) extra += 20;
    else extra += 10;
    text(data.headers[i], i*gap, line_start + line_height + extra);
>>>>>>> 2bb776908bc8448773673c597a0749ab92f9af9a

  } 
}

    void mousePressed(){
           rectModel.startDrawingRectAt(mouseX, mouseY);
        }

    void mouseDragged(){
           rectModel.updateBottomRight(mouseX, mouseY);
        }

    void mouseReleased(){
           rectModel.finishDrawing();
        }

float calculateYPos( float minVal, float maxVal, float val){
  float pos = line_start + (((maxVal-val)/(maxVal-minVal))*line_height);
<<<<<<< HEAD

=======
  //5140.0 - 1613.0 = 3525 / 590 = 5.97 
  //-20356.793
>>>>>>> 2bb776908bc8448773673c597a0749ab92f9af9a
  return pos;
}


  class RectangleModel
  //class based on http://studio.sketchpad.cc/sp/pad/view/RgPVoxbKp3/rev.489.html?
{
    PVector topLeft = new PVector();
    PVector bottomRight = new PVector();
    boolean hasRectangle = false; // we start empty
    boolean isInDrawingState = false;  // this variable just helps us to know
                                        // if we're expecting from the sketch
                                        // more calls to update rect position.
    
    void startDrawingRectAt(float xx, float yy){
            topLeft.set(xx, yy);
            bottomRight.set(xx,yy);
            isInDrawingState = true;  // we start 
            hasRectangle = true;      // and now there's something to render
                                       // despite it's just a point now
        }
 

    void updateBottomRight(float xx, float yy){
      // this is just error checking code which makes sure that 
      // we always call startDrawingRectAt() before we start updating corners.
      // it's not as much useful in current version of code, but will 
      // help you with debugging when you add functinality
         
                    // that's all we do: just update the corner
               bottomRight.set(xx, yy);
              

          
        }
       
    boolean isInDrawingState(){
            return isInDrawingState;
        }   
    // this method just tells model to switch off "drawingState". 
    void finishDrawing(){
            isInDrawingState = false;
        }
 } 