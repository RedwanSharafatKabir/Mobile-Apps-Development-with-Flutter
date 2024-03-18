
import 'EncapsulcationTest.dart';

void main(){
  EncapsulationTest testObj = EncapsulationTest("Redwan", "Munna", "Gulshan 1, Dhaka", 25);

  /** We cannot edit firstname and lastname from EncapsulationTest class. **/
  /** We can only access getUserInfo() method from EncapsulationTest class. **/

  testObj.address = "Mugdapara";
  print(testObj.getUserInfo()); /** getter method **/

  testObj.setLastName("Sharafat"); /** setter method **/
  print(testObj.getUserInfo());
}