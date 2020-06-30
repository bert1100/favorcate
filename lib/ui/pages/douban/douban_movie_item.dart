import 'package:favorcate/core/model/movie_model.dart';
import 'package:favorcate/ui/widgets/dash_line.dart';
import 'package:favorcate/ui/widgets/star_rating.dart';

import 'package:flutter/material.dart';

class GLDounbanMovieItem extends StatelessWidget {
  final MovieItem movie;

  GLDounbanMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 8, color: Color(0xffeeeeee))
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(),
          SizedBox(height: 8,),
          buildContent(),
          SizedBox(height: 8,),
          buildFooter(),
        ],
      ),
    );
  }

  // 1.头部
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(4)
      ),
      child: Text(
        "NO.${movie.rank}",
        style: TextStyle(fontSize: 18, color: Color(0xff999999)),
      ),
    );
  }

  // 2.内容
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentImage(),
        SizedBox(width: 8,),
        Expanded(
          child: IntrinsicHeight( // 让Row里面的子Widget高度相同
            child: Row(
              children: <Widget>[
                buildContentInfo(),
                SizedBox(width: 8,),
                buildContentLine(),
                SizedBox(width: 8,),
                buildContentWish(),
              ],
            ),
          ),
        )
      ],
    );
  }

  // 图片
  Widget buildContentImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(movie.imageUrl, height: 150,)
    );
  }

  // 电影信息
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContentInfoTitle(),
          SizedBox(height: 6,),
          buildContentInfoRate(),
          SizedBox(height: 6,),
          buildContentInfoDesc()
        ],
      ),
    );
  }

  // 标题
  Widget buildContentInfoTitle() {
    // Text.rich TextSpan可让图文混排换行
    return Text.rich(
      TextSpan(
          children: [
            WidgetSpan(
                child: Icon(Icons.play_circle_outline, color: Colors.pink, size: 24,)
            ),
            TextSpan(
                text: movie.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)
            ),
            TextSpan(
                text: "(${movie.playDate})",
                style: TextStyle(fontSize: 18, color: Colors.grey)
            )
          ]
      ),
    );
  }

  // 评分
  Widget buildContentInfoRate() {
    return Row(
      children: <Widget>[
        GLStarRating(rating: movie.rating, size: 20,),
        SizedBox(width: 6,),
        Text("${movie.rating}", style: TextStyle(fontSize: 16),)
      ],
    );
  }

  // 题材，导演，演员
  Widget buildContentInfoDesc() {
    final genresStr = movie.genres.join(' ');
    final directorStr = movie.director.name;
    final actorStr = movie.casts.map((item) => item.name).join(' ');

    return Text(
      "$genresStr / $directorStr / $actorStr",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  // 分割线
  Widget buildContentLine() {
    return Container(
//      height: 110,
      child: GLDashLine(
        axis: Axis.vertical,
        dashWidth: 0.5,
        dashHeight: 6,
        color: Colors.grey,
      ),
    );
  }

  // 想看
  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/douban/wish.png', width: 30,),
          Text('想看', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 235, 170, 60),))
        ],
      ),
    );
  }

  // 3.尾部
  Widget buildFooter(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color(0xffeeeeee),
          borderRadius: BorderRadius.circular(4)
      ),
      child: Text(movie.originalTitle, style: TextStyle(fontSize: 14, color: Color(0xff666666)),),
    );
  }
}
