import 'package:flutter/material.dart';

class Tarefa {
  String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluido = false;

  Tarefa(this._descricao, this._concluido);
}