import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/user/current_user_model.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view/widgets/custom_button.dart';
import 'package:la_vie/view/widgets/custom_textfield.dart';
import 'package:la_vie/view_model/proile_cubit/profile_cubit.dart';
import 'package:path/path.dart';

class ProfileEditScreen extends StatefulWidget {
  UserData userData;

  ProfileEditScreen({Key? key, required this.userData}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    firstNameCtrl.value =
        TextEditingValue(text: widget.userData.firstName ?? '');
    lastNameCtrl.value = TextEditingValue(text: widget.userData.lastName ?? '');
    emailCtrl.value = TextEditingValue(text: widget.userData.email ?? '');
    addressCtrl.value = TextEditingValue(text: widget.userData.address ?? '');
  }

  @override
  void dispose() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    emailCtrl.dispose();
    addressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          Navigator.pop(context, true);
        }
      },
      builder: (context, state) {
        ProfileCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Edit Profile',
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(AppPadding.screenPadding),
            children: [
              //Form
              Form(
                key: formKey,
                child: Column(
                  children: [
                    //General information
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.cardPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'General Information',
                                style: getSemiBoldStyle(
                                    color: ColorManager.primary,
                                    fontSize: FontSize.f20),
                              ),
                            ),
                            Space(height: 20),
                            CircleAvatar(
                              backgroundColor: ColorManager.primary,
                              radius: 78,
                              child: SizedBox(
                                width: 150,
                                height: 150,
                                child: ClipOval(
                                  child: CustomNetworkImage(
                                      image: widget.userData.imageUrl!,
                                      withBaseUrl: false),
                                ),
                              ),
                            ),
                            Space(height: 30),
                            CustomTextField(
                                controller: firstNameCtrl, label: 'First Name'),
                            Space(),
                            CustomTextField(
                                controller: lastNameCtrl, label: 'Last Name'),
                            Space(),
                            CustomTextField(
                                controller: emailCtrl, label: 'Last Name'),
                            Space(),
                            CustomTextField(
                                controller: addressCtrl, label: 'Address'),
                            Space(),
                          ],
                        ),
                      ),
                    ),
                    Space(),

                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: CustomButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            cubit.updateCurrentUser(
                                firstName: firstNameCtrl.text,
                                lastName: lastNameCtrl.text,
                                email: emailCtrl.text,
                                address: addressCtrl.text);
                          }
                        },
                        child: state is UpdateProfileLoading ? Loading() : Text('Save Changes', style: getMediumStyle(color: ColorManager.white, fontSize: FontSize.f20),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
