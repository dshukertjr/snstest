class PostData {
  PostData({
    this.name,
    this.date,
    this.text,
    this.userImageUrl,
    this.imageUrl,
    this.liked,
    this.comentCount,
    this.likeCount,
  });
  final String name;
  final String date;
  final String text;
  final String imageUrl;
  final String userImageUrl;
  bool liked;
  int likeCount;
  int comentCount;
}