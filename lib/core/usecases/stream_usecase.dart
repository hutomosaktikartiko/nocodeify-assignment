abstract class StreamUseCase<Type, Params> {
  Stream<(Object?, Type?)> call(Params params);
}
