
void main() {
  print('Hello world !');

  print(sumMethod(5, 3.2));
  print(sumDoubleMethod(5, 3.2));
  print(multiplyValue(2.5));
  print(multiplyValue(15));
  print(square(2.5));
}

sumMethod(int m, double n){
  var x = "System";
  return "Sum of m and n is: ${m+n} $x";
}

double sumDoubleMethod(int m, double n){
  return m+n;
}

// Here double means দ্বিগুণ
dynamic multiplyValue(var num){
  return num*2;
}

// => This is called fat arrow / fat arrow expression
dynamic square(var num) => "Fat Arrow Expression: ${num*num}";
