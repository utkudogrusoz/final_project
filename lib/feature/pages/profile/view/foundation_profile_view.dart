import 'package:final_project/core/extensions/context_extension.dart';
import 'package:final_project/feature/models/event_model.dart';
import 'package:final_project/feature/models/foundation_model.dart';
import 'package:final_project/feature/models/location_model.dart';
import 'package:final_project/feature/models/response/event/foundation_detail_response_model.dart';
import 'package:final_project/feature/pages/detail/view/detail_view.dart';
import 'package:final_project/feature/pages/profile/view_model/foundation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _homeViewModel = ChangeNotifierProvider<FoundationViewModel>((ref) {
  return FoundationViewModel();
});

class FoundationProfileView extends ConsumerStatefulWidget {
  final FoundationModel? foundationModel;
  const FoundationProfileView({@required this.foundationModel, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FoundationProfileViewState();
}

class _FoundationProfileViewState extends ConsumerState<FoundationProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(widget.foundationModel!.name!),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          contentTitle(title: 'Mail'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.foundationModel!.mail!,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          contentTitle(title: 'Telefon'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.foundationModel!.phone!,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          contentTitle(title: 'Açıklama'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.foundationModel!.description!,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          contentTitle(title: 'Etkinlikler'),
          FutureBuilder<void>(
            future: ref.read(_homeViewModel).getAllEvents(
                foundationId: widget.foundationModel!.id.toString()),
            builder: (context, snapshot) {
              return Column(
                  children: ref.read(_homeViewModel).allEvents.isNotEmpty
                      ? ref.read(_homeViewModel).allEvents.map((e) {
                          return eventCardContainer(
                              context: context, eventModel: e);
                        }).toList()
                      : []);
            },
          ),
        ],
      )),
    );
  }

  InkWell eventCardContainer({BuildContext? context, Events? eventModel}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(
              eventModel: EventModel(
                id: eventModel.id,
                foundationID: eventModel.foundationID,
                locationID: eventModel.locationID,
                location: eventModel.location as LocationModel,
                dateTime: eventModel.dateTime,
                foundation: widget.foundationModel,
                name: eventModel.name,
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Container(
          height: context!.height * 0.25,
          width: context.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: context.height * 0.16,
                width: context.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(widget.foundationModel!.logo!))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 8,
                ),
                child: Text(
                  widget.foundationModel!.name!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 4,
                ),
                child: Text(
                  eventModel!.name!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding contentTitle({@required String? title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
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
