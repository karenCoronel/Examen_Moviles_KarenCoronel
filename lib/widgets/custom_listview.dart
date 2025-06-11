import 'package:flutter/material.dart';
import 'package:movie_app/models/models.dart';

class CustomListView extends StatelessWidget {
  final List<Movie> movies;
  const CustomListView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Now Playing',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.purple,
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 230,
          width: double.infinity,
          child: ListView.builder(
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  'details',
                  arguments: movies[i],
                ),
                child: Container(
                  width: 120,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          fit: BoxFit.cover,
                          width: 120,
                          height: 150,
                          placeholder: AssetImage('assets/images/loading.gif'),
                          image: NetworkImage(movies[i].getPosterPath),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        movies[i].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Estreno: ${movies[i].releaseDate}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
