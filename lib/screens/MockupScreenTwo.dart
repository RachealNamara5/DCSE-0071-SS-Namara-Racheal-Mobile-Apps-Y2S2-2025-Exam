import 'package:flutter/material.dart';

class MockupScreenOne extends StatelessWidget {
  const MockupScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover & Enjoy Your Favourite Movies"),
        backgroundColor: const Color.fromARGB(255, 31, 61, 86),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _imageCard(
            '',
            'Lara Jean and Peter have just taken their romance to the next level...',
          ),
          _imageCard(
            'https://picsum.photos/id/238/200/200',
            'After being coerced into working for a crime boss, he tries to escape...',
          ),
          _imageCard(
            'https://picsum.photos/id/239/200/200',
            'John Wick is on the run after killing an international crime boss...',
          ),
          _imageCard(
            'https://picsum.photos/id/240/200/200',
            'There is no way out.',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        onTap: (int index) {
          print("Tapped on $index");
        },
      ),
    );
  }

  Widget _imageCard(String imageUrl, String description) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image, size: 100);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                description,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


