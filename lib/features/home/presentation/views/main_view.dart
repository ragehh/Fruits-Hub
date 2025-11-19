import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const routeName = 'MainView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeView()),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
