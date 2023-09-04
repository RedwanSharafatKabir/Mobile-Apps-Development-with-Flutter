
void main(){

  var str1 = "25.63";
  String str2 = "4.27";

  /** String to number (integer / double) **/
  print(num.parse(str1) + num.parse(str2));

  /** String to double **/
  print(double.parse(str1) + double.parse(str2));

  /** double to integer **/
  print(double.parse(str1).toInt() + double.parse(str2).toInt());
}
