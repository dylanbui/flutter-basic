

import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

// Type alias
// typedef Integer = int;
// void main() {
//   print(int == Integer); // true
// }


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

typedef Dictionary = Map<String, dynamic>;

class NetworkConfig {
  static String baseURL = NetworkURL.DEV.url;
}

enum NetworkURL { DEV, TEST, PRODUCTION }

extension NetworkURLExtention on NetworkURL {
  String get url {
    switch (this) {
      case NetworkURL.DEV:
        return 'https://jsonplaceholder.typicode.com/';
      case NetworkURL.TEST:
        return 'http://45.117.162.60:8081/sam/api/';
      case NetworkURL.PRODUCTION:
        return 'http://45.117.162.60:8081/sam/api/';
      default:
        return 'http://45.117.162.60:8081/sam/api/';
    }
  }
}



class BaseError {

  final int code;
  final String messenger;

  // Constructor
  const BaseError(this.code, this.messenger);
}

abstract class BaseBlocState extends Equatable {

  @override
  List<Object> get props => [];
}

abstract class BaseBlocEvent extends Equatable {

  @override
  List<Object> get props => [];

}

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

