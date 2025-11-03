class UserSession {
  static final UserSession _instance = UserSession._internal();
  factory UserSession() => _instance;
  UserSession._internal();

  String? _userEmail;
  String? _userName;

  // Set user data dari login atau signup
  void setUser({String? email, String? name}) {
    _userEmail = email;
    _userName = name;
  }

//Dapatin nama dan user jika sudah login
  String? get email => _userEmail;
  String? get name => _userName;

  // Untuk tampilin email atau name untuk ditampilkan
  String get displayIdentifier => _userEmail ?? _userName ?? 'User';

  // Untuk logout
  void clearSession() {
    _userEmail = null;
    _userName = null;
  }

  // Check apakah user sudah login
  bool get isLoggedIn => _userEmail != null || _userName != null;
}