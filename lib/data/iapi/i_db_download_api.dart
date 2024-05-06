import '../../common/logic/typedefs.dart';
import '../local_db/collections/personal_info/personal_info_collection.dart';
import '../local_db/collections/trx_category/trx_category_collection.dart';
import '../local_db/collections/trx_model/trx_collection.dart';

abstract class IDBDownloadAPI {
  FutureEither<PersonalInfo> downloadPersonalInfo({required String userUUID});
  FutureEither<List<TrxCategory>> downloadAllCategoryData({required String userID});
  FutureEither<List<Transaction>> downloadAllTrx({required String userUUID});
}
