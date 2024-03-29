import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/isolate/db_isolate.dart';
import 'widgets/db_downloading_page.dart';

final mainThreadBulkInsertStreamProvider = StreamProvider((ref) async* {
  await for (final message in mainThredBulkInsertReceivePort) {
    yield message;
  }
});

class DBDownloadCorePage extends StatefulHookConsumerWidget {
  const DBDownloadCorePage({super.key, required this.user});
  final User user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DBDownloadCorePageState();
}

class _DBDownloadCorePageState extends ConsumerState<DBDownloadCorePage> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return const DBDownloading();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await bulkInsertIsolate(
      user: widget.user,
    );
  }
}
