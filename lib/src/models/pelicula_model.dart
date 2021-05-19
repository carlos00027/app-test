class Peliculas {
  List<Pelicula> items = new List();
  Peliculas();
  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  String posterPath;

  Pelicula(
      {this.title,
      this.voteCount,
      this.id,
      this.video,
      this.voteAverage,
      this.posterPath});

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    posterPath = json['poster_path'];
  }

  getPosterImg() {
    if (posterPath == null) {
      return '';
    }
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }
}
