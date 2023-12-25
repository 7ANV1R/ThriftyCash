import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/api/trx_api.dart';

enum DBDownloadStateType {
  init,
  loading,
  error,
  success,
}

class DBDownloadState {
  final DBDownloadStateType state;
  final String? res;

  const DBDownloadState({required this.state, required this.res});
}

final dbDownloadControllerProvider =
    NotifierProvider<DBDownloadController, DBDownloadState>(DBDownloadController.new);

class DBDownloadController extends Notifier<DBDownloadState> {
  @override
  DBDownloadState build() {
    return const DBDownloadState(state: DBDownloadStateType.init, res: null);
  }

  void downloadData() async {
    state = const DBDownloadState(state: DBDownloadStateType.loading, res: null);
    // final dataAPI = ref.read(dbAPIProvider);

    try {
      await ref.read(trxAPIProvider).pullInitialTrxList();

      state = const DBDownloadState(state: DBDownloadStateType.success, res: null);
    } catch (e) {
      state = DBDownloadState(state: DBDownloadStateType.error, res: e.toString());
    }
  }
}
