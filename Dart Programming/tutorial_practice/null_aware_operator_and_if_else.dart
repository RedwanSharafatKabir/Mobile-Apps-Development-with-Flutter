
import 'dart:io';

class Num{
  int num = 10;
}

void main(){
  // ?. is short-cut form of if condition
  var n1 = Num();
  int? value1;

  value1 = n1 .num; // if(n1 != null) { value = n1.num; }
  print(value1);

  // ? ?? is short-cut form of if-else condition
  var n2; // here value of n2 is null
  int? value2;

  value2 = n2 ?.num ?? 5; // if(n2 != null) { value = n2.num; } else { value = 5; }
  print(value2);

  // ?? is short-cut form of if condition (only when the value is null)
  var n3;
  value2 = n3 ?? 50; // if(n3 == null) { value = 50; }
  print(value2);

  dynamic value = 25;

  while(value>21){
    stdout.write(value);
    // break;
    return; // program stops after return
  }

  value = "ssd";
  print(value);

}
