import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/detail/detail_cubit.dart';
import '../bloc/detail/detail_state.dart';
import '../widgets/error_widget.dart';
import '../widgets/detail_loading_shimmer.dart';
import '../../core/utils/formatters.dart';
import '../../injection/injection_container.dart';

class DetailPage extends StatelessWidget {
  final String countryCode;
  final String? heroTagPrefix;

  const DetailPage({
    super.key,
    required this.countryCode,
    this.heroTagPrefix,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DetailCubit>(param1: countryCode),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: const Color(0xFF1A1A1A), size: 24.sp),
            onPressed: () => Navigator.pop(context),
          ),
          title: BlocBuilder<DetailCubit, DetailState>(
            builder: (context, state) {
              return Text(
                state.countryDetails?.name.common ?? 'Loading...',
                style: TextStyle(
                  color: const Color(0xFF1A1A1A),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              );
            },
          ),
          actions: [
            BlocBuilder<DetailCubit, DetailState>(
              builder: (context, state) {
                return IconButton(
                  icon: Icon(
                    state.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: state.isFavorite ? Colors.red : const Color(0xFF1A1A1A),
                    size: 24.sp,
                  ),
                  onPressed: () async {
                    await context.read<DetailCubit>().toggleFavorite();
                  },
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<DetailCubit, DetailState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const DetailLoadingShimmer();
            }

            if (state.error != null) {
              return ErrorDisplayWidget(
                message: state.error!,
                onRetry: () => context.read<DetailCubit>().retry(),
              );
            }

            final country = state.countryDetails;
            if (country == null) {
              return const Center(child: Text('No data available'));
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Flag section with light teal background
                  Container(
                    width: double.infinity,
                    color: const Color(0xFFE0F7FA),
                    padding: EdgeInsets.all(16.w),
                    child: Hero(
                      tag: 'country_flag_${countryCode}_${heroTagPrefix ?? 'home'}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.network(
                          country.flags.png ?? country.flags.svg ?? '',
                          width: double.infinity,
                          height: 200.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity,
                              height: 200.h,
                              color: Colors.grey[300],
                              child: Icon(Icons.flag, size: 64.sp),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  // Content section
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Key Statistics
                        Text(
                          'Key Statistics',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1A1A1A),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        _buildStatRow('Area', Formatters.formatArea(country.area)),
                        SizedBox(height: 12.h),
                        _buildStatRow(
                          'Population',
                          Formatters.formatPopulationDetailed(country.population),
                        ),
                        SizedBox(height: 12.h),
                        _buildStatRow('Region', country.region ?? 'N/A'),
                        SizedBox(height: 12.h),
                        _buildStatRow('Sub Region', country.subregion ?? 'N/A'),
                        // Timezone section
                        if (country.timezones != null &&
                            country.timezones!.isNotEmpty) ...[
                          SizedBox(height: 24.h),
                          Text(
                            'Timezone',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1A1A1A),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Wrap(
                            spacing: 12.w,
                            runSpacing: 12.h,
                            children: country.timezones!.map((timezone) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 12.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                    color: const Color(0xFFE0E0E0),
                                    width: 1.w,
                                  ),
                                ),
                                child: Text(
                                  timezone,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xFF1A1A1A),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            color: const Color(0xFF757575),
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFF1A1A1A),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
