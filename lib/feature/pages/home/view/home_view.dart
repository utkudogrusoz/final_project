import 'dart:ui';

import 'package:final_project/core/extensions/context_extension.dart';
import 'package:final_project/feature/models/event_model.dart';
import 'package:final_project/feature/models/response/event/all_events_response_model.dart';
import 'package:final_project/feature/pages/detail/view/detail_view.dart';
import 'package:final_project/feature/pages/home/view_model/home_view_model.dart';
import 'package:final_project/feature/pages/profile/view/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _homeViewModel = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel();
});

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViweState();
}

class _HomeViweState extends ConsumerState<HomeView> {
  late double offset;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    setState(() {
      offset = _scrollController.initialScrollOffset;
    });
    _scrollController.addListener(() {
      setState(() {
        offset = _scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: Stack(
            children: [
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    backgroundColor: offset > 0
                        ? Colors.amber.withOpacity(0.8)
                        : Colors.amber,
                    expandedHeight: context.height / 8,
                    floating: false,
                    pinned: true,
                    toolbarHeight: context.height / 10,
                    elevation: 6,
                    shadowColor: offset > 0
                        ? Colors.amber.withOpacity(0.8)
                        : Colors.amber,
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                    ),
                    centerTitle: false,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              ref.read(_homeViewModel).userHive.get('name') !=
                                      null
                                  ? 'Hoşgeldin, ${ref.read(_homeViewModel).userHive.get('name')}'
                                  : ' Hoşgeldin',
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: context.height / 281,
                            ),
                            const Text(
                              'Gönüllüyüz',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserProfileView()));
                          },
                          icon: Icon(
                            Icons.person_outline,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    flexibleSpace: SizedBox(
                      height: context.height,
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: const FlexibleSpaceBar(),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: FutureBuilder<void>(
                        future: ref.read(_homeViewModel).getAllEvents(),
                        builder: (context, snapshot) {
                          return Column(
                              children: ref
                                      .read(_homeViewModel)
                                      .allEvents
                                      .isNotEmpty
                                  ? ref.read(_homeViewModel).allEvents.map((e) {
                                      return eventCardContainer(
                                          context: context, eventModel: e);
                                    }).toList()
                                  : []);
                        }),
                  ),
                ],
              ),
              /*  usernameTextField(
                  context: context,
                  ref: ref,
                  welcomeViewModel: widget.welcomeViewModel,
                  welcomeNotifier: welcomeNotifier,
                  scrollController: _scrollController),*/
            ],
          ),
        ),
      ),
    );
  }

  InkWell eventCardContainer({BuildContext? context, EventModel? eventModel}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(eventModel: eventModel),
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
                        image: NetworkImage(eventModel!.foundation!.logo!))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 8,
                ),
                child: Text(
                  eventModel!.foundation!.name!,
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
                  eventModel.name!.length > 40
                      ? eventModel.name!.substring(0, 40) + '...'
                      : eventModel.name!,
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
}
