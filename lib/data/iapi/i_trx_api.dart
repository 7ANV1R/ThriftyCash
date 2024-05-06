import '../local_db/collections/trx_model/trx_collection.dart';

abstract class ITrxAPI {
  Stream<List<Transaction>> fetchAllTrx(int? limit);
}
