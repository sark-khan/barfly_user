import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearchActive = false;

  void _toggleSearch() {
    setState(() {
      _isSearchActive = !_isSearchActive;
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return PopScope(
        canPop: true,
        child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: FloatingActionButton(
                backgroundColor: Colors.blueGrey[800],
                onPressed: () => _onItemTapped(1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.local_activity,
                          color:
                              _selectedIndex == 0 ? Colors.white : Colors.grey),
                      onPressed: () => _onItemTapped(0),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      icon: Icon(Icons.home,
                          color:
                              _selectedIndex == 1 ? Colors.white : Colors.grey),
                      onPressed: () => _onItemTapped(1),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      icon: Icon(Icons.person,
                          color:
                              _selectedIndex == 2 ? Colors.white : Colors.grey),
                      onPressed: () => _onItemTapped(2),
                    ),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.08142, right: screenWidth * 0.08396),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.04812,
                  ),
                  _isSearchActive
                      ? Container(
                          margin: const EdgeInsets.only(top: 10, left: 0),
                          width: screenWidth,
                          height: screenHeight * 0.03755,
                          child: TextField(
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {},
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: _toggleSearch,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                              ),
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              fillColor: APP_COLORS.searchInputBackgroundColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: _toggleSearch,
                          child: Container(
                            width: 32,
                            height: 32,
                            margin: EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              color: APP_COLORS.searchButtonBackgroundColor,
                              borderRadius: BorderRadius.circular(
                                  12.0), // Adjust the radius as needed
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.search,
                                color: APP_COLORS.searchIconColor,
                                size: 17,
                              ),
                            ),
                          ),
                        ),
                  _isSearchActive
                      ? SizedBox(
                          height: screenHeight * 0.04577,
                        )
                      : SizedBox(
                          height: screenHeight * 0.04577,
                        ),
                  _isSearchActive
                      ? const SizedBox(
                          height: 0,
                        )
                      : Container(
                          padding: const EdgeInsets.only(left: 16),
                          height: screenHeight * 0.0704,
                          width: screenWidth * 0.623,
                          child: const Text(APP_TEXT.Favorites,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "Helvetica",
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ))),
                  SizedBox(
                    height: 13,
                  ),
                  FavorotiesButton(
                    text: "Zurich",
                    onPressed: () => {},
                    widthofButton: screenWidth * 0.834,
                    heightofButton: 0.197 * screenHeight,
                    borderRadius: 20,
                    isLoading: _isSearchActive,
                  )
                ],
              ),
            )));
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onTapHome;
  final VoidCallback onTapActivity;
  final VoidCallback onTapPerson;

  const CustomFloatingActionButton({
    Key? key,
    required this.onTapHome,
    required this.onTapActivity,
    required this.onTapPerson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[800],
              heroTag: 'activity',
              onPressed: onTapActivity,
              child: Icon(Icons.local_activity, color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[800],
              heroTag: 'home',
              onPressed: onTapHome,
              child: Icon(Icons.home, color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[800],
              heroTag: 'person',
              onPressed: onTapPerson,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
