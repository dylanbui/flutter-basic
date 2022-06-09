

import 'dart:core';

import 'package:flutter/widgets.dart';


// Khong su dung dc
// class InheritedProvider<T> extends InheritedWidget {
//   final T inheritedData;
//
//   InheritedProvider({required Widget child, required this.inheritedData,}) : super(child: child);
//
//   @override
//   bool updateShouldNotify(InheritedProvider oldWidget) => inheritedData != oldWidget.inheritedData;
//   // static T of<T>(BuildContext context) => (context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>().runtimeType>() as InheritedProvider<T>).inheritedData;
//   static InheritedProvider<T>? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>().runtimeType>() as InheritedProvider<T>;
// }

class Data {
  String text;
  int counter;
  String dateTime;
  Data({required this.text, required this.counter, required this.dateTime});

  // Data(this.text, this.counter, DateTime.now().toString()); // Loi ko chay dc

}

class User {
  const User(this.userName, this.email, this.password,  this.value);

  final String? userName;
  final String? email;
  final String? password;

  final int value;



// .. operator ==, hashCode
}

// Khong su dung dc
class InheritedDataProvider extends InheritedWidget {
  final Data data;
  InheritedDataProvider({required Widget child, required this.data,}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedDataProvider oldWidget) => data != oldWidget.data;
  static InheritedDataProvider? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<InheritedDataProvider>();
}