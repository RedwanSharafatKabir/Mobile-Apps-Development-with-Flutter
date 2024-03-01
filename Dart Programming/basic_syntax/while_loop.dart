
import 'dart:io';

void main(){
  var n = 5;

  while(n>0){
    print("*");
    n-=1;
  }

  dynamic value = 25;

  while(value>21){
    stdout.write(value);
    // break;
    return; // program stops after return
  }

  value = "ssd";
  print(value);
}
