import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import '../../common/logic/typedefs.dart';
import 'package:http/http.dart' as http;
import '../iapi/i_db_download_api.dart';
import '../local_db/collections/personal_info/personal_info_collection.dart';
import '../local_db/collections/trx_category/trx_category_collection.dart';
import '../local_db/collections/trx_model/trx_collection.dart';

import '../../common/logic/error_util.dart';
import '../../common/logic/failure.dart';
import '../../common/ui/logger.dart';

class DBDownloadAPI implements IDBDownloadAPI {
  final String _baseURL;
  final Map<String, String>? _apiHeader;

  DBDownloadAPI({
    required String baseURL,
    required Map<String, String>? apiHeader,
  })  : _baseURL = baseURL,
        _apiHeader = apiHeader;

  @override
  FutureEither<PersonalInfo> downloadPersonalInfo({required String userUUID}) async {
    try {
      final url = '$_baseURL/user_info?select=*&user_id=eq.$userUUID';
      LoggerManager.green('url:  $url\nHeader: $_apiHeader');
      final apiRes = await http.get(Uri.parse(url), headers: _apiHeader);
      if (apiRes.statusCode == 200) {
        final decodedResponse = json.decode(apiRes.body);
        final PersonalInfo data = PersonalInfo.fromJson(decodedResponse[0] as Map<String, dynamic>);
        return right(data);
      } else {
        LoggerManager.red(
            'DBDownloadAPI.downloadPersonalInfo ${apiRes.reasonPhrase} Err: ERR${apiRes.statusCode}');
        return left(
          Failure(
            message: '${apiRes.body} Err: ERR${apiRes.statusCode}',
          ),
        );
      }
    } catch (e, st) {
      LoggerManager.red('DBDownloadAPI.downloadPersonalInfo $e $st');
      final err = getErrorMessage(e);
      return left(Failure(message: err, stackTrace: st));
    }
  }

  @override
  FutureEither<List<TrxCategory>> downloadAllCategoryData({required String userID}) async {
    try {
      final url = '$_baseURL/trx_category?select=*&user_id=in.(0,$userID)';
      LoggerManager.green('url:  $url');
      final apiRes = await http.get(Uri.parse(url), headers: _apiHeader);
      if (apiRes.statusCode == 200) {
        final decodedResponse = json.decode(apiRes.body);
        final List<TrxCategory> data = List<TrxCategory>.from(
          (decodedResponse as List).map(
            (e) => TrxCategory.fromJson(e as Map<String, dynamic>),
          ),
        ).toList();
        return right(data);
      } else {
        LoggerManager.red(
            'DBDownloadAPI.downloadAllCategoryData ${apiRes.reasonPhrase} Err: ERR${apiRes.statusCode}');
        return left(
          Failure(
            message: '${apiRes.body} Err: ERR${apiRes.statusCode}',
          ),
        );
      }
    } catch (e, st) {
      LoggerManager.red('DBDownloadAPI.downloadAllCategoryData $e $st');
      final err = getErrorMessage(e);
      return left(Failure(message: err, stackTrace: st));
    }
  }

  @override
  FutureEither<List<Transaction>> downloadAllTrx({required String userUUID}) async {
    try {
      final url = '$_baseURL/trx_data?select=*&user_id=eq.$userUUID';
      LoggerManager.green('url:  $url');
      final apiRes = await http.get(Uri.parse(url), headers: _apiHeader);
      if (apiRes.statusCode == 200) {
        final decodedResponse = json.decode(apiRes.body);
        final List<Transaction> data = List<Transaction>.from(
          (decodedResponse as List).map(
            (e) => Transaction.fromJson(e as Map<String, dynamic>),
          ),
        ).toList();
        return right(data);
      } else {
        LoggerManager.red('DBDownloadAPI.downloadAllTrx ${apiRes.reasonPhrase} Err: ERR${apiRes.statusCode}');
        return left(
          Failure(
            message: '${apiRes.body} Err: ERR${apiRes.statusCode}',
          ),
        );
      }
    } catch (e, st) {
      LoggerManager.red('DBDownloadAPI.downloadAllTrx $e $st');
      final err = getErrorMessage(e);
      return left(Failure(message: err, stackTrace: st));
    }
  }
}
