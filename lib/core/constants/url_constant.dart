class UrlConstant {
  static const baseUrl = '3.68.185.98:3005';
  

  static const apiUrl = '/api';
  static const authUrl = '$apiUrl/auth';
  static const eventUrl = '$apiUrl/event';
  static const foundationUrl = '$apiUrl/foundation';
  static const userUrl = '$apiUrl/user';

  static const createUserUrl = '$authUrl/create-user';
  static const loginUrl = '$authUrl/login';

  static const getAllEventsUrl = '$eventUrl/get-events';

  static const getFoundationDetail = '$foundationUrl/get-foundation';

  static const getRegisteredEvents = '$userUrl/get-events-registered';
  static const getDonations = '$userUrl/get-donations';
  static const registerToEvent = '$userUrl/register-to-event';
  static const donateToFoundation = '$userUrl/donate-to-foundation';
}
