
abstract interface class UseCase<SucessType, Params> {
  Future<SucessType> call({Params? params});
}


























