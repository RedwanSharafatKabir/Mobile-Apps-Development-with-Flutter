
void main(){
  dynamic temp = 5;

  switch(temp){
    case 1: {
      temp = "One";
      break;
    }

    case 2: {
      temp = "Two";
      break;
    }

    case 3 :{
      temp = "Three";
      break;
    }

    case <3: {
      temp = "Less than three";
      break;
    }

    case 4: {
      temp = "Four";
      break;
    }

    case 6: {
      temp = "Five";
      break;
    }

    default: {
      print("No data");
    }
  }

  print(temp);
}
