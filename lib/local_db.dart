import 'dart:math';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import ' model/register_model.dart';

class LocalDb{
  static Database? _db;
  static final LocalDb instance=LocalDb._constructor();
  final String _tasksTableName ="tasks";
  final String _tasksIdColumnName="id";
  final String _tasksColumnName="name";
  final String _tasksBdateColumnName="bdate";
  final String _tasksEmailColumnName="email";

  LocalDb._constructor();
  Future<Database> get database async{
    if(_db != null) return _db!;
    _db =await getDatabase();
    return _db!;
    }



  Future<Database> getDatabase() async{
  final databaseDirPath = await getDatabasesPath();
  final databasePath = join(databaseDirPath, "Register_db.db");

  final database = await openDatabase(
    databasePath,
    version: 1,
    onCreate: (db, version){
      db.execute('''
           CREATE TABLE  $_tasksTableName(
           $_tasksIdColumnName INTEGER PRIMARY KEY,
           $_tasksColumnName TEXT NOT NULL,
           $_tasksBdateColumnName TEXT NOT NULL,
           $_tasksEmailColumnName TEXT NOT NULL
                     
                      )
                      
                       
         
      
      ''');

    },
  );
  return database;
  }
  void addTask(String name, String bdate, String email) async{
    final db= await database;
    await db.insert(_tasksTableName,
        {
          _tasksColumnName : name,
          _tasksBdateColumnName : bdate,
          _tasksEmailColumnName : email
        },

    );


}
  Future<List<Register>?> getRegister() async{
    final db= await database;
    final data= await db.query(_tasksTableName);
    //print(data);
    List<Register> register =data.map((e)=> Register(
        name: e["name"] as String,
        bdate: e["bdate"] as String,
        email: e["email"] as String
    )).toList();
    return register;
  }

  }