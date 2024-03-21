
import 'Abstraction.dart';

void main(){
  AcRemote acRemote = AcRemote();

  // acRemote.increaseTemp();
  acRemote.decreaseTemp();

  print('Temperature: ${acRemote.getTemp}');
}
