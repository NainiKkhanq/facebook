import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    // We create this _pages and selectedIndex because we are using Bottom Navigation bar so we will show the
    // Selected page when someone will click on the bottom navigation bar icons
    // This _pages List will contain Widget
    List<Widget> _pages = [
        const Center(child: Text("Home"),),
        const Center(child: Text("Feed"),),
        const Center(child: Text("Post"),),
        const Center(child: Text("Favorite"),),
        const Center(child: Text("Profile"),),
    ];
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // Selected Index Mean which _list view we are showing or which Icon is selected by user
        // BY default we set it to Home but when user will select search, messages icons from bottom navigation
        // so we will change the selected index as per the need
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // on tap function of every item click
        onTap: (index) {
          // By Default Bottom Navigation bar has index according to the Items that we created so in this case
          // we created 5 items so index will 5 so we save the  bottom navigation index to selected
          // So once user will click on 5th index profile selected index value will be change to 5
          selectedIndex = index;
        },
        // Type is fixed it means that when we will scroll in list so it will always remain fixed like thread, Insta
        
        type: BottomNavigationBarType.fixed,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Post"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ]),
    );
  }
}
