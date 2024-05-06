import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/api/trx_api.dart';

final allTrxDataStreamProvider = StreamProvider.family((ref, int? limit) async* {
  yield* ref.watch(trxAPIProvider).fetchAllTrx(limit);
});
