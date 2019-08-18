abstract class BaseRepository<T> {
  Future<List<T>> getAll();
  Future<T> getSingle(int id);
  Future<T> post(T model);
}
