import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    // Récupérer les données de l'utilisateur
    final String userData = await fetchUserData();
    final Map<String, dynamic> user = jsonDecode(userData);
    final String userId = user['id'];

    // Récupérer les commandes de l'utilisateur
    final String ordersData = await fetchUserOrders(userId);
    final List<dynamic> orders = jsonDecode(ordersData);

    double total = 0;

    // Parcourir chaque produit et additionner les prix
    for (final product in orders) {
      final String priceData = await fetchProductPrice(product);
      final dynamic price = jsonDecode(priceData);
      total += price;
    }

    return total;
  } catch (e) {
    return -1;
  }
}
