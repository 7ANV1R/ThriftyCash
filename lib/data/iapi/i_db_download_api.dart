import 'package:thrifycash/common/logic/typedefs.dart';
import 'package:thrifycash/data/local_db/collections/personal_info/personal_info_collection.dart';

import '../local_db/collections/trx_category/trx_category_collection.dart';

abstract class IDBDownloadAPI {
  FutureEither<PersonalInfo> downloadPersonalInfo({required String userUUID});
  FutureEither<List<TrxCategory>> downloadAllCategoryData({required String userID});
}
