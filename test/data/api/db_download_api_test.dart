import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:thrifycash/const/env_const.dart';
import 'package:thrifycash/data/api/db_download_api.dart';

import 'db_download_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('DB Download API Test', () {
    test(
      'Download Trx Category',
      () async {
        final client = MockClient();
        const baseURL = EnvConst.supabaseAPIUrl;
        const apiHeader = EnvConst.apiHeader;

        when(client.get(Uri.parse('$baseURL/trx_category?select=*&user_id=in.(0,1)'))).thenAnswer(
          (_) async => http.Response(
            '''
[
  {
        "id": 1,
        "created_at": "2024-03-13T21:27:49.166901+00:00",
        "name": "Savings",
        "is_expense": false,
        "user_id": 0,
        "emoji": "💰"
    },
    {
        "id": 2,
        "created_at": "2024-03-13T21:29:36.04599+00:00",
        "name": "Deposit",
        "is_expense": false,
        "user_id": 0,
        "emoji": "🏧"
    },
]
''',
            200,
          ),
        );
        final result = await DBDownloadAPI(
          baseURL: baseURL,
          apiHeader: apiHeader,
        ).downloadAllCategoryData(
          userID: '1',
        );

        // expect(result, isA<Left<Failure, List<TrxCategory>>>());
        expect((result as Left).value.message, contains('Error message'));
      },
    );
  });
}
