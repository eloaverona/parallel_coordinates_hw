/*
  This class reads tsv files
*/
  

import java.util.Map;
class TableReader{
    Table table;
    String[] headers;
    String[] dataTypes;
    HashMap<String, Value[]> rows;
    Column[] columns; 
    TableReader(String file_name){
      table = loadTable(file_name, "header, tsv");
      getHeadersFromFile();
      getRowsDict();

    }
    
  
    void getHeadersFromFile(){
      TableRow headerRow = table.getRow(0);
      headers = new String[headerRow.getColumnCount()];
      dataTypes = new String[headerRow.getColumnCount()];
      columns = new Column[headerRow.getColumnCount()];
      for(int i = 0; i < headerRow.getColumnCount(); i++){
        headers[i] =  headerRow.getColumnTitle(i);
        dataTypes[i] = headerRow.getString(headers[i]);
        columns[i] = createColumn(headers[i], dataTypes[i]);
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
    //Not being used yet
      rows = new HashMap<String, Value[]>(); 
      for(int i = 1; i < table.getRowCount(); i++){
        Value[] rowVals = new Value[headers.length-1];
        TableRow row = table.getRow(i);
            for(int j = 1; j < headers.length; j++){
               String dataType = dataTypes[j];
               float val = row.getFloat(headers[j]);
               int val2 = row.getInt(headers[j]);
               Value value = new Value(val, val2, dataType);
               rowVals[j-1] = value;
            }
       rows.put(row.getString(headers[0]), rowVals);
       // print(row.getString(headers[0]));
        //print(rowVals.length);
       //for(int k = 0; k < rowVals.length; k++) print(rowVals[k].valueFloat + " " + rowVals[k].valueInt);
    }
  
  }
   Column createColumn(String columnName, String dataType){
      float minVal = Float.MAX_VALUE;
      float maxVal = -Float.MAX_VALUE;
      HashMap<Value, ArrayList<String>> valsDict = new HashMap<Value, ArrayList<String>>();
      for(int i = 0; i < table.getRowCount(); i++){
        TableRow row = table.getRow(i);
        String name = row.getString(headers[0]);
        float val = row.getFloat(columnName);
        Value value = new Value(val, row.getInt(columnName), dataType);
        if(val > maxVal) maxVal = val;
        if(val < minVal) minVal = val;
        if(valsDict.containsKey(value)){
          valsDict.get(value).add(name);
        } else {
           ArrayList<String> rowNames = new  ArrayList<String>();
           rowNames.add(name);
           valsDict.put(value, rowNames);
        }
    }
      Value maxi = new Value(maxVal, (int) maxVal, dataType);
      Value mini = new Value(minVal, (int) minVal, dataType);
      Column col = new Column(mini, maxi, valsDict, dataType, columnName);
      return col;
    } 
   
}  