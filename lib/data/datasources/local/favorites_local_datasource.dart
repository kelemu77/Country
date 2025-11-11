import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class FavoritesLocalDataSource {
  Future<List<String>> getFavoriteCountryCodes();
  Future<void> addFavorite(String countryCode);
  Future<void> removeFavorite(String countryCode);
  Future<bool> isFavorite(String countryCode);
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  static const String _favoritesKey = 'favorite_countries';

  @override
  Future<List<String>> getFavoriteCountryCodes() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString(_favoritesKey);
    if (favoritesJson == null) {
      return [];
    }
    final List<dynamic> favorites = json.decode(favoritesJson);
    return favorites.cast<String>();
  }

  @override
  Future<void> addFavorite(String countryCode) async {
    final favorites = await getFavoriteCountryCodes();
    if (!favorites.contains(countryCode)) {
      favorites.add(countryCode);
      await _saveFavorites(favorites);
    }
  }

  @override
  Future<void> removeFavorite(String countryCode) async {
    final favorites = await getFavoriteCountryCodes();
    favorites.remove(countryCode);
    await _saveFavorites(favorites);
  }

  @override
  Future<bool> isFavorite(String countryCode) async {
    final favorites = await getFavoriteCountryCodes();
    return favorites.contains(countryCode);
  }

  Future<void> _saveFavorites(List<String> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_favoritesKey, json.encode(favorites));
  }
}

