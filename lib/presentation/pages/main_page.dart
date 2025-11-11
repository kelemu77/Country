import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_page.dart';
import 'favorites_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final GlobalKey<HomePageState> _homePageKey = GlobalKey<HomePageState>();
  final GlobalKey<FavoritesPageState> _favoritesPageKey =
      GlobalKey<FavoritesPageState>();

  void refreshHomeFavorites() {
    _homePageKey.currentState?.refreshFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(key: _homePageKey),
          FavoritesPage(
            key: _favoritesPageKey,
            onFavoriteChanged: refreshHomeFavorites,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: const Color(0xFFE0E0E0), width: 1.w),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
            // Refresh when switching tabs
            if (index == 0) {
              _homePageKey.currentState?.refreshFavorites();
            } else if (index == 1) {
              _favoritesPageKey.currentState?.refreshFavorites();
            }
          },
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: const Color(0xFF1A1A1A),
          unselectedItemColor: const Color(0xFF9E9E9E),
          selectedLabelStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 0 ? Icons.home : Icons.home_outlined,
                size: 24.sp,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 1 ? Icons.favorite : Icons.favorite_border,
                size: 24.sp,
              ),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
