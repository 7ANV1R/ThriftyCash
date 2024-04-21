import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/api/trx_api.dart';

final allTrxDataStreamProvider = StreamProvider((ref) async* {
  yield* ref.watch(trxAPIProvider).fetchAllTrx();
});
