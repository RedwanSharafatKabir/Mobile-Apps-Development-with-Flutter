
// Here [int? y] is optional parameter
sumMethod1(int m, int n, [int? y]){
  print('$y');
}

// Here {int? y} is also optional but named parameter
sumMethod2(int m, int n, {int? y, required int? z}){
  var x = "System";
  print('$x আলেদা -');
  print('$y, $z');

  print("Sum of m and n is: ${m+n}");
}

double sumDoubleMethod(int m, double n){
  return m+n;
}

dynamic multiplyValue(var num){
  return num*2;
}

// => This is called fat arrow expression
dynamic multiplyWithFatArrowExpression(var num) => num*2;

void main() {
  print(sumMethod1(5, 3, 7));
  print(sumMethod1(5, 3));
  print(sumMethod2(5, 3, z: 10));
  print(sumMethod2(5, 3, y: 7, z: 12));
  print(sumDoubleMethod(5, 3.2));
  print(multiplyValue(2.5));
  print(multiplyValue("SSD"));
  print(multiplyWithFatArrowExpression(2.5));
}
