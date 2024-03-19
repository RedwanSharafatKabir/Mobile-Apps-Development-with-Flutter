
import 'Inheritence_Child.dart';

class Student extends Human {
  Student(super.hand, super.leg);

  @override
  set leg(int _leg) {
    super.leg = _leg;
  }

  
}
