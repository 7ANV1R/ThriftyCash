import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../profile/profile_page.dart';

import '../../common/ui/ui_utils.dart';

final GlobalKey<ScaffoldState> mainLayoutScaffoldKey = GlobalKey();

class MainLayoutPage extends StatefulHookConsumerWidget {
  const MainLayoutPage({super.key, required this.user});
  final User user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainLayoutPageState();
}

class _MainLayoutPageState extends ConsumerState<MainLayoutPage> with AfterLayoutMixin {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    // await ezSyncAPI.syncDB(ref);
    // invalidateProvider(ref);
    // // start timer
    // Timer.periodic(const Duration(minutes: 5), (timer) async {
    //   await ezSyncAPI.syncDB(ref);
    //   invalidateProvider(ref);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = getColorScheme(context);
    return Container(
      color: scheme.onPrimary,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16),
      child: Scaffold(
        key: mainLayoutScaffoldKey,
        // endDrawer: const AppDrawer(),
        endDrawerEnableOpenDragGesture: false,
        body: PersistentTabView(
          context,
          controller: controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: false,

          backgroundColor: scheme.onPrimary, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.

          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            // colorBehindNavBar: scheme.surface,
            boxShadow: [
              BoxShadow(
                color: scheme.shadow.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),

          navBarStyle: NavBarStyle.style10, // Choose the nav bar style with this property.
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      // HomePage(
      //   user: widget.user,
      // ),
      Container(),
      const ProfilePage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.layers_alt_fill,
        ),
        inactiveIcon: const Icon(CupertinoIcons.layers_alt),
        title: "Home",
        textStyle: getTextTheme(context).labelLarge,
        activeColorPrimary: getColorScheme(context).primary,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.chart_bar_square_fill),
        inactiveIcon: const Icon(CupertinoIcons.chart_bar_square),
        title: ("Stats"),
        activeColorPrimary: getColorScheme(context).primary,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person_crop_square_fill),
        inactiveIcon: const Icon(CupertinoIcons.person_crop_square),
        title: ("Profile"),
        activeColorPrimary: getColorScheme(context).primary,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
