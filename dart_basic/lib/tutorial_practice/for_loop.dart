
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
  numArr.forEach((nElementOfArray) => print(nElementOfArray));
  print('------------------------------------');

  // Using for-each higher order function
  // Pass parameter to nElementOfArray method
  numArr.forEach((nElementOfArray));
}

void nElementOfArray(num){
  print(num);
}
