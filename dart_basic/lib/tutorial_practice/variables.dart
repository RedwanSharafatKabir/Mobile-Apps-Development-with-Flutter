
import 'dart:io';

int textSum(int m, int n){
  int sum = m + n;

  return sum;
}

void main(){
  // we can change the value of var typed variable but not the data type
  var result = textSum(5, 2);

  result = textSum(4, 2);

  // we can change the value of var typed variable but not the data type
  var name = "Redwan";
  name = "Sharafat";

  print(name + " " + result.toString());

  // we can change the value as well as data type of dynamic typed variable
  dynamic ageOrName = 23;
  ageOrName = "Kabir";

  print(ageOrName);

  // const is constant type variable
  // We cannot change the value of constant variable during run time
  const institute = "Code Solution BD";
  print(institute); // With new line

  /* We cannot use stdout for browser based application */
  /* Because in browser stdout will not run */
  stdout.write(institute + " "); // Without new line
  stdout.writeln(institute); // With new line
}
