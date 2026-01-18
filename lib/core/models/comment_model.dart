class CommentModel {
  final String id;
  final String userId;
  final String userName;
  final String userAvatar;
  final String timeAgo;
  final String content;
  final int likes;
  final int dislikes;

  CommentModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userAvatar,
    required this.timeAgo,
    required this.content,
    required this.likes,
    required this.dislikes,
  });
}
