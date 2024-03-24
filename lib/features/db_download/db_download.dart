import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hyper_effects/hyper_effects.dart';
import 'package:thrifycash/common/ui/logger.dart';
import 'package:thrifycash/common/ui/ui_utils.dart';
import 'package:thrifycash/data/isolate/db_isolate.dart';

import '../../common/ui/gap_helper.dart';
import 'widgets/download_img_widget.dart';

class DBDownloadCorePage extends StatefulHookConsumerWidget {
  const DBDownloadCorePage({super.key});

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
    await bulkInsertIsolate();
    mainThredBulkInsertReceivePort.listen((message) {
      LoggerManager.green("Isolate Message: $message");
    });
  }
}

class DBDownloading extends StatefulHookConsumerWidget {
  const DBDownloading({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DBDownloadingState();
}

class _DBDownloadingState extends ConsumerState<DBDownloading> {
  List<String> lines = [
    "Preparing Your Personal Space.",
    "This will only take a few moments.",
    "Preparing Your Personal Space.",
    "This will only take a few moments.",
  ];
  int lastLine = 0;
  int line = 0;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: (5000 * timeDilation).toInt()), (timer) {
      setState(() {
        lastLine = line;
        line = (line + 1) % lines.length;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DownloadImageWidget(),
              Text("Welcome Aboard!",
                  style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
              kGapSpaceS,
              RepaintBoundary(
                child: Text(lines[lastLine])
                    .roll(
                      lines[line],
                      symbolDistanceMultiplier: 2,
                      tapeCurve: Curves.linear,
                      widthCurve: Curves.linear,
                      padding: const EdgeInsets.only(right: 3),
                    )
                    .animate(
                      trigger: line,
                      duration: const Duration(milliseconds: 1000),
                    ),
              ),
              kGapSpaceXXL,
              kGapSpaceXXL,
            ],
          ),
        ),
      ),
    );
  }
}