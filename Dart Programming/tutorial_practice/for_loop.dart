
import 'dart:io';

void main(){
  var numArr = [1, 3, 5, 7];

  // standard for loop
  for(int i=0; i<numArr.length; i++){
    print(numArr[i]);
  }
  print('------------------------------------');

  // for-in loop
  for(var n in numArr){
    print("Index of " + n.toString() + " is " + numArr.indexOf(n).toString());
  }
  print('------------------------------------');

  // for-each loop
  // Using short form of arrow function =>
  print('for each 1');
  numArr.forEach((nElementOfArray) {
    print(nElementOfArray);
  });
  print('------------------------------------');

  print('for each 2');
  numArr.forEach((nElementOfArray) => print(nElementOfArray));
  print('------------------------------------');

  // Pattern 1
  print('\nPattern 1');
  for(int i=5; i>0; i--){
    for(int j=i; j>0; j--){
      stdout.write('* ');
    }

    print('');
  }

  for(int i=1; i<5; i++){
    for(int j=0; j<=i; j++){
      stdout.write('* ');
    }

    print('');
  }

  // Pattern 2
  print('\nPattern 2');
  for(int i=0; i<5; i++){
    for(int j=2*(5-i); j>=0; j--){
      stdout.write(" ");
    }

    for(int j=0; j<=i; j++){
      stdout.write('* ');
    }

    print('');
  }

  // Pattern 3
  print('\nPattern 3');
  for(int i=0; i<5; i++){
    for(int j=5-i; j>=0; j--){
      stdout.write(" ");
    }

    for(int j=0; j<=i; j++){
      stdout.write('* ');
    }

    print('');
  }
}

void nElementOfArray(num){
  print(num);
}
