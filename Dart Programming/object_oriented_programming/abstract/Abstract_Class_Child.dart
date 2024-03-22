
import 'Abstract_Class_Parent.dart';

class CSEDepartment extends Students{

  @override
  void reading() {
    print('Reading Algorithms');
  }

  @override
  void joiningClass() {
    print('Join through google meet');
  }
}

/** implementation **/
class PharmacyDepartment implements Students {

  @override
  void reading() {
    print('\nReading Biology');
  }

  @override
  void joiningClass() {
    print('Join through zoom');
  }

  @override
  void givingTest() {
    print('Mid term test');
  }
}

void main(){
  CSEDepartment cseDepartment = CSEDepartment();

  cseDepartment.reading();
  cseDepartment.joiningClass();


  PharmacyDepartment pharmacyDepartment = PharmacyDepartment();

  pharmacyDepartment.reading();
  pharmacyDepartment.joiningClass();
}
