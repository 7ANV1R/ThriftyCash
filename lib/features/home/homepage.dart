import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../common/ui/gap_helper.dart';
import '../../common/ui/ui_utils.dart';
import 'controller/homepage_controller.dart';

import '../../common/component/loader.dart';
import '../../data/local_db/collections/trx_model/trx_collection.dart';
import 'widgets/top_stats_part.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TempHomePageState();
}

class _TempHomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final trxStream = ref.watch(allTrxDataStreamProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HomepageMainStatsPart(),
          kSliverGapSpaceL,
          trxStream.when(
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

  final Transaction trx;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: trx.category.value != null &&
                trx.category.value!.isExpense != null &&
                trx.category.value!.isExpense!
            ? Colors.green.withAlpha(15)
            : Colors.red.withAlpha(15),
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
            child: Center(
              child: Text(
                trx.category.value?.emoji ?? '💸',
                style: context.textTheme.headlineMedium,
              ),
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
                  'GGEZ',
                  style: getTextTheme(context).labelSmall!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
          Text(
            trx.amount.toString(),
            // style: getTextTheme(context).labelLarge!.copyWith(
            //       color: trx.isExpense == 0 ? Colors.green : Colors.red,
            //     ),
          ),
          kGapSpaceL,
        ],
      ),
    );
  }
}
