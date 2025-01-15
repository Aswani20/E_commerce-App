import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/features/UI/Pages/Home_screen/Tabs/FavoriteTab/favorite_tab.dart';
import 'package:e_commerce_app/features/UI/Pages/Home_screen/Tabs/HomeTab/home_tab.dart';
import 'package:e_commerce_app/features/UI/Pages/Home_screen/Tabs/ProductsTab/products_tab.dart';
import 'package:e_commerce_app/features/UI/Pages/Home_screen/Tabs/UserTab/user_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({Key? key}) : super(key: key);

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  int selectedIndex = 0;
  List<Widget> bodyList = [
    const HomeTab(),
    const ProductsTab(),
    const FavoriteTab(),
    const UserTab()
  ];

  void bottomNavOnTap(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bodyList[selectedIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
          child: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primaryLight),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              currentIndex: selectedIndex,
              onTap: bottomNavOnTap,
              items: [
                _bottomNavBarItemBuilder(
                  isSelected: selectedIndex == 0,
                  selectedIcon: AppAssets.selectedHomeIcon,
                  unselectedIcon: AppAssets.unSelectedHomeIcon,
                ),
                _bottomNavBarItemBuilder(
                  isSelected: selectedIndex == 1,
                  selectedIcon: AppAssets.selectedCategoryIcon,
                  unselectedIcon: AppAssets.unSelectedCategoryIcon,
                ),
                _bottomNavBarItemBuilder(
                  isSelected: selectedIndex == 2,
                  selectedIcon: AppAssets.selectedFavouriteIcon,
                  unselectedIcon: AppAssets.unSelectedFavouriteIcon,
                ),
                _bottomNavBarItemBuilder(
                  isSelected: selectedIndex == 3,
                  selectedIcon: AppAssets.selectedAccountIcon,
                  unselectedIcon: AppAssets.unSelectedAccountIcon,
                ),
              ],
            ),
          ),
        ));
  }

  BottomNavigationBarItem _bottomNavBarItemBuilder(
      {required bool isSelected,
      required String selectedIcon,
      required String unselectedIcon}) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        foregroundColor:
            isSelected ? AppColors.primaryLight : AppColors.whiteColor,
        backgroundColor: isSelected ? AppColors.whiteColor : Colors.transparent,
        radius: 25.r,
        child: Image.asset(isSelected ? selectedIcon : unselectedIcon),
      ),
      label: "",
    );
  }
}
