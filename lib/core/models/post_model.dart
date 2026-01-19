class PostModel {
  final String id;
  final String userId;
  final String? userName;
  final String? userAvatar;
  final String? timeAgo;
  final String? content;
  final String? title;
  final String? mediaUrl;
  final String? mediaType;
  final int likesCount;
  final int sharesCount;
  final int commentsCount;
  final double? trendingScore;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool? isLiked;

  PostModel({
    required this.id,
    required this.userId,
    this.title,
    this.userName,
    this.userAvatar,
    this.timeAgo,
    this.content,
    this.mediaUrl,
    this.mediaType,
    this.likesCount = 0,
    this.sharesCount = 0,
    this.commentsCount = 0,
    this.trendingScore,
    required this.createdAt,
    required this.updatedAt,
    this.isLiked,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      userName: json['user_name'] as String?,
      userAvatar: json['user_avatar'] as String?,
      timeAgo: json['time_ago'] as String?,
      content: json['content'] as String?,
      mediaUrl: json['media_url'] as String?,
      title: json['title'] as String?,
      mediaType: json['media_type'] as String?,
      likesCount: (json['likes_count'] as int?) ?? 0,
      sharesCount: (json['shares_count'] as int?) ?? 0,
      commentsCount: (json['comments_count'] as int?) ?? 0,
      trendingScore: (json['trending_score'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isLiked: json['is_liked'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'user_name': userName,
      'user_avatar': userAvatar,
      'time_ago': timeAgo,
      'content': content,
      'title': title,
      'media_url': mediaUrl,
      'media_type': mediaType,
      'likes_count': likesCount,
      'shares_count': sharesCount,
      'comments_count': commentsCount,
      'trending_score': trendingScore,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'is_liked': isLiked,
    };
  }
}
