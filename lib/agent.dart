library agent;

import 'package:flutter/material.dart';

mixin Auth {}

mixin Database {
  Reference reference();
}

class Reference {
  final String path;
  final ReferenceImpl impl;

  Reference(this.path, this.impl);

  Reference child(String path) {
    return Reference(this.path + path, impl);
  }

  Future setInt(int i) => impl.setValue(path, i);

  Future setDouble(double d) => impl.setValue(path, d);

  Future setString(String s) => impl.setValue(path, s);

  Future setBool(bool b) => impl.setValue(path, b);

  Future setObject(Jsonify o) => impl.setValue(path, o.toJson());

  Future insertInt(int i) => impl.insert(path, i);

  Future insertDouble(double d) => impl.insert(path, d);

  Future insertString(String s) => impl.insert(path, s);

  Future insertBool(bool b) => impl.insert(path, b);

  Future insertObject(Jsonify o) => impl.insert(path, o.toJson());

  Future<int> getInt() => impl.getValue(path);

  Future<double> getDouble() => impl.getValue(path);

  Future<String> getString() => impl.getValue(path);

  Future<String> getBool() => impl.getValue(path);

  Future<Map<String, dynamic>> getObject() => impl.getValue(path);

  Future remove() => impl.remove(path);

  Future<List> getAll() => impl.getList(path);
}

mixin ReferenceImpl {
  Future setValue(String path, dynamic value);

  Future insert(String path, dynamic value);

  Future getValue(String path);

  Future getList(String path);

  Future remove(String path);
}

mixin Jsonify {
  Map<String, dynamic> toJson();
}

class _Jsonify implements Jsonify {
  _Jsonify(Map<String, dynamic> data);

  @override
  Map<String, dynamic> toJson() => {};
}

class User with Jsonify {
  final String name;
  final String id;

  const User({this.name, this.id});

  factory User.fromJson(Map<String, dynamic> data) => User(
        name: data['n'],
        id: data['i'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'i': id,
        'n': name,
      };
}
