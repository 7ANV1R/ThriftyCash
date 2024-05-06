import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import '../../common/ui/logger.dart';
import '../local_db/collections/trx_model/trx_collection.dart';

import '../iapi/i_trx_api.dart';
import '../local_db/db.dart';

final trxAPIProvider = Provider<TrxAPI>((ref) {
  return TrxAPI();
});

class TrxAPI implements ITrxAPI {
  @override
  Stream<List<Transaction>> fetchAllTrx(int? limit) async* {
    try {
      final data = limit == null
          ? db.transactions.where().watch(
                fireImmediately: true,
              )
          : db.transactions.where().limit(10).watch(
                fireImmediately: true,
              );
      yield* data;
    } catch (e, st) {
      LoggerManager.red('[fetchAllTrx] Error: $e \n $st');
      throw Exception('Error in fetching transactions');
    }
  }
}
