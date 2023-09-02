
void main(){

  print('I\'m Redwan, I\'m 24'); // use \ to write single quotation inside a sentence
  print("I'm Redwan, I'm 24"); // don't need to use \ to write single quotation inside a "" double quotation sentence

  // use r in-front of the string to show the full raw string
  // Such as print \n (new line symbol) as string
  print(r"I'm \n Redwan, I'm 24");

  // we cannot use r for raw string when there is no \ inside single quotation sentence
  print(r'I am \n Redwan, I am 24');

  // Multi line string
  print('''I am Redwan,
  I am 24'''); // For single quotation

  print("""I am Redwan, I am 24"""); // For double quotation

  // Parsing string into other data types

  String digit = "15";

  dynamic number = int.parse(digit);
  print("$number is an "+ number.runtimeType.toString() +" dynamic type variable.");

  number = double.parse(digit);
  print("$number is an "+ number.runtimeType.toString() +" dynamic type variable.");

}
