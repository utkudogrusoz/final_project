import 'package:final_project/core/extensions/context_extension.dart';
import 'package:final_project/feature/models/response/event/get_user_foundation_response_model.dart';
import 'package:final_project/feature/models/response/event/registered_events_response_model.dart';
import 'package:final_project/feature/pages/auth/view/login_view.dart';
import 'package:final_project/feature/pages/profile/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _userViewModel = ChangeNotifierProvider<UserViewModel>((ref) {
  return UserViewModel();
});

class UserProfileView extends ConsumerStatefulWidget {
  const UserProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserProfileViewState();
}

class _UserProfileViewState extends ConsumerState<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: context.height * 0.20,
                width: context.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    contentTitle(title: 'İsim Soyisim'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        ref.read(_userViewModel).userHive.get('name') +
                            ' ' +
                            ref.read(_userViewModel).userHive.get('surname'),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    contentTitle(title: 'Mail'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        ref.read(_userViewModel).userHive.get('mail'),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    contentTitle(title: 'Telefon'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        ref.read(_userViewModel).userHive.get('phone'),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            contentTitle(title: 'Etkinlikler'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder<void>(
                  future: ref.read(_userViewModel).getRegisteredEvent(
                      userId: ref.read(_userViewModel).userHive.get('id')),
                  builder: (context, snapshot) {
                    return Row(
                        children:
                            ref.read(_userViewModel).registeredEvents.isNotEmpty
                                ? ref
                                    .read(_userViewModel)
                                    .registeredEvents
                                    .map((e) {
                                    return eventCardContainer(e);
                                  }).toList()
                                : []);
                  }),
            ),
            contentTitle(title: 'Bağışlar'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder<void>(
                  future: ref.read(_userViewModel).getFoundations(
                      userId: ref.read(_userViewModel).userHive.get('id')),
                  builder: (context, snapshot) {
                    return Row(
                        children: ref
                                .read(_userViewModel)
                                .userDonations
                                .isNotEmpty
                            ? ref.read(_userViewModel).userDonations.map((e) {
                                return donationCardContainer(e);
                              }).toList()
                            : []);
                  }),
            ),
            InkWell(
              onTap: () {
                ref.read(_userViewModel).userHive.clear();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                    (route) => false);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: Container(
                  height: context.height * 0.07,
                  width: context.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.exit_to_app,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Çıkış Yap')
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container eventCardContainer(Data e) {
    return Container(
      height: context.height * 0.20,
      width: context.height * 0.20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: context.height * 0.12,
            width: context.height * 0.20,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(e.event!.foundation!.logo!)),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              e.event!.name!,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container donationCardContainer(Donation e) {
    return Container(
      height: context.height * 0.20,
      width: context.height * 0.20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: context.height * 0.12,
            width: context.height * 0.20,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(e.foundation!.logo!)),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              e.price.toString() + '₺',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding contentTitle({@required String? title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 2),
      child: Text(
        title!,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
