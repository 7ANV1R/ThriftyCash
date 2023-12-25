import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:thrifycash/common/ui/logger.dart';

final trxAPIProvider = Provider((ref) {
  return TrxAPI(
    supabaseClient: Supabase.instance.client,
  );
});

abstract class ITrxAPI {
  Future<String> getTrxList();
}

class TrxAPI implements ITrxAPI {
  final SupabaseClient _supabaseClient;

  TrxAPI({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  @override
  Future<String> getTrxList() async {
    try {
      _supabaseClient
          .from('trx_data')
          .select('note, amount, trx_type, created_at')
          .order('created_at')
          .then((value) => LoggerManager.green('TrxAPI.getTrxList $value'));

      return 'success';
    } catch (e, st) {
      LoggerManager.red('TrxAPI.getTrxList $e $st');
      return e.toString();
    }
  }
}
