import 'package:flutter/material.dart';

class User {
  final String id;
  final String titulo;
  final String motivo;
  final String nivel;

  const User({
    required this.nivel,
    required this.id,
    required this.titulo,
    required this.motivo,
  });
}
