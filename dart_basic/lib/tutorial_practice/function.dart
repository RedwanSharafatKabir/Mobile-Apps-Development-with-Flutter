
sumMethod(int m, double n){
  return "Sum of m and n is: ${m+n}";
}

double sumDoubleMethod(int m, double n){
  return m+n;
}

void main(List<String> arguments) {
  print('Hello world !');

  print(sumMethod(5, 3.2));
  print(sumDoubleMethod(5, 3.2));
}
