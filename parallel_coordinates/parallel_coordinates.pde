TableReader cars;
TableReader cameras;

int numOfAttributes;
float line_height;


void setup(){
  size(980, 650);
  pixelDensity(displayDensity());
  cars = new TableReader("cars-cleaned.tsv");
  cameras = new TableReader("cameras-cleaned.tsv");
  numOfAttributes = cars.headers.length;
}

void draw(){
  background(255);
  drawAxis();
  int numOfAttributes = cars.headers.length;
  float gap = (width*0.9)/numOfAttributes;
   //for(int i = 0; i < cars.table.getRowCount(); i++){
     
     TableRow row = cars.table.getRow(0);
     for(int j = 1; j < cars.headers.length; j++){
       float val = row.getFloat(cars.headers[j]);
       //print(val+"   ");
       Float[] maxmin = cars.getMinAndMaxFromColumn(cars.headers[j]);
       text("----"+val,j*gap+30, calculateYPos(line_height-30, maxmin[0], maxmin[1], val));
     }  
   //}
        
    
}

void drawAxis(){
  //TODO: fix so there are not absolute variable, make everythin relative to screen size
  //TODO: fix the labels
  //TODO: create variable to toggle between datasets

  float gap = (width*0.9)/numOfAttributes;
  line_height = 590;
  float r = 0;
  textSize(10);
  textAlign(CENTER, BOTTOM);
  fill(0);
  for(int i = 1; i < numOfAttributes; i++){
    line(i*gap + 30, 30, i*gap + 30, 590);
    text(cars.headers[i], i*gap + 30, 610);
    Float[] maxmin = cars.getMinAndMaxFromColumn(cars.headers[i]);
    //min
    text(maxmin[0], i*gap + 30, 620);
    //max
    text(maxmin[1], i*gap + 30, 25);
   
  } 
}

float calculateYPos(float lineHeight, float minVal, float maxVal, float val){
  float pos = 35 + (((maxVal-val)/(maxVal-minVal))*lineHeight);
  //5140.0 - 1613.0 = 3525 / 590 = 5.97 
  print("    "+maxVal+" "+minVal);
  //-20356.793
  return pos;
}