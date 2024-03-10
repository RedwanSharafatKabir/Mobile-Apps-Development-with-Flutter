
class EncapsulationTest {
  /** using "_" (under score before a variable/method name indicates the property as private) **/
  String _firstName;
  String _lastName;
  String address;
  int age;

  EncapsulationTest(this._firstName, this._lastName, this.address, this.age);

  String getUserInfo(){
    String userInfo = "$_firstName $_lastName, $address, $age";

    return userInfo;
  }

  void setLastName(String modifiedLastName){
    if(_lastName=="Munna"){
      _lastName = modifiedLastName;
    }
  }
}
