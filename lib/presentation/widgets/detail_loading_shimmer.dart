import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';

class DetailLoadingShimmer extends StatelessWidget {
  const DetailLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Flag shimmer with light teal background
          Container(
            width: double.infinity,
            color: AppColors.getFlagBackground(context),
            padding: EdgeInsets.all(16.w),
            child: Shimmer.fromColors(
              baseColor: AppColors.getShimmerBase(context),
              highlightColor: AppColors.getShimmerHighlight(context),
              child: Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  color: AppColors.getCardBackground(context),
                  borderRadius: BorderRadius.circular(12.r),
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
                // "Key Statistics" title shimmer
                Shimmer.fromColors(
                  baseColor: AppColors.getShimmerBase(context),
                  highlightColor: AppColors.getShimmerHighlight(context),
                  child: Container(
                    width: 150.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: AppColors.getCardBackground(context),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                // Stat rows shimmer
                ...List.generate(4, (index) => Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Shimmer.fromColors(
                        baseColor: AppColors.getShimmerBase(context),
                        highlightColor: AppColors.getShimmerHighlight(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                                color: AppColors.getCardBackground(context),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            Container(
                              width: 150.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                                color: AppColors.getCardBackground(context),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

