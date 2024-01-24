import 'package:final_project/core/extensions/context_extension.dart';
import 'package:final_project/feature/pages/profile/view/foundation_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/event_model.dart';

class DetailView extends ConsumerStatefulWidget {
  final EventModel? eventModel;
  const DetailView({@required this.eventModel, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailViewState();
}

class _DetailViewState extends ConsumerState<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoundationProfileView(
                          foundationModel: widget.eventModel!.foundation)));
            },
            child: Text(widget.eventModel!.foundation!.name!)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          detailImage(context),
          contentTitle(title: 'Açıklama'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.eventModel!.name!,
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
          contentTitle(title: 'Lokasyon'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.eventModel!.location!.city!,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ],
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

  Container detailImage(BuildContext context) {
    return Container(
      height: context.height * 0.20,
      width: context.width,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage(widget.eventModel!.foundation!.logo!),
        ),
      ),
    );
  }
}
