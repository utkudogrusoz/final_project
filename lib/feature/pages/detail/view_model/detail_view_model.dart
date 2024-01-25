import 'package:final_project/feature/models/response/event/donate_foundation_response_model.dart';
import 'package:final_project/feature/models/response/event/get_user_foundation_response_model.dart';
import 'package:final_project/feature/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/response/event/register_event_response_model.dart';
import '../../../models/response/event/registered_events_response_model.dart';

class DetailViewModel extends ChangeNotifier {
  final TextEditingController donationTextfield = TextEditingController();
  List<Data> registeredEvents = [];
  List<Donation> userDonations = [];

  var userHive = Hive.box('user');
  final _userService = UserService();

  Future<void> registerToEvent({int? eventId}) async {
    int userId = userHive.get('id');
    final RegisterEventResponseModel? getAllEventResponse =
        await _userService.registerToEvent(
            userId: userId.toString(), eventId: eventId.toString());

    if (getAllEventResponse!.status == 201) {
      print('Kayıt yapıldı');
    } else {
      print('Hata var');
    }
  }

  Future<void> donateToFoundation({String? foundationId}) async {
    int userId = userHive.get('id');
    final DonateFoundationResponseModel? getAllEventResponse =
        await _userService.donateToFoundation(
      userId: userId.toString(),
      foundationId: foundationId,
      price: donationTextfield.text,
    );

    if (getAllEventResponse!.status == 201) {
      print('Bağış yapıldı');
    } else {
      print('Hata var');
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
