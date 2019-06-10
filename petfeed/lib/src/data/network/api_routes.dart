class LocalApiRoutes {
  static const String WIFI_SETUP = '/wifisetup';
  static const String TREAT = '/feed';
  static const String CREATE_SCHEDULE = '/create/schedule';
  static const String DELETE_SCHEDULES = '/delete/schedules';
}

class ServerApiRoutes {
  static const String SERVER_URL = 'https://prayush.karkhana.asia/';
  // static const String SERVER_URL = 'http://192.168.1.65:8000/';
  static const String BASE_URL = SERVER_URL + 'api/';

  // pusher auth
  static const String PUSHER_AUTH = BASE_URL + 'broadcast/auth';

  // device ROUTES
  static const String DEVICE_LOGIN = BASE_URL + 'device/login';
  static const String RESET_DEVICE_PASSWORD =
      BASE_URL + 'device/reset-password';
  static const String SHUTDOWN = BASE_URL + 'device/shutdown';
  static const String RESTART = BASE_URL + 'device/restart';
  static const String TREAT = BASE_URL + 'device/treat';
  static const String STATUS = BASE_URL + 'device/status';
  static const String START_HOPPER = BASE_URL + 'device/start-hopper';
  static const String STOP_HOPPER = BASE_URL + 'device/stop-hopper';

  // user ROUTES
  static const String LOGIN = BASE_URL + 'login';
  static const String REGISTER = BASE_URL + 'register';
  static const String RESEND_VERIFICATION =
      BASE_URL + 'send-verification-email';

  // pet ROUTSE
  static const String SAVE_PET = BASE_URL + 'pets/create';
}
