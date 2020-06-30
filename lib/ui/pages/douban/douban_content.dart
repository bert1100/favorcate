import 'package:favorcate/core/model/movie_model.dart';
import 'package:favorcate/core/services/douban_request.dart';
import 'package:favorcate/ui/pages/douban/douban_movie_item.dart';
import 'package:flutter/material.dart';

class GLDoubanContent extends StatefulWidget {
  @override
  _GLDoubanContentState createState() => _GLDoubanContentState();
}

class _GLDoubanContentState extends State<GLDoubanContent> {
  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();

    GLDounbanRequest.requestMovieList(0).then((res) {
      setState(() {
        movies.addAll(res);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (ctx, index) {
        return GLDounbanMovieItem(movies[index]);
    });
  }
}
