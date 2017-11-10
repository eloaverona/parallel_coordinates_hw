class Value{
  float valueFloat;
  int valueInt;
  
  public Value(float valueFloat, int valueInt, boolean isFloat){
    if(isFloat) {
      this.valueFloat = valueFloat;
      this.valueInt = -1;
    }  
    else {
      this.valueInt = valueInt;
      this.valueFloat = -1;
    }  
  }

}