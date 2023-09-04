
import 'dart:io';

void main() {

  // we can also use var instead of List<dynamic> data-type
  /** If we use var instead of List<dynamic> we can change the values of the list, but not the data-type **/

  // we can also use dynamic instead of List<dynamic> data-type
  /** If we use dynamic instead of List<dynamic> we can change the values of the list and data-type too **/

  List<dynamic> info = ["DIU", 51, 37.89];

  info.insert(1, "BUET");
  info.insertAll(2, ["test", "temp"]);
  info.add("IUT");
  info.addAll(["test1", "temp1"]);

  for (var n in info) {
    stdout.write(n.toString() + " ");
  }

  print('');
  print("Info size: ${info.length}");

  /* It will fetch info list */
  // var info2 = info;

  /* [...] is spread operator */
  /* It will set the elements of info list into info2 list */
  /* that's why changing elements of info list will not affect info2 list */
  var info2 = [...info];
  info[1] = 8733;

  for (var n in info2) {
    stdout.write(n.toString() + " ");
  }

  print('');
  ////////////////////////////////////////////////////

  // Set
  /* When we declare a variable with empty {} but set the data type it is a Hash-Set by default */
  var testSet = <bool>{};
  print("Type of Test Set is: " + testSet.runtimeType.toString());
  testSet = <double>{}.cast<bool>();
  print("Type of Test Set after cast to double is: " + testSet.runtimeType.toString());

  /* When we declare a variable containing elements inside {} it is a Hash-Set */
  var mySet = {"AMI", "AMI", "API"};
  print("Type of My Set is: " + mySet.runtimeType.toString());

  stdout.write("Unique items of 'AMI', 'AMI', 'API' are: ");
  for(var n in mySet){
    stdout.write(n.toString() + " ");
  }

  print('');
  ////////////////////////////////////////////////////

  // Map >> Key Value Pair of Items
  /* When we declare a variable with empty {} it is a Hash-Map by default */
  var myMap = {};
  print("Type of My Map is: " + myMap.runtimeType.toString());

  // String key value pair
  var infoMap = {
    "roll": "8737",
    "name": "Munna",
    "section": "D"
  };

  infoMap = {
    "roll": "8737",
    "name": "Munna",
    "section": "D",
    "subject": "CSE"
  };

  infoMap ["club"] = "CPC";

  print("Subject: " + infoMap["subject"].toString());
  print("Club: " + infoMap["club"].toString());

  // integer key value pair
  Map infoMap2 = {
    1: "8737",
    2: "Munna",
    3: "D",
    4: "CSE"
  };

  print("Section: " + infoMap2[3]);

  // Create map object and insert value in the instance of Map() class
  var infoMap3 = Map();
  infoMap3 = {
    1: "8737",
    2: "Munna",
    3: "D",
    4: "CSE"
  };

  infoMap3 [5] = "DIU";
  infoMap3 [6] = "CPC";

  print('Department: '+ infoMap3[4] + ', Club: ' + infoMap3[6]);
}
