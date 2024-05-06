// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thrifycash/const/env_const.dart';
import 'package:thrifycash/data/api/db_download_api.dart';

Client client = Client();

class MockHttpClient extends Mock implements Client {}

void main() {
  late DBDownloadAPI repository;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    repository = DBDownloadAPI(
      client: mockHttpClient,
      baseURL: EnvConst.supabaseUrl,
      apiHeader: EnvConst.apiHeader,
    );
  });

  group("DBDownloadAPI Test", () {
    test(
      '200 downloadAllCategoryData',
      () async {
        const baseURL = EnvConst.supabaseUrl;
        const url = '$baseURL/trx_category?select=*&user_id=in.(0,9)';
        final jsonResponse = [
          {
            "id": 1,
            "created_at": "2024-03-13T21:27:49.166901+00:00",
            "name": "Test Savings",
            "is_expense": false,
            "user_id": 0,
            "emoji": "T"
          },
          {
            "id": 2,
            "created_at": "2024-03-13T21:29:36.04599+00:00",
            "name": "Test Deposit",
            "is_expense": false,
            "user_id": 0,
            "emoji": "A"
          },
        ];

        when(
          () => mockHttpClient.get(Uri.parse(url), headers: any(named: 'headers')),
        ).thenAnswer(
          (invocation) async {
            return Response(jsonEncode(jsonResponse), 200, reasonPhrase: 'OK');
          },
        );

        final res = await repository.downloadAllCategoryData(
          userID: '9',
        );

        print(res.fold((l) => l.message, (r) => r.toString()));
        expect(res.isRight(), true);
      },
    );

    test(
      '404 downloadAllCategoryData',
      () async {
        const baseURL = EnvConst.supabaseUrl;
        const url = '$baseURL/trx_category?select=*&user_id=in.(0,9)';
        final jsonResponse = [];

        when(
          () => mockHttpClient.get(
            Uri.parse(url),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer(
          (invocation) async {
            return Response(
              jsonEncode(jsonResponse),
              404,
              reasonPhrase: 'Not Found',
            );
          },
        );

        final res = await repository.downloadAllCategoryData(
          userID: '9',
        );

        print(res.fold((l) => l.message, (r) => r.toString()));
        expect(res.isLeft(), true);
      },
    );
  });
}
