import 'package:fpdart/fpdart.dart';

import 'failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
typedef FutureEitherBool = FutureEither<bool>;
typedef FutureEitherString = FutureEither<String>;
typedef FutureEitherInt = FutureEither<int>;
