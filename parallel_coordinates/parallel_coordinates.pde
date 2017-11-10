TableReader data;


boolean useCars = true;

int numOfAttributes;
float line_height;


void setup(){
  size(980, 650);
  pixelDensity(displayDensity());
  if(useCars) {
      data = new TableReader("cars-cleaned.tsv");
    
  }else{
      data = new TableReader("cameras-cleaned.tsv");
  }  
  numOfAttributes = data.headers.length;
}

void draw(){
  background(255);
  drawAxis();
  int numOfAttributes = data.headers.length;
  float gap = (width*0.9)/numOfAttributes;
   for(int i = 0; i < data.table.getRowCount(); i++){
     TableRow row = data.table.getRow(i);
     for(int j = 1; j < data.headers.length; j++){
       float val = row.getFloat(data.headers[j]);
       //print(val+"   ");
       Float[] maxmin = data.getMinAndMaxFromColumn(data.headers[j]);
       if(j < data.headers.length-1){
         float val2 = row.getFloat(data.headers[j+1]);
         Float[] maxmin2 = data.getMinAndMaxFromColumn(data.headers[j+1]);
         stroke(30, 20);
         line(j*gap+30, calculateYPos(line_height-30, maxmin[0], maxmin[1], val), (j+1)*gap+30, calculateYPos(line_height-30, maxmin2[0], maxmin2[1], val2));
       }
     }  
   }  
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
  stroke(0);
  fill(0);
  for(int i = 1; i < numOfAttributes; i++){
    line(i*gap + 30, 30, i*gap + 30, 590);
    text(data.headers[i], i*gap + 30, 610);
    Float[] maxmin = data.getMinAndMaxFromColumn(data.headers[i]);
    //min
    text(maxmin[0], i*gap + 30, 620);
    //max
    text(maxmin[1], i*gap + 30, 25);  
  } 
}

float calculateYPos(float lineHeight, float minVal, float maxVal, float val){
  float pos = 30 + (((maxVal-val)/(maxVal-minVal))*lineHeight);
  //5140.0 - 1613.0 = 3525 / 590 = 5.97 
  print("    "+maxVal+" "+minVal);
  //-20356.793
  return pos;
}