import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/language/app_language_utils.dart';
import '../FeedsScreen/screens/feeds_screen.dart';
import '../personalization/screens/profile_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final isDarkMode = CHelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: isDarkMode ? CColors.black : Colors.white,
          indicatorColor: isDarkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          destinations: [
            NavigationDestination(
                icon: Icon(Iconsax.home),
                label: AppLanguageUtils.instance.home),
            NavigationDestination(
                icon: Icon(Iconsax.shop),
                label: AppLanguageUtils.instance.add),
            NavigationDestination(
                icon: Icon(Iconsax.heart),
                label: AppLanguageUtils.instance.feed),
            NavigationDestination(
                icon: Icon(Iconsax.user),
                label: AppLanguageUtils.instance.profile),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    // EmployeesView(),
    // EmployeeAddEditScreen(employeeDetails: null, newCustomer: true),
    FeedsScreen(),
    FeedsScreen(),
    FeedsScreen(),
    ProfileScreen()
  ];
}


