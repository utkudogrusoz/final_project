import 'package:final_project/feature/models/event_model.dart';
import 'package:final_project/feature/models/response/event/all_events_response_model.dart';
import 'package:final_project/feature/services/event_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeViewModel extends ChangeNotifier {
  List<EventModel> allEvents = [];

  var userHive = Hive.box('user');
  final _eventService = EventService();

  Future<void> getAllEvents({BuildContext? context}) async {
    if (allEvents.isEmpty) {
      final AllEventsResponseModel? getAllEventResponse =
          await _eventService.getAllEvents();

      if (getAllEventResponse!.status == 200) {
        print(getAllEventResponse);
        allEvents.addAll(getAllEventResponse.data!);
        notifyListeners();
      } else {
        print('Hata var');
      }
    }
    // ignore: omit_local_variable_types
  }
}
