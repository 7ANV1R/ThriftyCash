// import 'dart:isolate';

// import 'package:synchronized/synchronized.dart';

// import '../../common/ui/logger.dart';
// import '../services/local_db_services.dart';

// final mainThredBulkInsertReceivePort = ReceivePort();

// final lock = Lock();

// Future<void> bulkInsertIsolate(List<Map<String, dynamic>> data) async {
//   try {
//     LoggerManager.green('Isolate bulkInsertIsolate');
//     final isolate = await Isolate.spawn(_isolate, [mainThredBulkInsertReceivePort.sendPort, data]);

//     isolate.addOnExitListener(mainThredBulkInsertReceivePort.sendPort, response: 'Exit');
//   } catch (e) {
//     LoggerManager.red('Isolate Error: $e');
//   }
// }

// Future<void> _isolate(List v) async {
//   try {
//     lock.synchronized(() async {
//       await DatabaseServices().database;
//       final List<Map<String, dynamic>> data = v[1];
//       LoggerManager.green('Isolate data: ${data.length}');

//       final trxDB = TrxDataDB();
//       await trxDB.batchInsertData(data);
//     });
//   } catch (e) {
//     LoggerManager.red('Error: $e');
//   }
// }
