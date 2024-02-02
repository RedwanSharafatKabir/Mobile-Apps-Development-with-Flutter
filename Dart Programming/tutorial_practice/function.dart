
sumMethod(int m, int n){
  var x = "System";
  print('$x আলেদা -');

  return "Sum of m and n is: ${m+n}";
}

double sumDoubleMethod(int m, double n){
  return m+n;
}

dynamic multiplyValue(var num){
  return num*2;
}

// => This is called fat arrow / fat arrow expression
dynamic multiplyWithFatArrowExpression(var num) => num*2;

void main() {
  print(sumMethod(5, 3));
  print(sumDoubleMethod(5, 3.2));
  print(multiplyValue(2.5));
  print(multiplyValue("SSD"));
  print(multiplyWithFatArrowExpression(2.5));
}
