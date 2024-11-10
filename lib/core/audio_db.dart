import'package:path/path.dart';
import'package:sqflite/sqflite.dart';
class AudioDB{


static Database? _db;

Future<Database?> get db async{
  if(_db == null){
    _db = await intialDB();
    return _db; 
  }
  else{
  return _db;
  }
}



intialDB() async {
  String databasesPath = await getDatabasesPath();

  String dbPath = join(databasesPath, 'audio_db');

  Database database = await openDatabase(dbPath, version: 2, onCreate: oncreate);

  return database;

}
  
void oncreate(Database database, int version) async {
  await database.execute('''
          CREATE TABLE "audio" (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          "name" TEXT,
          "date" TEXT,
          "approve" INTEGER DEFAULT 0
          )
          ''');
          print('create Datebase and table -------------------');
}



readData(String sql)async{
Database ?mydb=await db;
var response=await mydb!.rawQuery(sql);
print(response);
return response;
 }


insertData(String sql)async{
Database ?mydb= await db;
var response= await mydb!.rawInsert(sql);
print('------------  insert Done ------------');
return response;
 }

 
updateData(String sql)async{
Database ?mydb= await db;
var response= await mydb!.rawUpdate(sql);
return response;
 }

 
deleteData(String sql)async{
Database ?mydb= await db;
var response= await mydb!.rawDelete(sql);
print('------------  delete Done ------------');
return response;
}

dropTable(String tableName)async{
var response= await _db!.execute("DROP TABLE IF EXISTS '${tableName}' ");
print('------------  delete Done ------------');
return response;
}

deleteAllDataintable(String tableName)async{
Database ?mydb= await db;
var response= await mydb!.delete(tableName);
print('------------  delete Done ------------');
return response;
}


dropDatabase()async{
String databasesPath = await getDatabasesPath();
var response= await deleteDatabase(join(databasesPath, 'audio_db'));
print('------------  Drop Done ------------');
return response;
}




}