import 'package:flutter/material.dart';
import 'package:snstest/model/postData.dart';
import 'package:snstest/view/page/profilePage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostCell extends StatefulWidget {
  const PostCell({
    Key key,
    this.postData,
  }) : super(key: key);

  final PostData postData;

  @override
  _PostCellState createState() => _PostCellState();
}

class _PostCellState extends State<PostCell> {
  Widget okbutton(bool isComent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        child: Row(
          children: <Widget>[
            Icon(
              isComent
                  ? Icons.chat_bubble_outline
                  : widget.postData.liked
                      ? Icons.favorite
                      : Icons.favorite_border,
              color: !isComent && widget.postData.liked
                  ? Colors.pink
                  : Colors.grey,
            ),
            Text(
              "${isComent ? widget.postData.comentCount : widget.postData.likeCount}",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        onTap: () {
          if (isComent) {
          } else {
            if (widget.postData.liked) {
              widget.postData.likeCount--;
            } else {
              widget.postData.likeCount++;
            }
            widget.postData.liked = !widget.postData.liked;

            setState(() {});
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {
                  //新しいページに飛ぶコード
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(widget.postData)),
                  );
                },
                child: Hero(
                  tag: widget.postData,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: widget.postData.userImageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                widget.postData.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              widget.postData.date,
              style: TextStyle(
                color: Color(0xff999999),
                fontSize: 12,
              ),
            )
          ],
        ),
        Text(
          widget.postData.text,
          style: TextStyle(fontSize: 18),
        ),
        CachedNetworkImage(
          imageUrl: widget.postData.imageUrl,
          placeholder: (BuildContext context, String url) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            okbutton(true),
            okbutton(false),
          ],
        )
      ],
    );
  }
}
