import 'package:cloud_firestore/cloud_firestore.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Firestore _database;

  Future<Firestore> get database async {
    if (_database != null){
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
  }
}
