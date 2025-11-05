class UserSession {
  static final UserSession _instance = UserSession._internal();
  factory UserSession() => _instance;
  UserSession._internal();
  String? _email;
  String? _name;

  // set user data dari login atau signup
  void setUser({String? email, String? name}) {
    _email = email;
    _name = name;
  }

// untuk dapatin ini
  String? get email => _email;
  String? get name => _name;

  // method untuk get email (backward compatibility)
  String? getEmail() => _email;

  // method untuk get name dengan fallback ke email extraction
  String? getName() {
    if (_name != null && _name!.isNotEmpty) {
      return _name;
    }
    if (_email != null && _email!.isNotEmpty) {
      return _extractNameFromEmail(_email!);
    }
    return null;
  }

  // untuk tampilan nama user (prioritas: name > email extraction > 'User')
  String get displayName {
    if (_name != null && _name!.isNotEmpty) {
      return _name!;
    }
    if (_email != null && _email!.isNotEmpty) {
      return _extractNameFromEmail(_email!);
    }
    return 'User';
  }

  // method untuk get display name (backward compatibility)
  String getDisplayName() => displayName;
  // untuk tampilan identifier (email atau name)
  String get displayIdentifier => _email ?? _name ?? 'User';

  String _extractNameFromEmail(String email) {
    if (email.isEmpty) return 'User';
    // ambil bagian sebelum @
    final parts = email.split('@');
    if (parts.isEmpty) return 'User';

    String name = parts[0];

    // ganti underscore atau dot dengan spasi
    name = name.replaceAll('_', ' ').replaceAll('.', ' ');

    // Capitalize setiap kata
    return name.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  //logout
  void clearSession() {
    _email = null;
    _name = null;
  }

  // logika buat user sudah login
  bool get isLoggedIn => _email != null || _name != null;
  // method untuk login
  bool isLoggedInMethod() => isLoggedIn;
}