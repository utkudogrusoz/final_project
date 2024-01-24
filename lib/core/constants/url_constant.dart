class UrlConstant {
  static const baseUrl = '192.168.1.134:3000';
  //static const baseUrl = '192.168.1.49:3000';

  static const apiUrl = '/api';
  static const authUrl = '$apiUrl/auth';
  static const eventUrl = '$apiUrl/event';
  static const foundationUrl = '$apiUrl/foundation';
  static const userUrl = '$apiUrl/user';

  static const createUserUrl = '$authUrl/create_user';
  static const loginUrl = '$authUrl/login';

  static const getAllEventsUrl = '$eventUrl/get-events';

  static const getFoundationDetail = '$foundationUrl/get-foundation';

  static const getRegisteredEvents = '$userUrl/get-events-registered';
  static const getDonations = '$userUrl/get-donations';
}
