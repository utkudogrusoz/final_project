import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widget/text/auth_title_text.dart';
import '../../../widget/textfield/auth_text_field.dart';
import '../../home/view/home_view.dart';
import '../view_model/auth_view_model.dart';

final _authViewModel = ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel();
});

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<RegisterView> {
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        print(ref.read(_authViewModel).loginTextEditingController!.text);
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              title: const AuthTitleText(
                title: 'Kayıt Ol',
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              scrolledUnderElevation: 0,
              toolbarHeight: 50,
              collapsedHeight: 50,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 73,
                  ),
                  AuthTextField(
                    labelText: 'İsim',
                    keyboardType: TextInputType.text,
                    textEditingController: ref
                        .read(_authViewModel)
                        .registerNameTextEditingController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AuthTextField(
                    labelText: 'Soyisim',
                    keyboardType: TextInputType.text,
                    textEditingController: ref
                        .read(_authViewModel)
                        .registerSurnameTextEditingController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AuthTextField(
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: ref
                        .read(_authViewModel)
                        .registerMailTextEditingController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AuthTextField(
                    keyboardType: TextInputType.visiblePassword,
                    labelText: 'Şifre',
                    textEditingController: ref
                        .read(_authViewModel)
                        .registerPasswordTextEditingController,
                    textIsHidden: ref.watch(_authViewModel).passwordVisibility,
                    onPressed: () {
                      ref.read(_authViewModel).changePasswordVisibility();
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AuthTextField(
                    labelText: 'Telefon',
                    keyboardType: TextInputType.phone,
                    textEditingController: ref
                        .read(_authViewModel)
                        .registerPhoneFTextEditingController,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll(4),
                        shadowColor: MaterialStatePropertyAll(Colors.amber),
                        maximumSize:
                            const MaterialStatePropertyAll(Size(343, 48)),
                        minimumSize:
                            const MaterialStatePropertyAll(Size(343, 48)),
                        backgroundColor: MaterialStatePropertyAll(Colors.amber),
                      ),
                      onPressed: () async {
                        await ref
                            .read(_authViewModel)
                            .register(context: context);
                      },
                      child: Text('Kayıt Ol'),
                    ),
                  ),
                  const SizedBox(
                    height: 194,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
