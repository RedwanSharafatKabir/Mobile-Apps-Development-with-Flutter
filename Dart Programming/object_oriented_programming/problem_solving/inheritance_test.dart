
class Media {
  void play(){
    print('Playing media...');
  }

}

class Song extends Media{
  late String artist;

  @override
  void play(){
    artist = "Chester Bennington";

    print('Playing song by $artist...');
  }
}

void main(){
  Media media = Media();
  Song song = Song();

  media.play();
  song.play();
}
