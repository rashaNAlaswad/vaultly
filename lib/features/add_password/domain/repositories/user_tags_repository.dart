abstract class UserTagsRepository {
  Future<List<String>> fetchTags();
  Future<void> saveTags(List<String> tags);
}
