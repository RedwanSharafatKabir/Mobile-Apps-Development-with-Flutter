
class Num{
  int num = 10;
}

void main(){
  // ?. is short-cut form of if condition
  var n1 = Num();
  int? value1;

  value1 = n1 ?. num; // if(n != null) { value = n.num; }

  print(value1);

  // ?? is short-cut form of if-else condition
  var n2;
  int? value2;

  value2 = n2 ?. num ?? 5; // if(n != null) { value = n.num; } else { value = 5; }

  print(value2);

  // ?? is short-cut form of if condition (only when the value is null)
  var n3;
  int? value3;

  value3 = n3 ??= 50; // if(n == null) { value = 50; }

  print(value3);
}
