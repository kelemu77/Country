import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/favorites/favorites_cubit.dart';
import '../bloc/favorites/favorites_state.dart';
import '../widgets/country_card.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/error_widget.dart';
import '../widgets/empty_state_widget.dart';
import 'detail_page.dart';
import '../../injection/injection_container.dart';

class FavoritesPage extends StatefulWidget {
  final VoidCallback? onFavoriteChanged;

  const FavoritesPage({super.key, this.onFavoriteChanged});

  @override
  State<FavoritesPage> createState() => FavoritesPageState();
}

class FavoritesPageState extends State<FavoritesPage> {
  FavoritesCubit? _cubit;

  void refreshFavorites() {
    _cubit?.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _cubit = getIt<FavoritesCubit>();
        return _cubit!;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Favorites',
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A1A),
            ),
          ),
        ),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const LoadingShimmer();
            }

            if (state.error != null) {
              return ErrorDisplayWidget(
                message: state.error!,
                onRetry: () => context.read<FavoritesCubit>().loadFavorites(),
              );
            }

            if (state.favoriteCountries.isEmpty) {
              return const EmptyStateWidget(
                message: 'No favorite countries yet.\nStart adding some!',
                icon: Icons.favorite_border,
              );
            }

            return ListView.builder(
              itemCount: state.favoriteCountries.length,
              itemBuilder: (context, index) {
                final country = state.favoriteCountries[index];
                return CountryCard(
                  country: country,
                  isFavorite: true,
                  heroTagPrefix: 'favorites',
                  capital: state.capitals[country.code],
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          countryCode: country.code,
                          heroTagPrefix: 'favorites',
                        ),
                      ),
                    );
                    // Refresh favorites when returning from detail page
                    if (context.mounted) {
                      context.read<FavoritesCubit>().loadFavorites();
                    }
                  },
                  onFavoriteToggle: () async {
                    await context.read<FavoritesCubit>().removeFavorite(
                      country.code,
                    );
                    // Notify parent to refresh home page favorites
                    widget.onFavoriteChanged?.call();
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
