import 'package:flutter/material.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxWords;
  final TextStyle? style;
  final TextStyle? buttonStyle;

  const ReadMoreText({
    super.key,
    required this.text,
    this.maxWords = 30,
    this.style,
    this.buttonStyle,
  });

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final words = widget.text.split(' ');
    final needsReadMore = words.length > widget.maxWords;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _expanded ? widget.text : words.take(widget.maxWords).join(' ') + (needsReadMore ? '...' : ''),
          style: widget.style,
        ),
        if (needsReadMore)
          TextButton(
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            child: Text(
              _expanded ? 'Show Less' : 'Read More',
              style: getNormalZodiak( textColor: AppColors.appDangerButtonRed,fontsize: 13,fontweight: FontWeight.w500),
            ),
          ),
      ],
    );
  }
}