// ignore_for_file: prefer_interpolation_to_compose_strings

class Routes {
  static const String authService =
      "https://identitytoolkit.googleapis.com/v1/";

  static const String apiKey = "AIzaSyA8lQJAI5_kwFRjg1e-SkCOdCY9L1Q8CNI";

  String signIn() {
    return authService + "accounts:signInWithPassword?key=" + apiKey;
  }
  String signUp() {
    return authService + "accounts:signUp?key=" + apiKey;
  }
}
