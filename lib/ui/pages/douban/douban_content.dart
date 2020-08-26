import 'package:favorcate/core/model/movie_model.dart';
import 'package:favorcate/core/services/douban_request.dart';
import 'package:favorcate/ui/pages/douban/douban_movie_item.dart';
import 'package:flutter/material.dart';

class GLDoubanContent extends StatefulWidget {
  @override
  _GLDoubanContentState createState() => _GLDoubanContentState();
}

class _GLDoubanContentState extends State<GLDoubanContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('豆瓣初始化');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GLDounbanRequest.requestMovieList(0),
      builder: (ctx, snapshot) {
        if(snapshot.hasError) return Center(child: Text('请求失败'),);
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);

        final List<MovieItem> movies = snapshot.data;
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (ctx, index) {
            return GLDounbanMovieItem(movies[index]);
          }
        );
      },
    );
  }
}
