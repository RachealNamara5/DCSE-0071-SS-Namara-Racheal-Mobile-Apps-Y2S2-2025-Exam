import 'package:flutter/material.dart';

class MockupScreenOne extends StatelessWidget {
  const MockupScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover & Enjoy Your Favourite Movies"),
        backgroundColor: const Color.fromARGB(255, 18, 44, 65),
      ),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                
                _imageCard(
                  'assets/image1.jpg', 
                  'Lara Jean and Peter have just taken their romance from a lo',
                ),
                SizedBox(width: 10),
                
                _imageCard(
                  'assets/image2.jpg', 
                  'After being coerced into working for a crime boss,a yo',
                ),
                SizedBox(width: 10),
                
                _imageCard(
                  'assets/image3.jpg', 
                  'John Wick is on the run after killing the intern',
                ),
                SizedBox(width: 10,),
                _imageCard(
                  'assets/image4.jpg', 
                  'There  is no way out',
                ),
              ],
            ),
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

  Widget _imageCard(String imagePath, String description) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
