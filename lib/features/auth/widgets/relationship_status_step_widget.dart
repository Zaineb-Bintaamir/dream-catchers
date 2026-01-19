import 'package:dream_catchers/features/auth/data/relationship_statuses.dart';
import 'package:dream_catchers/features/auth/widgets/signup_heading.dart';
import 'package:dream_catchers/features/auth/widgets/signup_select_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RelationshipStatusStepWidget extends StatelessWidget {
  final RxString selectedRelationshipStatus;
  final Function(String) onSelectRelationshipStatus;

  const RelationshipStatusStepWidget({
    super.key,
    required this.selectedRelationshipStatus,
    required this.onSelectRelationshipStatus,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignupHeading(heading: "What's your relationship status?"),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: RelationshipStatuses.allRelationshipStatuses.length,
            itemBuilder: (context, index) {
              final String relationshipStatus =
                  RelationshipStatuses.allRelationshipStatuses[index];
              return Obx(
                () => SignupSelectOptionWidget(
                  text: relationshipStatus,
                  isSelected:
                      selectedRelationshipStatus.value == relationshipStatus,
                  onSelect: () =>
                      onSelectRelationshipStatus(relationshipStatus),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
