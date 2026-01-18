import 'package:dream_catchers/core/models/comment_model.dart';

class CommentsData {
  static List<CommentModel> getCommentsForPost(String postId) {
    return [
      CommentModel(
        id: '1',
        userId: '1',
        userName: 'Melisa Thomas',
        userAvatar: 'https://i.pravatar.cc/150?img=1',
        timeAgo: '19h',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        likes: 802,
        dislikes: 802,
      ),
      CommentModel(
        id: '2',
        userId: '2',
        userName: 'Melisa Thomas',
        userAvatar: 'https://i.pravatar.cc/150?img=2',
        timeAgo: '19h',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        likes: 802,
        dislikes: 802,
      ),
    ];
  }
}
