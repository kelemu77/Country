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
import '../../core/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  final VoidCallback? onThemeToggle;

  const HomePage({super.key, this.onThemeToggle});

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
        backgroundColor: AppColors.getBackground(context),
        appBar: AppBar(
          backgroundColor: AppColors.getSurface(context),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Countries',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              height: 23 / 18, // line-height: 23px / font-size: 18px = 1.277...
              letterSpacing: 0,
              color: AppColors.getPrimaryText(context),
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            // Theme toggle button
            if (widget.onThemeToggle != null)
              Builder(
                builder: (context) {
                  final isDark =
                      Theme.of(context).brightness == Brightness.dark;
                  return IconButton(
                    icon: Icon(
                      isDark ? Icons.light_mode : Icons.dark_mode,
                      color: AppColors.getIconColor(context),
                      size: 24.sp,
                    ),
                    onPressed: widget.onThemeToggle,
                    tooltip: isDark
                        ? 'Switch to light mode'
                        : 'Switch to dark mode',
                  );
                },
              ),
            // Sort menu button
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return PopupMenuButton<SortOption>(
                  icon: Icon(
                    Icons.sort,
                    color: AppColors.getIconColor(context),
                    size: 24.sp,
                  ),
                  onSelected: (SortOption option) {
                    context.read<HomeCubit>().setSortOption(option);
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SortOption>>[
                        PopupMenuItem<SortOption>(
                          value: SortOption.none,
                          child: Row(
                            children: [
                              if (state.sortOption == SortOption.none)
                                Icon(
                                  Icons.check,
                                  size: 20.sp,
                                  color: AppColors.getCheckIcon(context),
                                )
                              else
                                SizedBox(width: 20.sp),
                              SizedBox(width: 8.w),
                              Text('No Sort'),
                            ],
                          ),
                        ),
                        const PopupMenuDivider(),
                        PopupMenuItem<SortOption>(
                          value: SortOption.nameAsc,
                          child: Row(
                            children: [
                              if (state.sortOption == SortOption.nameAsc)
                                Icon(
                                  Icons.check,
                                  size: 20.sp,
                                  color: AppColors.getCheckIcon(context),
                                )
                              else
                                SizedBox(width: 20.sp),
                              SizedBox(width: 8.w),
                              Text('Name (A-Z)'),
                            ],
                          ),
                        ),
                        PopupMenuItem<SortOption>(
                          value: SortOption.nameDesc,
                          child: Row(
                            children: [
                              if (state.sortOption == SortOption.nameDesc)
                                Icon(
                                  Icons.check,
                                  size: 20.sp,
                                  color: AppColors.getCheckIcon(context),
                                )
                              else
                                SizedBox(width: 20.sp),
                              SizedBox(width: 8.w),
                              Text('Name (Z-A)'),
                            ],
                          ),
                        ),
                        const PopupMenuDivider(),
                        PopupMenuItem<SortOption>(
                          value: SortOption.populationAsc,
                          child: Row(
                            children: [
                              if (state.sortOption == SortOption.populationAsc)
                                Icon(
                                  Icons.check,
                                  size: 20.sp,
                                  color: AppColors.getCheckIcon(context),
                                )
                              else
                                SizedBox(width: 20.sp),
                              SizedBox(width: 8.w),
                              Text('Population (Low to High)'),
                            ],
                          ),
                        ),
                        PopupMenuItem<SortOption>(
                          value: SortOption.populationDesc,
                          child: Row(
                            children: [
                              if (state.sortOption == SortOption.populationDesc)
                                Icon(
                                  Icons.check,
                                  size: 20.sp,
                                  color: AppColors.getCheckIcon(context),
                                )
                              else
                                SizedBox(width: 20.sp),
                              SizedBox(width: 8.w),
                              Text('Population (High to Low)'),
                            ],
                          ),
                        ),
                      ],
                );
              },
            ),
            SizedBox(width: 8.w),
          ],
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
                    color: AppColors.getHintText(context),
                    fontSize: 17.sp,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.getSearchIcon(context),
                    size: 20.sp,
                  ),
                  filled: true,
                  fillColor: AppColors.getSearchBackground(context),
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
                  color: AppColors.getPrimaryText(context),
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

    return LayoutBuilder(
      builder: (context, constraints) {
        // Use grid layout for tablets/web (width > 600)
        final isTablet = constraints.maxWidth > 600;
        final crossAxisCount = isTablet
            ? (constraints.maxWidth ~/ 300).clamp(2, 4)
            : 1;

        if (isTablet) {
          return GridView.builder(
            padding: EdgeInsets.all(16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 2.5,
            ),
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

        // List layout for mobile
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

    return SliverLayoutBuilder(
      builder: (context, constraints) {
        // Use grid layout for tablets/web (width > 600)
        final isTablet = constraints.crossAxisExtent > 600;
        final crossAxisCount = isTablet
            ? (constraints.crossAxisExtent ~/ 300).clamp(2, 4)
            : 1;

        if (isTablet) {
          return SliverPadding(
            padding: EdgeInsets.all(16.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 2.5,
              ),
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
            ),
          );
        }

        // List layout for mobile
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
      },
    );
  }
}
