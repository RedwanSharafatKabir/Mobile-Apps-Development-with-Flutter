
import 'dart:io';

void main() {

  // we can also use var instead of List<dynamic> data-type
  /** If we use var instead of List<dynamic> we can change the values of the list, but not the data-type **/

  // we can also use dynamic instead of List<dynamic> data-type
  /** If we use dynamic instead of List<dynamic> we can change the values of the list and data-type too **/

  List<dynamic> info = ["DIU", 51, 37.89, true];

  info.insert(1, "BUET");
  info.insertAll(2, ["test", "temp"]);
  info.add("IUT");
  info.addAll(["test1", "temp1"]);

  print("Info size: ${info.length}");

  for (var n in info) {
    stdout.write(n.toString() + " ");
  }

  print('');

  info.removeAt(7);
  info.remove("temp1");
  info.removeAt(2);
  print(info);

  /** It will fetch info list **/
  // var info2 = info;

  /** [...] is spread operator **/
  /** It will set the elements of info list into info2 list **/
  /** that's why changing elements of info list will not affect info2 list **/
  /** last index = info.length - 1 **/

  var info2 = info;
  info[info.length-1] = 8733;

  /** Here 2 is starting index, 4 is ending index **/
  /** Between this index the [1, 2, "Area"] array will be inserted **/
  info.replaceRange(2, 4, [1, 2, "Area"]);

  for (var n in info2) {
    stdout.write(n.toString() + " ");
  }

  print('');
  ////////////////////////////////////////////////////

  // Set
  /** When we declare a variable with empty {} but set the data type, it is a Hash-Set by default **/
  var testSet = <bool>{};
  print("Type of Test Set is: " + testSet.runtimeType.toString());
  testSet = <double>{}.cast<bool>();
  print("Type of Test Set after cast to double is: " + testSet.runtimeType.toString());

  /** When we declare a variable containing elements inside {} it is a Hash-Set **/
  var mySet = {"AMI", "AMI", "API"};
  print("Type of My Set is: " + mySet.runtimeType.toString());

  /** for each loop **/
  mySet.forEach((element) {
    stdout.write("$element ");
  });

  print('');

  for(var n in mySet){
    stdout.write(n.toString() + " ");
  }

  print('');
  ////////////////////////////////////////////////////

  // Map >> Key Value Pair of Items
  /** When we declare a variable with empty {} it is a Hash-Map by default **/
  dynamic myMap = {};
  print("Type of My Map is: " + myMap.runtimeType.toString());

  // String key value pair

  var infoMap = {
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

  // insert value in the instance of Map() class
  infoMap2 [5] = "CPC";
  infoMap2.remove(2);

  print(infoMap2);
  print("Section: " + infoMap2[3] + ", Department: "+ infoMap2[4] + ", Club: " + infoMap2[5]);

  // Map with constructor
  var infoMap3 = new Map();
  infoMap3['name'] = 'Redwan';
  infoMap3['age'] = 25;

  print(infoMap3);
  print("Length: ${infoMap3.length}");
  print(infoMap3.keys);
  print(infoMap3.values);
  
  infoMap3.addAll(infoMap);

  /** In infoMap Map there is already a value which's key is name **/
  /** So the output will show only one value against "name key" **/
  print(infoMap3['name']);
  
  infoMap3.remove("age");
  print(infoMap3);
  print(infoMap3.values);

  infoMap3.clear();
  print(infoMap3.values);
}
