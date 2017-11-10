/*
  This class reads tsv files
*/
  

import java.util.Map;
class TableReader{
    Table table;
    String[] headers;
    String[] dataTypes;
    HashMap<String, Value[]> rows;
    
    TableReader(String file_name){
      table = loadTable(file_name, "header, tsv");
      getHeadersFromFile();
      getRowsDict();
      getColumnValues();
    }
    
  
    void getHeadersFromFile(){
      TableRow headerRow = table.getRow(0);
      headers = new String[headerRow.getColumnCount()];
      dataTypes = new String[headerRow.getColumnCount()];
      for(int i = 0; i < headerRow.getColumnCount(); i++){
        headers[i] =  headerRow.getColumnTitle(i);
        dataTypes[i] = headerRow.getString(headers[i]);
      }
    }
    
    Float[] getMinAndMaxFromColumn(String columnName){
      float minVal = Float.MAX_VALUE;
      float maxVal = -Float.MAX_VALUE;    
      for(int i = 0; i < table.getRowCount(); i++){
        TableRow row = table.getRow(i);
        float val = row.getFloat(columnName);
        if(val > maxVal) maxVal = val;
        if(val < minVal) minVal = val;
        
      }
      Float[] vals = {minVal, maxVal};
      return vals;
    } 
    
  void getRowsDict(){
      rows = new HashMap<String, Value[]>(); 
      for(int i = 1; i < table.getRowCount(); i++){
        Value[] rowVals = new Value[headers.length-1];
        TableRow row = table.getRow(i);
            for(int j = 1; j < headers.length; j++){
              String dataType = dataTypes[j];
              //print(dataType);
              switch(dataType){
                case("int"):             
                  int val = row.getInt(headers[j]);
                  Value value = new Value(0, val, false);
                  rowVals[j-1] = value;
                  break;
                case("float"):      
                  float val3 = row.getFloat(headers[j]);
                  Value value3 = new Value(val3, 0, true);
                  rowVals[j-1] = value3;
                  break;
              } 
            }
       rows.put(row.getString(headers[0]), rowVals);
       // print(row.getString(headers[0]));
        //print(rowVals.length);
       //for(int k = 0; k < rowVals.length; k++) print(rowVals[k].valueFloat + " " + rowVals[k].valueInt);
    }
  
  }
  
    HashMap<Float, ArrayList<String>> getColumnValues(){
      String colName = "cylinders";
      HashMap<Float, ArrayList<String>> colVals = new HashMap<Float, ArrayList<String>> ();
      for(int i = 1; i < table.getRowCount(); i++){
        TableRow row = table.getRow(i);
        String name = row.getString(headers[0]);
        Float val = row.getFloat(colName);
        if(colVals.containsKey(val)){
          colVals.get(val).add(name);
        } else {
           ArrayList<String> rowNames = new  ArrayList<String>();
           rowNames.add(name);
           colVals.put(val, rowNames);
        }
      }
      for (Map.Entry me : colVals.entrySet()) {
        print(me.getKey() + " is ");
        ArrayList<String> rowNames = (ArrayList<String>) me.getValue();
        for(int j = 0; j < rowNames.size(); j++){
          println(rowNames.get(j));
        }
      }    
      return colVals;
     
    }
}  