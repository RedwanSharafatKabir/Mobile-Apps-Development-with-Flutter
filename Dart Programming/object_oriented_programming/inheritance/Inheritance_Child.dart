
import 'Inheritance_Parent.dart';

class Student extends Human {
  String institute;
  String section;

  /** Line number 9 and 10 are same **/
  // Student(super.hand, super.leg, this.institute, this.section);
  Student(int hand, int leg, this.institute, this.section) : super(hand, leg);

  @override
  void walking([String? name]) {
    super.walking(); /** It will execute the walking unction of parent class Human **/

    print('Standing with $leg legs');
    print('Student Name: $name');
  }
}

void main (){
  Student studentObj = Student(2, 2, "DIU", "D");

  studentObj.moving();
  studentObj.walking();

  print('');
  studentObj.walking("Sharafat");
}
