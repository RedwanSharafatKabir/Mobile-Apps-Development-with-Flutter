
import 'dart:io';

void displayFruitDetails(List<Map<String, dynamic>> fruits){
  print('Original Fruit Details before Discount:');

  fruits.forEach((element) {
    element.forEach((key, value) {
      if(key=='Price'){
        stdout.write("$key: \$$value, ");

      } else {
        stdout.write("$key: $value, ");
      }
    });

    print('');
  });
}

void applyPriceDiscount(List<Map<String, dynamic>> fruits, double discount){
  print('\nFruit Details After Applying 10% Discount:');

  fruits.forEach((element) {
    element.forEach((key, value) {
      if(key=='Price'){
        double updatedValue = value - ((value * discount) / 100);
        stdout.write("$key: \$$updatedValue, ");

      } else {
        stdout.write("$key: $value, ");
      }
    });

    print('');
  });
}

void main(){
  List<Map<String, dynamic>> fruits = [
    {"Name": "Banana", "Color": "Yellow", "Price": 2.5},
    {"Name": "Mango", "Color": "Green", "Price": 1.0},
    {"Name": "Guava", "Color": "Green", "Price": 3.0}
  ];

  displayFruitDetails(fruits);
  applyPriceDiscount(fruits, 10);
}
