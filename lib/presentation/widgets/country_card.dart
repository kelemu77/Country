import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/formatters.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/country_summary_model.dart';

class CountryCard extends StatelessWidget {
  final CountrySummaryModel country;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;
  final String? heroTagPrefix;
  final bool hidePopulation;
  final String? capital;

  const CountryCard({
    super.key,
    required this.country,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteToggle,
    this.heroTagPrefix,
    this.hidePopulation = false,
    this.capital,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        color: AppColors.getCardBackground(context),
        child: Row(
          children: [
            Hero(
              tag: 'country_flag_${country.code}_${heroTagPrefix ?? 'home'}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  country.flags.png ?? country.flags.svg ?? '',
                  width: 95
                      .w, // it was 100 on ui but it was too big so i reduced it to 95
                  height: 56.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 64.w,
                      height: 46.h,
                      color: AppColors.getErrorPlaceholder(context),
                      child: Icon(Icons.flag, size: 22.sp),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    country.name.common,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.5, // line-height: 24px / font-size: 16px = 1.5
                      letterSpacing: 0,
                      color: AppColors.getSecondaryText(context),
                    ),
                  ),
                  if (!hidePopulation) ...[
                    SizedBox(height: 4.h),
                    Text(
                      capital != null
                          ? "Capital: $capital"
                          : "Population: ${Formatters.formatPopulation(country.population)}",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height:
                            1.5, // line-height: 21px / font-size: 14px = 1.5
                        letterSpacing: 0,
                        color: AppColors.getTertiaryText(context),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(width: 16.w),
            SizedBox(
              width: 28.w,
              height: 28.h,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite
                      ? AppColors.getFavorite(context)
                      : AppColors.getHintText(context),
                  size: 24.sp,
                ),
                onPressed: onFavoriteToggle,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(
                  minWidth: 28.w,
                  minHeight: 28.h,
                  maxWidth: 28.w,
                  maxHeight: 28.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
