import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/home/home_cubit.dart';
import '../bloc/home/home_state.dart';
import '../widgets/country_card.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/error_widget.dart';
import '../widgets/empty_state_widget.dart';
import 'detail_page.dart';
import '../../injection/injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  HomeCubit? _cubit;

  void refreshFavorites() {
    _cubit?.loadFavorites();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _cubit = getIt<HomeCubit>();
        return _cubit!;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Countries',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              height: 23 / 18, // line-height: 23px / font-size: 18px = 1.277...
              letterSpacing: 0,
              color: const Color(0xFF1A1A1A),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final searchBar = Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search for a country',
                  hintStyle: TextStyle(
                    color: const Color(0xFF9E9E9E),
                    fontSize: 17.sp,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: const Color(0xFF757575),
                    size: 20.sp,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                ),
                style: TextStyle(
                  fontSize: 17.sp,
                  color: const Color(0xFF1A1A1A),
                ),
                onChanged: (query) {
                  context.read<HomeCubit>().onSearchChanged(query);
                },
              ),
            );

            // If search is active, make search bar fixed
            if (state.searchQuery.isNotEmpty) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                    child: searchBar,
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () => context.read<HomeCubit>().refresh(),
                      child: _buildScrollableBody(context, state),
                    ),
                  ),
                ],
              );
            }

            // If search is empty, search bar is scrollable
            return RefreshIndicator(
              onRefresh: () => context.read<HomeCubit>().refresh(),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: 8.h),
                        searchBar,
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                  _buildBody(context, state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildScrollableBody(BuildContext context, HomeState state) {
    if (state.isLoading && state.countries.isEmpty) {
      return const LoadingShimmer();
    }

    if (state.error != null && state.countries.isEmpty) {
      return ErrorDisplayWidget(
        message: state.error!,
        onRetry: () => context.read<HomeCubit>().loadCountries(),
      );
    }

    if (state.countries.isEmpty) {
      return const EmptyStateWidget(message: 'No countries found.');
    }

    return ListView.builder(
      itemCount: state.countries.length,
      itemBuilder: (context, index) {
        final country = state.countries[index];
        return CountryCard(
          country: country,
          isFavorite: state.isFavorite(country.code),
          heroTagPrefix: 'home',
          hidePopulation: state.searchQuery.isNotEmpty,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  countryCode: country.code,
                  heroTagPrefix: 'home',
                ),
              ),
            );
            // Refresh favorites when returning from detail page
            if (context.mounted) {
              context.read<HomeCubit>().loadFavorites();
            }
          },
          onFavoriteToggle: () {
            context.read<HomeCubit>().toggleFavorite(country.code);
          },
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, HomeState state) {
    if (state.isLoading && state.countries.isEmpty) {
      return const SliverFillRemaining(child: LoadingShimmer());
    }

    if (state.error != null && state.countries.isEmpty) {
      return SliverFillRemaining(
        child: ErrorDisplayWidget(
          message: state.error!,
          onRetry: () => context.read<HomeCubit>().loadCountries(),
        ),
      );
    }

    if (state.countries.isEmpty) {
      return const SliverFillRemaining(
        child: EmptyStateWidget(message: 'No countries found.'),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final country = state.countries[index];
        return CountryCard(
          country: country,
          isFavorite: state.isFavorite(country.code),
          heroTagPrefix: 'home',
          hidePopulation: state.searchQuery.isNotEmpty,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  countryCode: country.code,
                  heroTagPrefix: 'home',
                ),
              ),
            );
            // Refresh favorites when returning from detail page
            if (context.mounted) {
              context.read<HomeCubit>().loadFavorites();
            }
          },
          onFavoriteToggle: () {
            context.read<HomeCubit>().toggleFavorite(country.code);
          },
        );
      }, childCount: state.countries.length),
    );
  }
}
