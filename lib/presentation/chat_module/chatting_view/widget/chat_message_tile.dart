import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/color_constant.dart';

class ChatMessageTile extends StatelessWidget {
  final String text;
  final bool isSender;
  ChatMessageTile({required this.text, required this.isSender});

  final linkRegExp = RegExp(r'(?:(http|https|ftp|SalonSymphony)://[^\s]+)');

  final textSpans = <TextSpan>[];

  @override
  Widget build(BuildContext context) {
    // Split text into parts and identify links
    final matches = linkRegExp.allMatches(text);
    int start = 0;
    for (final match in matches) {
      final linkText = match.group(0); // Get the matched URL
      final beforeMatch = text.substring(start, match.start);
      start = match.end;

      // Add non-link text
      if (beforeMatch.isNotEmpty) {
        textSpans.add(TextSpan(
          text: beforeMatch,
          style: TextStyle(
            color: isSender ? Colors.white : Colors.black,
            fontSize: 17,
            fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
          ),
        ));
      }

      // Add link text as a clickable link
      textSpans.add(
        TextSpan(
          text: linkText,
          style: TextStyle(
            color: isSender? ColorConstant.whiteA700 : Color(0XFF7b68ee), // Customize link text color
            decoration: TextDecoration.underline,
            fontSize: 17,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              if (linkText!.contains('https://mysalonsymphony.com/')) {
                Utils.handleDeepLink(linkText);
              } else {
                // Open webview or perform other actions for non-matching links
                Utils.launchUrls(linkText);

              }
            },
        ),
      );
    }

    // Add any remaining non-link text
    final remainingText = text.substring(start);
    if (remainingText.isNotEmpty) {
      textSpans.add(TextSpan(
        text: remainingText,
        style: TextStyle(
          color: isSender ? Colors.white : Colors.black,
          fontSize: 17,
          fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
        ),
      ));
    }

    return Container(
      margin: isSender ? EdgeInsets.only(left: 50) : EdgeInsets.only(right: 50),
      decoration: BoxDecoration(
        color: isSender ? Color(0xff7B68EE) : Color(0xffF0F0F0),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
      child: RichText(
        text: TextSpan(children: textSpans),
      ),
    );
  }
}
