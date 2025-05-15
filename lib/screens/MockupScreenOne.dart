
import 'package:flutter/material.dart';

class MockupScreenOne extends StatefulWidget {
  const MockupScreenOne({Key? key}) : super(key: key);

  @override
  _MockupScreenState createState() => _MockupScreenState();
}

class _MockupScreenState extends State<MockupScreenOne> {
  int _selectedIndex = 0;
  

  final List<String> _tabs = ['Popular', 'Upcoming', 'Now Playing'];

  
  final List<Map<String, dynamic>> _movies = [
    {
      'title': 'To All the Boys: P.S. I Still Love You (2019)',
      'duration': '1h 35m',
      'genres': 'Romance, Comedy',
      'description': 'Lara Jean and Peter have just taken their romance from a lo...',
      'rating': 7.2,
      'imageUrl': 'https://m.media-amazon.com/images/M/MV5BZjMwNDQ4NzMtOThmZi00NmMyLThkMWItMTA4YmMwNWI5NzAwXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',
    },
    {
      'title': 'Baby Driver',
      'duration': '1h 53m',
      'genres': 'Car Action, Crime, Drama',
      'description': 'After being coerced into working for a crime boss, a yo...',
      'rating': 7.2,
      'imageUrl': 'https://m.media-amazon.com/images/M/MV5BMjM3MjQ1MzkxNl5BMl5BanBnXkFtZTgwODk1ODgyMjI@._V1_.jpg',
    },
    {
      'title': 'John Wick',
      'duration': '1h 41m',
      'genres': 'Action, Crime, Thriller',
      'description': 'John Wick is on the run after killing a member of the intern...',
      'rating': 7.2,
      'imageUrl': 'https://m.media-amazon.com/images/M/MV5BMTU2NjA1ODgzMF5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_.jpg',
    },
    {
      'title': 'Exit',
      'duration': '1h 43m',
      'genres': 'Action, Comedy',
      'description': 'Yong-nam (Jo Jung-suk) uses rope...',
      'rating': 7.2,
      'imageUrl': 'https://m.media-amazon.com/images/M/MV5BYTNkMTEyMDEtY2Y0ZS00ZDQ0LTk0YzMtNGM0ODYyNWJhOTY4XkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 115, 120, 159),
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Tmb',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Spacer(),
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 16),
            
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF343B71),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Discover & Enjoy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Your Favourite Movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Category tabs
                Row(
                  children: List.generate(
                    _tabs.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: _selectedIndex == index
                              ? const Color(0xFF3CB4E5)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _tabs[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                                _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Movie list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _movies.length,
              itemBuilder: (context, index) {
                final movie = _movies[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  height: 110,
                  child: Row(
                    children: [
                      // Movie poster
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          movie['imageUrl'],
                          width: 80,
                          height: 110,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 80,
                              height: 110,
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(Icons.movie, color: Colors.grey),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      
                      // Movie details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              movie['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${movie['duration']} • ${movie['genres']}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              movie['description'],
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      
                      // Rating 
                      if (movie['rating'] != null)
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.amber[100],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              movie['rating'].toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
