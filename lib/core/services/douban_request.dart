import '../model/movie_model.dart';
import 'http_request.dart';
import 'config.dart';

class GLDounbanRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async {
    final movieUrl = 'https://douban-api.uieee.com/v2/movie/top250?start=$start&count=${DoubanConfig.MOVIE_COUNT}';

    final response = await HttpRequest.request(movieUrl);
    final subjects = response['subjects'];

    List<MovieItem> movies = [];
    for(var sub in subjects){
      movies.add(MovieItem.fromMap(sub));
    }
    return movies;
  }
}