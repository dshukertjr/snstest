import 'package:flutter/material.dart';
import 'package:snstest/model/postData.dart';
import 'package:snstest/view/widget/postCell.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final controller = TextEditingController();
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(labelText: '呟き'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.image),
                onPressed: () async {
                  var image =
                      await ImagePicker.pickImage(source: ImageSource.camera);
                  _image = image;

                  setState(() {});
                },
              )
            ],
          ),
          _image == null
              ? Container()
              : Image.file(
                  _image,
                  height: 200,
                ),
          RaisedButton(
            child: Text('投稿'),
            onPressed: () {
              print(controller.text);
            },
          )
        ],
      ),
    );
  }
}
