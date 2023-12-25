import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/api/trx_api.dart';

final trxDataProvider = FutureProvider((ref) async {
  final trxList = ref.watch(trxAPIProvider).getTrxList();
  return trxList;
});
