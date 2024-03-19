
class EncapsulationTest {
  /** using "_" (under score before a variable/method name indicates the property as private) **/
  String _firstName;
  String _lastName;
  String address;
  int _age;

  EncapsulationTest(this._firstName, this._lastName, this.address, this._age);

  String getUserInfo(){
    String userInfo = "$_firstName $_lastName, $address, $_age";

    return userInfo;
  }

  void setLastName(String modifiedLastName){
    if(_lastName=="Munna"){
      _lastName = modifiedLastName;
    }
  }

  void set setAge(int newAge){
    if(_age<18){
      _age = newAge;
    }
  }

  String get getLastName {
    return _lastName;
  }
}
