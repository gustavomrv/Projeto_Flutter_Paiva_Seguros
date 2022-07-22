class Routes {
  static const String authService =
      "https://identitytoolkit.googleapis.com/v1/";

  static const String apiKey = "AIzaSyA8lQJAI5_kwFRjg1e-SkCOdCY9L1Q8CNI";

  String signIn() {
    return authService + "accounts:signInWithPassword?key=" + apiKey;
  }
  // https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA8lQJAI5_kwFRjg1e-SkCOdCY9L1Q8CNI
  String signUp() {
    return authService + "accounts:signUp?key=" + apiKey;
  }
}
