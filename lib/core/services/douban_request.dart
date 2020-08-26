import '../model/movie_model.dart';
import 'http_request.dart';
import 'config.dart';

class GLDounbanRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async {
    final movieUrl = 'http://t.yushu.im/v2/movie/top250?start=$start&count=${DoubanConfig.MOVIE_COUNT}';
//    以下失效
//    final movieUrl = 'http://douban-api.uieee.com/v2/movie/top250?start=$start&count=${DoubanConfig.MOVIE_COUNT}';

    final response = await HttpRequest.request(movieUrl);

    List<MovieItem> movies = [];
    final subjects = response != null ? response['subjects'] as List<dynamic> : [];
    for(var sub in subjects){
      movies.add(MovieItem.fromMap(sub));
    }
    return movies;
  }
}