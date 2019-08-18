abstract class BaseRepository<T> {
  Future<List<T>> getAll();
  Future<T> getSingle();
  Future<T> post();
}
