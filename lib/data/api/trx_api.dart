import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../common/logic/error_util.dart';
import '../../common/ui/logger.dart';
import '../local_db/trx_data_db.dart';

final trxAPIProvider = Provider((ref) {
  return TrxAPI(
    supabaseClient: Supabase.instance.client,
  );
});

abstract class ITrxAPI {
  Future<List<Map<String, dynamic>>> pullInitialTrxList();
}

class TrxAPI implements ITrxAPI {
  final SupabaseClient _supabaseClient;

  TrxAPI({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  @override
  Future<List<Map<String, dynamic>>> pullInitialTrxList() async {
    try {
      List<Map<String, dynamic>> res = [];
      await _supabaseClient.from('trx_data').select().order('created_at').then((value) {
        LoggerManager.green('TrxAPI.getTrxList $value');
        // serialize
        res = value;
      });
      final trxDB = TrxDataDB();
      await trxDB.batchInsertData(res);
      return res;
    } catch (e, st) {
      LoggerManager.red('TrxAPI.getTrxList $e $st');
      final res = getErrorMessage(e);
      throw res;
    }
  }
}
