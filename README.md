# apex-plsql-apis
 Oracle APEX provides several generic, well tested, documented PL/SQL APIs for developers. This is a sample application to demonstrate the power of few such APIs. This application just covers few APIs with some examples. There are LOT MORE APIs and we can achieve wonderful things using these APIs.
 This application has been demonstrated in Oracle APEX India Office Hours #3 and you can watch the video [here].  
# How to Install
  * In Oracle APEX Builder > SQL Workshop > SQL Scripts, upload supporting_objects.sql file and install. Below objects will be installed as part this.
  
  | Object Name | Object Type |
  | ------ | ------ |
  |DEMO_FILES|TABLE|
  |DEMO_FILES_BIU|TRIGGER|
  |DEMO_FILES_ID_PK|INDEX|
  |DEPARTMENTS|TABLE|
  |DEPARTMENTS_BIU|TRIGGER|
  |DEPARTMENTS_ID_PK|INDEX|
  |DEPARTMENTS_UK|INDEX|
  |EMPLOYEES|TABLE|
  |EMPLOYEES_BIU|TRIGGER|
  |EMPLOYEES_I1|INDEX|
  |EMPLOYEES_ID_PK|INDEX|
  |EMP_V|VIEW|
  |HANDLE_APEX_ERROR|FUNCTION|  
  
  * Import APEX application f100.sql  
 
 [here]: <https://www.youtube.com/watch?v=6bMgLxPN2W8>
 