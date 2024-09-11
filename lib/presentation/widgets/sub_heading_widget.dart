// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ditonton/common/constants.dart';
import 'package:flutter/material.dart';

class SubHeadlingWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  const SubHeadlingWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        TextButton(
          onPressed: onTap,
          child: Text("See More"),
        )
      ],
    );
  }
}
