import 'package:flutter/material.dart';
import 'package:snstest/model/postData.dart';
import 'package:snstest/view/widget/postCell.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage(this.postData);
  final PostData postData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿'),
      ),
      body: Row(
        children: <Widget>[
          Hero(
            tag: postData,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: postData.userImageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(postData.name,
              style: TextStyle(
                fontSize: 20,
              )),
        ],
      ),
    );
  }
}
