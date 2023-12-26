import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:thrifycash/data/model/trx_data_model.dart';

import '../../common/logic/error_util.dart';
import '../../common/ui/logger.dart';

final trxAPIProvider = Provider((ref) {
  return TrxAPI(
    supabaseClient: Supabase.instance.client,
  );
});

abstract class ITrxAPI {
  Future<List<TrxDataModel>> pullInitialTrxList();
}

class TrxAPI implements ITrxAPI {
  final SupabaseClient _supabaseClient;

  TrxAPI({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  @override
  Future<List<TrxDataModel>> pullInitialTrxList() async {
    try {
      List<TrxDataModel> res = [];
      await _supabaseClient.from('trx_data').select().order('created_at').then((value) {
        LoggerManager.green('TrxAPI.getTrxList $value');
        // serialize
        res = value.map((e) => TrxDataModel.fromMap(e)).toList();
      });
      // final trxDB = TrxDataDB();
      // await trxDB.batchInsertData(res);
      return res;
    } catch (e, st) {
      LoggerManager.red('TrxAPI.getTrxList $e $st');
      final res = getErrorMessage(e);
      throw res;
    }
  }
}
