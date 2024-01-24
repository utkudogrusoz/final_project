import 'package:final_project/feature/models/response/event/get_user_foundation_response_model.dart';
import 'package:final_project/feature/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/response/event/registered_events_response_model.dart';

class UserViewModel extends ChangeNotifier {
  List<Data> registeredEvents = [];
  List<Donation> userDonations = [];

  var userHive = Hive.box('user');
  final _userService = UserService();

  Future<void> getRegisteredEvent({int? userId}) async {
    if (registeredEvents.isEmpty) {
      final RegisteredEventsResponseModel? getAllEventResponse =
          await _userService.getRegisteredEvents(userId: userId);

      if (getAllEventResponse!.status == 200) {
        registeredEvents.addAll(getAllEventResponse.data!);
        print(getAllEventResponse.data![0].event!.name);
        notifyListeners();
      } else {
        print('Hata var');
      }
    }
  }

  Future<void> getFoundations({int? userId}) async {
    if (userDonations.isEmpty) {
      final UserFoundationResponseModel? getAllEventResponse =
          await _userService.getUserFoundations(userId: userId);

      if (getAllEventResponse!.status == 200) {
        userDonations.addAll(getAllEventResponse.data!);
        notifyListeners();
      } else {
        print('Hata var');
      }
    }
  }
}
