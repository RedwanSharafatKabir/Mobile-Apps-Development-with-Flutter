
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
}
