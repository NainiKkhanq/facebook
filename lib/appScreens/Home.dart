import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:thread/appScreens/favoriteScreen.dart';
import 'package:thread/appScreens/feedScreen.dart';
import 'package:thread/appScreens/postScreen.dart';
import 'package:thread/appScreens/profileScreen.dart';
import 'package:thread/appScreens/searchscreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
      int selectedIndex = 0;
    // We create this _pages and selectedIndex because we are using Bottom Navigation bar so we will show the
    // Selected page when someone will click on the bottom navigation bar icons
    // This _pages List will contain Widget
    /*
    So when we will show the actual data so we will create another class of widgets like we will create different
    class for Feed, Post, Favorite so these widget class will be saved in this list and on click of bottom
    navigation bar we will call these classes
     */
    PanelController panelController = PanelController();
     List<Widget>  pages = [];
  @override
  void initState() {
    // We assign classes to list there because  on postScreen we are passing panelController
    // because on close button we will close the slider
    pages = [
         
        const FeedScreen(),
        const SearchScreen(),
        PostScreen(panelController: panelController,),
        const FavoriteScreen(),
        const ProfileScreen(),
       
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(

      // Now in body we are telling to scaffold that show the Widgets from pages List
      // And show us the specific widget from the index (Index is saved in Selected index as per bottom navigation bar)
      // so when the index is 3 it shows Post 
      
      body: SlidingUpPanel(
        controller: panelController,
        minHeight: 0,
        maxHeight: MediaQuery.of(context).size.height *0.8,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25)
        ),
        panelBuilder: (sc) {
          // Here we return our Post Screen which will be show inside Sliders
          return  PostScreen(panelController: panelController,);
        },
        body: pages[selectedIndex],
      ),
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
         if(index ==2){
          panelController.isPanelOpen
          ? panelController.close():panelController.open();
         }else{
           setState(() {
            selectedIndex = index;
          });
         }
        },
        // Type is fixed it means that when we will scroll in list so it will always remain fixed like thread, Insta

        type: BottomNavigationBarType.fixed,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Feed"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Post"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ]),
    );
  }
}
