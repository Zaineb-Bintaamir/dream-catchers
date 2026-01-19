import 'package:dream_catchers/core/models/community_model.dart';
import 'package:dream_catchers/core/themes/app_images.dart';

class Communities {
  static final List<CommunityModel> allCommunities = [
    CommunityModel(
      id: '1',
      name: 'Single',
      image: AppImages.singleImage,
      description: 'This community is for advice about being single',
    ),
    CommunityModel(
      id: '2',
      name: 'Friendship',
      image: AppImages.friendshipImage,
      description: 'This community is for advice about friendship',
    ),
    CommunityModel(
      id: '3',
      name: 'Dating',
      image: AppImages.datingImage,
      description: 'This community is for advice about dating',
    ),
    CommunityModel(
      id: '4',
      name: 'Romantic Relationship',
      image: AppImages.romanticRelationshipImage,
      description: 'This community is for advice about romantic relationships',
    ),
    CommunityModel(
      id: '5',
      name: 'Marriage',
      image: AppImages.marriageImage,
      description: 'This community is for advice about marriage',
    ),
    CommunityModel(
      id: '6',
      name: 'Parenthood',
      image: AppImages.parenthoodImage,
      description: 'This community is for advice about parenthood',
    ),
  ];
}
