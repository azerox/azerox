import 'package:azerox/app/models/post.dart';
import 'package:flutter/material.dart';

class PostButtonWidget extends StatefulWidget {
  final String? image;
  final VoidCallback onPressed;
  final Color? colorImg;
  final Icon? icon;
  final Color color;
  final bool isLikeBtn;
  final Post? post;

  const PostButtonWidget({
    Key? key,
    this.image,
    required this.onPressed,
    this.colorImg,
    this.icon,
    this.color = const Color(0XFFEFEFEF),
    this.isLikeBtn = false,
    this.post,
  }) : super(key: key);

  @override
  State<PostButtonWidget> createState() => _PostButtonWidgetState();
}

class _PostButtonWidgetState extends State<PostButtonWidget> {
  generateColor() {
    if (widget.isLikeBtn && widget.post!.isFavorite) {
      return const Color(0XFFEFEFEF);
    }
    // if (widget.post!.isFavorite) {
    //   return const Color(0XFFEFEFEF);
    // }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: generateColor(),
        ),
        onPressed: () {
          widget.onPressed();
          widget.post?.isFavorite = !widget.post!.isFavorite;
          setState(() {});
        },
        child: widget.image == null
            ? widget.icon!
            : Image.asset(
                widget.image ?? '',
                color: widget.colorImg,
              ),
      ),
    );
  }
}
