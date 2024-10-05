import 'package:flutter/material.dart';
import 'package:koyar/presentation/features/candidatesDetails/widgets/readMoreWidget.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class CompareSection extends StatelessWidget {
  const CompareSection({
    super.key,
    required this.title,
    required this.rows,
  });
  final String title;
  final List<List<String?>> rows;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: getBlackZodiak(fontsize: 20, fontweight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        Divider(
          color: AppColors.appDividerLineLightGray,
        ),
        ...rows.map((row) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ReadMoreText(
                      text: row.isNotEmpty ? (row[0] ?? 'nil') : 'nil',
                      style: getPlusJakartaSans(
                        textColor: AppColors.appSecondaryTextMediumGray,
                        fontsize: 12,
                        fontweight: FontWeight.w400,
                      ),
                      buttonStyle: TextStyle(
                        color: AppColors.appLinkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReadMoreText(
                      text: row.length > 1 ? (row[1] ?? 'nil') : 'nil',
                      style: getPlusJakartaSans(
                        textColor: AppColors.appSecondaryTextMediumGray,
                        fontsize: 12,
                        fontweight: FontWeight.w400,
                      ),
                      buttonStyle: TextStyle(
                        color: AppColors.appLinkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(height: 15)
      ],
    );
  }
}
