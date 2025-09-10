import 'package:flutter/material.dart';

class BuildItemWidget extends StatelessWidget {
  const BuildItemWidget({
    super.key,
    required this.name,
    required this.message,
    required this.date,
    required this.photo,
  });

  final String name;
  final String message;
  final String date;
  final String photo;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 50,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(photo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(name),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Expanded(
                      child: Text(
                        message,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    CircleAvatar(radius: 2, backgroundColor: Colors.black),
                    Text("$date\$"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
