import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    // Récupère les données de l'utilisateur
    String user = await fetchUserData();
    Map<String, dynamic> userData = jsonDecode(user);
    String id = userData['id'];

    // Récupère les commandes de l'utilisateur
    String orders = await fetchUserOrders(id);
    List<dynamic> userOrders = jsonDecode(orders);

    double total = 0;

    // Calcule le prix total
    for (int i = 0; i < userOrders.length; i++) {
      String price = await fetchProductPrice(userOrders[i]);
      total += jsonDecode(price);
    }

    return total;
  } catch (error) {
    return -1;
  }
}
