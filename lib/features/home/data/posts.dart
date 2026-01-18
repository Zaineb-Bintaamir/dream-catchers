import 'package:dream_catchers/core/models/post_model.dart';

class PostsData {
  static List<PostModel> getPostsForCommunity(String communityId) {
    return [
      PostModel(
        id: '1',
        userId: '1',
        userName: 'Melisa Thomas',
        userAvatar: 'https://i.pravatar.cc/150?img=1',
        timeAgo: '1h',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
        likes: 802,
        dislikes: 0,
        comments: 802,
        shares: 802,
      ),
      PostModel(
        id: '2',
        userId: '2',
        userName: 'Sarah Johnson',
        userAvatar: 'https://i.pravatar.cc/150?img=5',
        timeAgo: '1h',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
        likes: 802,
        dislikes: 2,
        comments: 802,
        shares: 802,
      ),
      PostModel(
        id: '3',
        userId: '3',
        userName: 'Emily Davis',
        userAvatar: 'https://i.pravatar.cc/150?img=12',
        timeAgo: '19h',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
        likes: 802,
        dislikes: 10,
        comments: 802,
        shares: 802,
      ),
      PostModel(
        id: '4',
        userId: '4',
        userName: 'Michael Brown',
        userAvatar: 'https://i.pravatar.cc/150?img=15',
        timeAgo: '2h',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
        likes: 450,
        comments: 320,
        shares: 180,
        dislikes: 1,
      ),
      PostModel(
        id: '5',
        userId: '5',
        userName: 'Jessica Wilson',
        userAvatar: 'https://i.pravatar.cc/150?img=20',
        timeAgo: '5h',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
        likes: 1200,
        comments: 950,
        shares: 420,
        dislikes: 0,
      ),
    ];
  }
}
