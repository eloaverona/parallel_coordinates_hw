TableReader cars;
TableReader cameras;

void setup(){
  size(980, 650);
  pixelDensity(displayDensity());
  cars = new TableReader("cars-cleaned.tsv");
  cameras = new TableReader("cameras-cleaned.tsv");
}

void draw(){
  background(255);
  drawAxis();
  int numOfAttributes = cars.headers.length;
  float gap = (width*0.9)/numOfAttributes;
   for(int i = 0; i < cars.table.getRowCount(); i++){
     TableRow row = cars.table.getRow(i);
     for(int j = 1; j < cars.headers.length; j++){
       float val = row.getFloat(cars.headers[j]);
       Float[] maxmin = cars.getMinAndMaxFromColumn(cars.headers[j]);
       text("-",i*gap + 30 , calculateYPos(590, maxmin[0], maxmin[1], val));
     }  
        
    }
}

void drawAxis(){
  //TODO: fix so there are not absolute variable, make everythin relative to screen size
  //TODO: fix the labels
  //TODO: create variable to toggle between datasets

  int numOfAttributes = cars.headers.length;
  float gap = (width*0.9)/numOfAttributes;
  float line_height = height * 0.9;
  textSize(10);
  textAlign(CENTER, BOTTOM);
  fill(0);
  for(int i = 1; i < numOfAttributes; i++){
    line(i*gap + 30, 30, i*gap + 30, 590);
    text(cars.headers[i], i*gap + 30, 610);
    Float[] maxmin = cars.getMinAndMaxFromColumn(cars.headers[i]);
    text(maxmin[0], i*gap + 30, 25);
    text(maxmin[1], i*gap + 30, 620);
   
  } 
}

float calculateYPos(float lineHeight, float minVal, float maxVal, float val){
  float pos = ((maxVal - minVal)/lineHeight) * val;
  return pos;
}