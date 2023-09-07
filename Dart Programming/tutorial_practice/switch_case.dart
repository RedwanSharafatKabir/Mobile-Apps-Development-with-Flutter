
void main(){
  dynamic temp = 5;

  switch(temp){
    case 1: {
      temp = "One";
    }

    case 2: {
      temp = "Two";
    }

    case >3: {
      temp = "Three";
    }

    case 4: {
      temp = "Four";
    }

    case 5: {
      temp = "Five";
    }
  }

  print(temp);
}
