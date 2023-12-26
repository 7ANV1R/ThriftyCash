import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../common/ui/gap_helper.dart';

import 'controller/homepage_controller.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trxProv = ref.watch(trxDataProvider);
    final trxTotalProv = ref.watch(totalAmountProvider);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          trxProv.when(
            data: (trxList) {
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text(trxList[index].note ?? '');
                },
                itemCount: trxList.length,
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            error: (e, st) {
              return Text('Error: $e');
            },
          ),
          trxTotalProv.when(
            data: (data) {
              return Text('Total: $data');
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            error: (e, st) {
              return Text('Error: $e');
            },
          ),
          Text('Homepage with email: ${user.email}'),
          kGapSpaceL,
        ],
      ),
    );
  }
}
