import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thrifycash/common/ui/gap_helper.dart';
import 'package:thrifycash/common/ui/ui_utils.dart';

class TempHomePage extends StatefulHookConsumerWidget {
  const TempHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TempHomePageState();
}

class _TempHomePageState extends ConsumerState<TempHomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);
    final scheme = getColorScheme(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFF515ae9),
                      Color(0xFF846ff0),
                      Color(0xFFb683f9),
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      kGapSpaceXXL,
                      Text(
                        '\$1,700',
                        style: textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Available Balance',
                        style: textTheme.labelLarge!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      kGapSpaceL,
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          // simple drop shadow
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 12,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                kGapSpaceM,
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      kGapSpaceM,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Spent',
                                            style: textTheme.labelLarge!.copyWith(
                                              color: scheme.outline,
                                            ),
                                          ),
                                          Text(
                                            '\$1,700',
                                            style: textTheme.headlineSmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                kGapSpaceM,
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: const BoxDecoration(
                                          color: Colors.purple,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      kGapSpaceM,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Spent',
                                            style: textTheme.labelLarge!.copyWith(
                                              color: scheme.outline,
                                            ),
                                          ),
                                          Text(
                                            '\$1,700',
                                            style: textTheme.headlineSmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            kGapSpaceS,
                            Divider(
                              color: scheme.outline.withOpacity(0.3),
                              thickness: 2,
                            ),
                            kGapSpaceM,
                            Text(
                              'January 2023',
                              style: textTheme.labelLarge!.copyWith(
                                color: scheme.outline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 200,
                //   width: double.infinity,
                //   color: Colors.blue,
                // ),
                // Positioned(
                //   top: 120,
                //   left: 16,
                //   right: 16,
                //   child: Container(
                //     color: Colors.red,
                //     child: Text('Hello'),
                //   ),
                // ),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              title: Text('Item $index'),
            ),
            childCount: 100,
          )),
        ],
      ),
    );
  }
}
