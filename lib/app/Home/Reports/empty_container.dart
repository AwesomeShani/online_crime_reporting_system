import 'package:flutter/material.dart';

class EmptyContainer extends StatelessWidget {
  const EmptyContainer({
    Key key,
    this.title = 'Nothing Here',
    this.message = 'Add new Report ',
  }) : super(key: key);
  final String title;
  final String message;

   @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 28.0, color: Colors.black54),
          ),
          Text(
            message,
            style: TextStyle(fontSize: 18.0, color: Colors.black54),
          )
        ],
      ),
    );
  }
}
