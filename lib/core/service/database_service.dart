abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String docementid,
  });

  Future<Map<String, dynamic>> getData({
    required String docementid,
    required String path,
  });
}
