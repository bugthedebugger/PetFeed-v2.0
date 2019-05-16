class LocalApiRoutes {}

class ServerApiRoutes {
  // static const String serverURL = 'https://prayush.karkhana.asia/';
  static const String SERVER_URL = 'http://192.168.2.117:8000/';
  static const String BASE_URL = SERVER_URL + 'api/';

  // device ROUTES
  static const String DEVICE_LOGIN = BASE_URL + 'device/login';
  static const String RESET_DEVICE_PASSWORD =
      BASE_URL + 'device/reset-password';
  static const String SHUTDOWN = BASE_URL + 'device/shutdown';
  static const String RESTART = BASE_URL + 'device/restart';
  static const String TREAT = BASE_URL + 'device/treat';

  // user ROUTES
  static const String LOGIN = BASE_URL + 'login';
  static const String REGISTER = BASE_URL + 'register';
  static const String RESEND_VERIFICATION =
      BASE_URL + 'send-verification-email';
}
