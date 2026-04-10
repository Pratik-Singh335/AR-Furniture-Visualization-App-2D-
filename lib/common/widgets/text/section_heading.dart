import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class MSectionHeading extends StatelessWidget {
  final bool headingIsWhite;
  final EdgeInsetsGeometry padding;
  final String heading;
  final bool showActionButton;
  final String buttonText;
  final void Function()? onPress;
  const MSectionHeading({
    super.key,
    required this.heading,
    this.buttonText = 'View All',
    this.onPress,
    this.showActionButton = false,
    this.padding = const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
    this.headingIsWhite = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                heading,
                style: Theme.of(context).textTheme.headlineSmall!.apply(
                    color: headingIsWhite
                        ? white
                        : isDarkMode
                            ? white
                            : black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (showActionButton)
                TextButton(onPressed: onPress, child: Text(buttonText))
            ],
          ),
        ],
      ),
    );
  }
}
