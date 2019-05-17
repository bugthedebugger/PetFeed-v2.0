class PusherCredentials {
  static const String APP_ID = '775955';
  static const String KEY = '52dbd8b82ec2d1c42839';
  static const String SECRET = '1852cc0e0d459c5c3da9';
  static const String CLUSTER = 'ap2';

  static Map<String, String> toMap() {
    return {
      'app_id': APP_ID,
      'key': KEY,
      'secret': SECRET,
      'cluster': CLUSTER,
    };
  }
}
