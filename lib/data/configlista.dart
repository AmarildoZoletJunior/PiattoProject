import 'package:flutter/material.dart';
import 'package:piattov2/data/user.dart';
import 'package:piattov2/data/lista.dart';

class Users with ChangeNotifier {
  final Map <String, User> _items = {...listaUsuarios};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }
}