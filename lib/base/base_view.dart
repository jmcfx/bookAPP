import 'package:bookapp/bookpage/book_url.dart';
import 'package:bookapp/homepage.dart/homepage_screen.dart';
import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: [
                Homepage(
                  onExplorePressed: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                ),
                const BookPage()
              ],
            ),
          ),
          const Divider(
            height: 5,
            thickness: 1.2,
          )
        ],
      ),
      //Navigation bar 
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.home),
            ),
            label: "Home",

          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.search),
            ),
            label: "Discover",
          )
        ],

        //  backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
