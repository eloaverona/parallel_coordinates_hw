/*
  This class reads tsv files
*/

class TableReader{
    Table table;
    String[] headers;
    
    
    TableReader(String file_name){
      table = loadTable(file_name, "header, tsv");
      headers = getHeadersFromFile();
    }
    
  
    String[] getHeadersFromFile(){
      TableRow headerRow = table.getRow(0);
      String[] localHeaders = new String[headerRow.getColumnCount()];
      for(int i = 0; i < headerRow.getColumnCount(); i++){
        localHeaders[i] =  headerRow.getColumnTitle(i);
      }
      return localHeaders;
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
  
}