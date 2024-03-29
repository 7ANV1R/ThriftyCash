import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/component/filled_btn.dart';
import '../../../common/component/snackbar.dart';
import '../../../common/ui/gap_helper.dart';
import '../../../common/ui/logger.dart';
import '../../../common/ui/ui_utils.dart';
import '../../../data/services/shared_pref_services.dart';
import '../../../router/app_route.dart';
import '../db_download.dart';
import 'download_img_widget.dart';

class DBDownloading extends StatefulHookConsumerWidget {
  const DBDownloading({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DBDownloadingState();
}

class _DBDownloadingState extends ConsumerState<DBDownloading> {
  @override
  Widget build(BuildContext context) {
    final hasErr = useState<bool>(false);
    final errCode = useState<String>('');
    ref.listen(mainThreadBulkInsertStreamProvider, (prev, next) async {
      LoggerManager.yellow(" Stream Isolate Message: $next");
      if (next.value == 'Done') {
        await SharedPrefServices().setDownloadStatus();

        if (context.mounted) {
          context.pushReplacement(ScreenPaths.root);
        }
      } else if (next.value.contains('Err')) {
        hasErr.value = true;
        errCode.value = next.value;
        showErrorSnackbar(context: context, title: 'Error', message: 'Aw snap!');
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: hasErr.value
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const DownloadImageWidget(
                      hasErr: true,
                    ),
                    Text("Something went wrong!",
                        style: context.textTheme.titleLarge!
                            .copyWith(color: context.scheme.error, fontWeight: FontWeight.bold)),
                    kGapSpaceS,
                    Text(
                      'There was an error while setting up your personal space.\nError Code: ${errCode.value.toUpperCase()}',
                      style: context.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    kGapSpaceM,
                    ColoredFillBtn(
                      width: double.infinity,
                      backgroundColor: context.scheme.error,
                      onPressed: () {
                        hasErr.value = false;
                        context.pushReplacement(ScreenPaths.root);
                      },
                      label: Text(
                        'Retry',
                        style: context.textTheme.labelLarge!.copyWith(
                          color: context.scheme.onPrimary,
                        ),
                      ),
                    ),
                    kGapSpaceXXL,
                    kGapSpaceXXL,
                  ],
                ),
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const DownloadImageWidget(
                      hasErr: false,
                    ),
                    Text("Welcome Aboard!",
                        style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
                    kGapSpaceS,
                    Text('We are setting up your personal space.', style: context.textTheme.bodyMedium),
                    Text('This will only take a few moments.', style: context.textTheme.bodyMedium),
                    kGapSpaceXXL,
                    kGapSpaceXXL,
                  ],
                ),
              ),
      ),
    );
  }
}
