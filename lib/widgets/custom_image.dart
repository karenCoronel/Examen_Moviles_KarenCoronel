import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String posterPath;
  const CustomImage({ super.key, required this.posterPath });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: FadeInImage(
        placeholder: AssetImage('assets/images/loading.gif'), 
        image: NetworkImage(posterPath),
        ),
    );
  }
}