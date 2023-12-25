import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../data/local_db/trx_data_db.dart';

final trxDataProvider = FutureProvider((ref) async {
  final trxList = ref.watch(trxDataDBProvider).fetchAllTrx();
  return trxList;
});
