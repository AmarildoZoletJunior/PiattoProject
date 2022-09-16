import 'package:flutter/material.dart';

import '../data/lista.dart';
import '../data/user.dart';


class Users with ChangeNotifier {
  final Map <String, User> _items = {...listaUsuarios};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }
}