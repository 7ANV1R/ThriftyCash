import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thrifycash/common/component/loader.dart';
import 'package:thrifycash/common/ui/gap_helper.dart';
import 'package:thrifycash/common/ui/ui_utils.dart';

import '../../data/model/trx_data_model.dart';
import '../home/controller/homepage_controller.dart';

class TempHomePage extends StatefulHookConsumerWidget {
  const TempHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TempHomePageState();
}

class _TempHomePageState extends ConsumerState<TempHomePage> {
  @override
  Widget build(BuildContext context) {
    final trxProv = ref.watch(trxDataProvider);
    final incomeProv = ref.watch(totalIncomeProvider);
    final expenseProv = ref.watch(totalExpenseProvider);
    final toalAmountProv = ref.watch(totalAmountProvider);
    final textTheme = getTextTheme(context);
    final scheme = getColorScheme(context);
    final tabController = useTabController(initialLength: 3);
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
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(200, 10),
                      ),
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
                      toalAmountProv.when(data: (data) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            kGapSpaceXXL,
                            Text(
                              data < 0 ? '\$${data.toString().replaceFirst('-', '')}' : '\$$data',
                              style: textTheme.headlineLarge!.copyWith(
                                color: data < 0 ? Colors.red : Colors.white,
                              ),
                            ),
                            Text(
                              data == 0
                                  ? 'All Spent!'
                                  : data > 0
                                      ? 'Available Balance'
                                      : 'Overspent',
                              style: textTheme.labelLarge!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }, error: (Object error, StackTrace stackTrace) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            kGapSpaceXXL,
                            Text(
                              'Err404',
                              style: textTheme.headlineLarge!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Something went wrong',
                              style: textTheme.labelLarge!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }, loading: () {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            kGapSpaceXXL,
                            Text(
                              '\$ ...',
                              style: textTheme.headlineLarge!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Loading Balance',
                              style: textTheme.labelLarge!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }),
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
                            // tab bar

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return SizedBox(
                                            height: 250,
                                            child: CupertinoDatePicker(
                                              onDateTimeChanged: (value) {},
                                              backgroundColor: Colors.transparent,
                                              initialDateTime: DateTime.now(),
                                              mode: CupertinoDatePickerMode.monthYear,
                                            ),
                                          );
                                        });
                                  },
                                  child: Row(
                                    children: [
                                      Text('July 2021', style: textTheme.labelSmall),
                                      const Icon(
                                        Icons.arrow_drop_down,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                                TabBar(
                                  tabs: const [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Monthly'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Yearly'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('All'),
                                    ),
                                  ],
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: scheme.primary,
                                  ),
                                  padding: EdgeInsets.zero,
                                  labelPadding: EdgeInsets.zero,
                                  indicatorPadding: EdgeInsets.zero,
                                  dividerColor: Colors.transparent,
                                  labelColor: Colors.white,
                                  labelStyle: textTheme.labelSmall,
                                  controller: tabController,
                                  isScrollable: true,
                                  indicatorWeight: 0,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                ),
                              ],
                            ),

                            // spent vs income

                            kGapSpaceM,
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      expenseProv.when(
                                        data: (data) {
                                          return Text(
                                            '\$$data',
                                            style: textTheme.headlineSmall!.copyWith(
                                              color: Colors.red.shade900,
                                            ),
                                          );
                                        },
                                        error: (Object error, StackTrace stackTrace) {
                                          return Text(
                                            'Err404',
                                            style: textTheme.headlineSmall!.copyWith(
                                              color: Colors.red.shade900,
                                            ),
                                          );
                                        },
                                        loading: () {
                                          return Text(
                                            '\$ ...',
                                            style: textTheme.headlineSmall!.copyWith(
                                              color: Colors.red.shade900,
                                            ),
                                          );
                                        },
                                      ),
                                      kGapSpaceXS,
                                      Row(
                                        children: [
                                          Text(
                                            'Spent',
                                            style: textTheme.labelSmall,
                                          ),
                                          kGapSpaceXS,
                                          const Icon(
                                            CupertinoIcons.arrow_up_right_square,
                                            color: Colors.red,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      incomeProv.when(
                                        data: (data) {
                                          return Text(
                                            '\$$data',
                                            style: textTheme.headlineSmall!.copyWith(
                                              color: Colors.green.shade800,
                                            ),
                                          );
                                        },
                                        error: (error, stackTrace) {
                                          return Text(
                                            'Err404',
                                            style: textTheme.headlineSmall!.copyWith(
                                              color: Colors.green.shade800,
                                            ),
                                          );
                                        },
                                        loading: () {
                                          return Text(
                                            '\$ ...',
                                            style: textTheme.headlineSmall!.copyWith(
                                              color: Colors.green.shade800,
                                            ),
                                          );
                                        },
                                      ),
                                      kGapSpaceXS,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Icon(
                                            CupertinoIcons.arrow_down_left_square,
                                            color: Colors.green,
                                            size: 18,
                                          ),
                                          kGapSpaceXS,
                                          Text(
                                            'Income',
                                            style: textTheme.labelSmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            // selected month
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          trxProv.when(
            data: (trxList) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => TrxCard(
                    trx: trxList[index],
                  ),
                  childCount: trxList.length,
                ),
              );
            },
            loading: () {
              return const SliverToBoxAdapter(
                child: SecondaryLoader(),
              );
            },
            error: (e, st) {
              return SliverToBoxAdapter(child: Text('Error: $e'));
            },
          ),
        ],
      ),
    );
  }
}

class TrxCard extends StatelessWidget {
  const TrxCard({
    super.key,
    required this.trx,
  });

  final TrxDataModel trx;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: trx.isExpense == 0 ? Colors.green.withAlpha(15) : Colors.red.withAlpha(15),
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              CupertinoIcons.money_dollar_circle,
              color: Colors.blue,
              size: 32,
            ),
          ),
          kGapSpaceM,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trx.note ?? '',
                  style: getTextTheme(context).labelSmall,
                ),
                kGapSpaceXS,
                Text(
                  trx.trxType ?? '',
                  style: getTextTheme(context).labelSmall!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
          Text(
            trx.amount.toString(),
            style: getTextTheme(context).labelLarge!.copyWith(
                  color: trx.isExpense == 0 ? Colors.green : Colors.red,
                ),
          ),
          kGapSpaceL,
        ],
      ),
    );
  }
}
