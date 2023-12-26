import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/model/trx_data_model.dart';

final trxDataProvider = StreamProvider((ref) async* {
  final client = Supabase.instance.client;

  // final stream = client.from('trx_data').stream(primaryKey: ['id']).order('updated_at');
  final stream = client.from('trx_data').stream(primaryKey: ['id']).order('updated_at');
  await for (final message in stream) {
    final data = message.map((e) => TrxDataModel.fromMap(e)).toList();
    yield data;
  }
});

// total amount count
final totalAmountProvider = StreamProvider((ref) async* {
  final client = Supabase.instance.client;

  final stream = client.from('trx_data').stream(primaryKey: ['id']).order('updated_at');

  await for (final message in stream) {
    // count all amount where is_expense = 0 means income and is_expense = 1 means expense
    final data = message.map((e) => TrxDataModel.fromMap(e)).toList();
    final double total = data.fold(0, (previousValue, element) {
      if (element.isExpense == 0) {
        return previousValue + element.amount!;
      } else {
        return previousValue - element.amount!;
      }
    });
    yield total;
  }
});
