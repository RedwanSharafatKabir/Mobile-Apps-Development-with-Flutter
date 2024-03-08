
void main(){
  List<Student> studentList = [];

  Student studentObj = Student();

  studentObj.name = "Redwan";
  studentObj.address = "Mugdapara";
  studentObj.age = 25;

  studentList.add(studentObj);

  studentList.forEach((element) {
    print("${element.name}, ${element.address}, ${element.age}");
  });

  // access Class with parameters in constructor
  Teacher teacherObj = Teacher("Tanvir", "Shamoly", 55);

  List<Teacher> teacherList = [];

  teacherList.add(teacherObj);

  teacherList.forEach((element) {
    print("${element.name}, ${element.address}, ${element.age}");
  });
}

class Student {
  late String name;
  late String address;
  late int age;
}

class Teacher {
  late String name;
  late String address;
  late int age;

  Teacher(this.name, this.address, this.age);
}
