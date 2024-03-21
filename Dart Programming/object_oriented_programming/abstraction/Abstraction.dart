
class AcRemote {
  int _temp = 19;

  void increaseTemp(){
    _awakeAc(1);
  }

  void decreaseTemp(){
    _awakeAc(0);
  }

  void _awakeAc(int command){
    print('Ac is awaken');
    _callArduino(command);
  }

  void _callArduino(int command){
    print('Arduino is called');
    _communicateAc(command);
  }

  void _communicateAc(int command){
    print('Communication started');
    _getResponse(command);
  }

  void _getResponse(int command){
    switch(command){
      case 0 : {
        _temp--;
        break;
      }

      case 1 : {
        _temp++;
        break;
      }
    }
  }

  int get getTemp {
    return _temp;
  }
}
