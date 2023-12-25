import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../const/asset_const.dart';

import '../../common/component/filled_btn.dart';
import '../../common/component/snackbar.dart';
import '../../common/ui/gap_helper.dart';
import '../../common/ui/logger.dart';
import '../../common/ui/ui_utils.dart';
import '../../data/services/shared_pref_services.dart';
import '../auth/auth_view.dart';
import 'db_download_controller.dart';

class DbDownloadPage extends StatefulHookConsumerWidget {
  const DbDownloadPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DbDownloadPageState();
}

class _DbDownloadPageState extends ConsumerState<DbDownloadPage> with AfterLayoutMixin<DbDownloadPage> {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    ref.read(dbDownloadControllerProvider.notifier).downloadData();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final hasErr = useState<bool?>(null);

    ref.listen(dbDownloadControllerProvider, (previous, next) {
      LoggerManager.yellow("Listening dbdownload controller");
      if (next.state == DBDownloadStateType.loading) {
        // startDownloadTime = DateTime.now();
        hasErr.value = null;
        isLoading.value = true;
      }
      if (next.state == DBDownloadStateType.error) {
        isLoading.value = false;
        hasErr.value = true;

        showErrorSnackbar(
          context: context,
          message: next.res,
          title: "Error",
        );
      }
      if (next.state == DBDownloadStateType.success) {
        isLoading.value = false;
        hasErr.value = false;

        SharedPrefServices().setDownloadStatus();
        ref.read(isDataDownloadedProvider.notifier).update((state) => true);
      }
    });

    return isLoading.value
        ? const DataDownloadingPart()
        : hasErr.value == null
            ? const DataDownloadingPart()
            : hasErr.value!
                ? const DataDownloadingErrPart(
                    errIndex: 0,
                  )
                : const DataDownloadedPart();
  }
}

class DataDownloadingPart extends StatelessWidget {
  const DataDownloadingPart({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: RepaintBoundary(
                  child: Image.asset(AssetConstants.downloadImage)
                      .animate(
                        onPlay: (controller) => controller.repeat(reverse: true),
                      )
                      .slideY(begin: 0.1, end: 0.15, duration: 600.ms, curve: Curves.easeIn)
                      .shimmer(),
                ),
              ),
              Text("Welcome Aboard!", style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
              kGapSpaceS,
              Text(
                "Preparing Your Personal Space.\nThis will only take a few moments.",
                style: textTheme.labelLarge,
                textAlign: TextAlign.center,
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

class DataDownloadingErrPart extends ConsumerWidget {
  const DataDownloadingErrPart({super.key, required this.errIndex});
  final int errIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = getTextTheme(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: RepaintBoundary(
                  child: Image.asset(AssetConstants.downloadImage)
                      .animate(
                        onPlay: (controller) => controller.repeat(reverse: true),
                      )
                      .saturate(begin: 0.1, end: 0.15, duration: 600.ms, curve: Curves.easeIn),
                ),
              ),
              Text("Aw snap!", style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
              kGapSpaceS,
              Text(
                "There was an unexpected error occured while setup your account. Please try again.\nErr: ERR$errIndex",
                style: textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              kGapSpaceM,
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ColoredFillBtn(
                  onPressed: () async {
                    // await SharedPrefServices().removeDownloadStatus();
                    // await DatabaseServices().truncateAllData();
                    // ref.read(isDataDownloadedProvider.notifier).update((state) => false);
                    // ref.read(dbDownloadControllerProvider.notifier).downloadData();
                  },
                  width: double.infinity,
                  backgroundColor: Colors.red,
                  label: Text(
                    'Retry',
                    style: textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // kGapSpaceXL,
              kGapSpaceXXL,
            ],
          ),
        ),
      ),
    );
  }
}

class DataDownloadedPart extends StatelessWidget {
  const DataDownloadedPart({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: RepaintBoundary(
                    child: Image.asset(AssetConstants.downloadImage)
                        .animate(
                          onPlay: (controller) => controller.repeat(reverse: true),
                        )
                        .slideY(begin: 0.1, end: 0.12, duration: 600.ms, curve: Curves.easeInCubic)),
              ),
              Text("Hold on, we're wrapping up",
                  style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
              kGapSpaceS,
              Text(
                "You will be redirected to home screen.",
                style: textTheme.labelLarge,
                textAlign: TextAlign.center,
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
