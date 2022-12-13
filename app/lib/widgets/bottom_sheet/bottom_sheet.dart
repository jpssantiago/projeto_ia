import 'package:flutter/material.dart';

void createBottomSheet({
  required BuildContext context,
  required String title,
  required Widget child,
  EdgeInsets? padding,
}) {
  Widget buildUpperRow() {
    Widget buildTitle() {
      return Expanded(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    Widget buildCloseButton() {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Icon(
          Icons.close,
          color: Colors.black.withOpacity(.5),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTitle(),
          buildCloseButton(),
        ],
      ),
    );
  }

  Widget buildSeparatorLine() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.black.withOpacity(.2),
    );
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildUpperRow(),
              buildSeparatorLine(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: child,
              ),
              Padding(padding: MediaQuery.of(context).viewInsets),
            ],
          ),
        ),
      );
    },
  );
}
