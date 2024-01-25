import 'package:final_project/core/extensions/context_extension.dart';
import 'package:final_project/feature/pages/detail/view_model/detail_view_model.dart';
import 'package:final_project/feature/pages/profile/view/foundation_profile_view.dart';
import 'package:final_project/feature/widget/textfield/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/event_model.dart';

final _detailViewModel = ChangeNotifierProvider<DetailViewModel>((ref) {
  return DetailViewModel();
});

class DetailView extends ConsumerStatefulWidget {
  final EventModel? eventModel;
  const DetailView({@required this.eventModel, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailViewState();
}

class _DetailViewState extends ConsumerState<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showButtonDialog(context);
              },
              child: Container(
                height: context.height * 0.07,
                width: widget.eventModel!.locationID! == 1
                    ? context.width / 1.1
                    : context.width / 2.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueAccent,
                ),
                child: Center(
                  child: Text(
                    'Bağış Yap',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
          widget.eventModel!.locationID! != 1
              ? InkWell(
                  onTap: () {
                    ref
                        .read(_detailViewModel)
                        .registerToEvent(eventId: widget.eventModel!.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                        height: context.height * 0.07,
                        width: context.width / 2.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.redAccent,
                        ),
                        child: Center(
                          child: Text(
                            'Etkinliğe Katıl',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
      backgroundColor: Colors.grey.shade50,
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

  void showButtonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bağışlanacak Ücret'),
          content: AuthTextField(
              keyboardType: TextInputType.number,
              labelText: 'Bağış Ücreti',
              textEditingController:
                  ref.watch(_detailViewModel).donationTextfield),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () {
                ref.read(_detailViewModel).donateToFoundation(
                    foundationId: widget.eventModel!.foundationID.toString());
                Navigator.of(context).pop();
              },
              child: Text('Bağış Yap'),
            ),
          ],
        );
      },
    );
  }
}
