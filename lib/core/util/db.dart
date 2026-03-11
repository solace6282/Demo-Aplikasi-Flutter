import 'package:sqflite/sqflite.dart';

// class Database {

// }

// class TodoProvider {
//   late Database db;

//   Future open(String path) async {
//     db = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute('''
// create table product ( 
//   id integer primary key autoincrement, 
//   name text not null,
//   image_url integer not null)
// ''');
//     });
//   }

//   Future<Todo> insert(Todo todo) async {
//     todo.id = await db.insert(tableTodo, todo.toMap());
//     return todo;
//   }

//   Future<Todo> getTodo(int id) async {
//     List<Map> maps = await db.query(tableTodo,
//         columns: [columnId, columnDone, columnTitle],
//         where: '$columnId = ?',
//         whereArgs: [id]);
//     if (maps.length > 0) {
//       return Todo.fromMap(maps.first);
//     }
//     return null;
//   }

//   Future<int> delete(int id) async {
//     return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
//   }

//   Future<int> update(Todo todo) async {
//     return await db.update(tableTodo, todo.toMap(),
//         where: '$columnId = ?', whereArgs: [todo.id]);
//   }

//   Future close() async => db.close();
// }