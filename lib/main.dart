import 'package:flutter/material.dart';
import 'package:to_do_list/my_app.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  1: ''' CREATE TABLE tarefas(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          descricao TEXT,
          concluido INTEGER
          );'''
};

Future iniciarBancoDeDados() async {
  var db = await openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: scripts.length, onCreate: (db, version) async {
    for (var i = 1; i < scripts.length; i++) {
      await db.execute(scripts[i]!);
      debugPrint(scripts[i]!);
    }
  }, onUpgrade: (db, oldVersion, newVersion) async {
    for (var i = oldVersion + 1; i < scripts.length; i++) {
      await db.execute(scripts[i]!);
      debugPrint(scripts[i]!);
    }
  });
  return db;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await iniciarBancoDeDados();
  runApp(const MyApp());
}