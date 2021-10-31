
import 'dart:io';

void main(){
  /// input string value
  print('What is your name ?');

  String? name = stdin.readLineSync();
  print('My name is $name.');

  /// input integer value
  print('How old are you ?');

  int age = int.parse(stdin.readLineSync().toString());
  print('I\'m $age years old.'); // use \ to write single quotation inside a sentence
  print("I'm $age years old."); // don't need to use \ to write single quotation inside a "" double quotation sentence
}
