package mybean.data;
public class fbzp{
   String []columnName ;           //存放列名
   String [][] tableRecord=null;   //存放查询到的记录
   public fbzp() {
      tableRecord = new String[1][1];
      columnName = new String[1]; 
   }
   public void setTableRecord(String [][] s){
      tableRecord=s;
   }
   public String [][] getTableRecord(){
      return tableRecord;
   }
   public void setColumnName(String [] s) {
      columnName = s;
   }
   public String [] getColumnName() {
      return columnName;
   }
}

