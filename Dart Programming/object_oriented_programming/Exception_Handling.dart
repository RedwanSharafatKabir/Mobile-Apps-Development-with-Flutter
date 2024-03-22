
class CustomException implements Exception {
  @override
  String toString() {
    return super.toString();
  }
}

void testException(){
  throw CustomException();
  throw Exception('Code Exception');
  print('Could not print');
}

void main(){
  try {
    testException();

  } on CustomException {
    print(CustomException());

  } catch (e){
    print(e);

  } finally {
    print('Finally ready to print something...');
  }

  print('Printed something');

}
