import 'package:flutter/material.dart';

class GLStarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;

  final Widget unselectedImage;
  final Widget selectedImage;

  GLStarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget unselectedImage,
    Widget selectedImage
  }): this.unselectedImage = unselectedImage ?? Icon(Icons.star_border, color: unselectedColor, size: size,),
        this.selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size,);

  @override
  _GLStarRatingState createState() => _GLStarRatingState();
}

class _GLStarRatingState extends State<GLStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(mainAxisSize: MainAxisSize.min, children: buildUnselectedStar()),
        Row(mainAxisSize: MainAxisSize.min, children: buildSelectedStar())
      ],
    );
  }

  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

  List<Widget> buildSelectedStar() {
    // 1.创建stars
    List<Widget> stars = [];
    final star = widget.selectedImage;

    // 2.构建满填充的star
    double oneValue = widget.maxRating / widget.count;  // 每个星星代表的分数
    int fullCount = (widget.rating / oneValue).floor(); // 满的星星个数
    for(int i = 0; i < fullCount; i++){
      stars.add(star);
    }

    // 3.构建部分填充的star
    // (widget.rating / oneValue) 多少颗星 3.5
    //  - fullCount 减去满星之后剩下的星 3.5-3=0.5
    // * widget.size 单个星的宽度 * 0.5颗星，就是0.5颗星所占的宽度
    double leftWidth = ((widget.rating / oneValue) - fullCount) * widget.size;
    final halfStar = ClipRect(
      clipper: GLStarClipper(leftWidth),
      child: star,
    );
    stars.add(halfStar);

    if(stars.length > widget.count){
      return stars.sublist(0, widget.count);
    }

    return stars;
  }
}

class GLStarClipper extends CustomClipper<Rect> {
  double width;
  GLStarClipper(this.width);

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(GLStarClipper oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper.width != this.width;
  }
}