class Password {
  String password = "";

  bool isValid() {
    // Vérifier la longueur
    if (password.length < 8 || password.length > 16) {
      return false;
    }

    // Vérifier la présence de majuscules, minuscules, chiffres, caractère spécial, longueur du MDP
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasNumbers = password.contains(RegExp(r'\d'));
    bool lengthValid = password.length >= 8 && password.length <= 16;

    return hasUpper && hasLower && hasDigit && lengthValid;

  @override
  String toString() {
    return "Your Password is: $password";
  }
}
