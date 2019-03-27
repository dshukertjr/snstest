import 'package:flutter/material.dart';
import 'package:snstest/model/postData.dart';
import 'package:snstest/view/widget/postCell.dart';
import 'package:snstest/view/page/postPage.dart';

class HomePage extends StatelessWidget {
  List<PostData> data = [
    PostData(
      name: "武者",
      date: "2019/03/27",
      text: 'aaa',
      imageUrl:
          "https://i.pinimg.com/originals/c1/0a/b2/c10ab2e2e2eb2f6471f1db5b76d6278d.jpg",
      userImageUrl:
          "https://ichef.bbci.co.uk/news/660/cpsprodpb/FDD6/production/_100728946_catrelax.jpg",
          likeCount:45,
          comentCount:77,
          liked: true,

    ),
    PostData(
      name: "武者",
      date: "2019/03/27",
      text: 'aaa',
      imageUrl:
          "https://static01.nyt.com/images/2016/10/21/nytnow/21adult-money/21adult-money-articleLarge.jpg?quality=75&auto=webp&disable=upscale",
      userImageUrl:
          "https://ichef.bbci.co.uk/news/660/cpsprodpb/FDD6/production/_100728946_catrelax.jpg",
    likeCount:45,
          comentCount:77,
          liked: false,
),
    PostData(
      name: "武者",
      date: "2019/03/27",
      text: 'aaa',
      imageUrl:
          "https://cdn.britannica.com/s:500x1000/94/152294-131-DC3E25DB.jpg",
      userImageUrl:
          "https://ichef.bbci.co.uk/news/660/cpsprodpb/FDD6/production/_100728946_catrelax.jpg",
    likeCount:45,
          comentCount:77,
          liked: true,
),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ようこそ'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCell(postData: data[index]);
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(decoration: BoxDecoration(color: Colors.blue),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipOval(
                    child: Image.network(
                      "http://kagakusuru.net/wp-content/uploads/2016/04/th3_32280_original-1.jpg",
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text('織田信長'),
                  Text('900投稿')
                ],
        
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('プロフィール'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostPage()),
                );
              },
              leading: Icon(Icons.settings),
              title: Text('設定'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //新しいページに飛ぶコード
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostPage()),
          );
        },
      ),
    );
  }
}
