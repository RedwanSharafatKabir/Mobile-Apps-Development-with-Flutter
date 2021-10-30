
class Person{
  String name = "Redwan";
  int age = 24;
}

int textSum(int m, int n){
  int sum = m + n;

  return sum;
}

void main(){
  var obj1 = Person();
  var obj2 = Person();

  obj2.name = "Sharafat";
  
  print(obj1.name + " " + obj1.age.toString());
  print(obj2.name + " " + obj1.age.toString());
}
