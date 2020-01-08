import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';

abstract class BaseDao<T> {
  void insert(T t);
  void update(T t);
  Future<T> findById (int id);
  Future<List<T>> findAll();
  Firestore _database;

  Future<Firestore> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
  }

}