import '2-util.dart';

Future<void> getUser() async {
  try {
    final String user = await fetchUser();
    print('User: $user');
  } catch (e) {
    print('Error caught: $e');
  }
}