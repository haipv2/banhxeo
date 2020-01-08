
import 'package:banhxeo/model/user.dart';

import 'base_dao.dart';
import 'package:path/path.dart';

class UserDao extends BaseDao<User> {
  @override
  Future<List<User>> findAll() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = [];
    return List.generate(maps.length, (i) {
      return User(id: maps[i]['id'], name: maps[i]['name']);
    });
  }

  @override
  Future<User> findById(int id) {
    // TODO: implement findById
    return null;
  }

  @override
  void insert(User t) async {
  }

  @override
  void update(User t) async {
    final db = await database;
  }
}
