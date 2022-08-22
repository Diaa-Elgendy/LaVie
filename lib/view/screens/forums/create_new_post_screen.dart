import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view/widgets/custom_button.dart';
import 'package:la_vie/view/widgets/custom_textfield.dart';
import 'package:la_vie/view_model/forums_cubit/forums_cubit.dart';

class CreateNewPostScreen extends StatefulWidget {
  CreateNewPostScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPostScreen> createState() => _CreateNewPostScreenState();
}

class _CreateNewPostScreenState extends State<CreateNewPostScreen> {
  final ImagePicker imagePicker = ImagePicker();

  XFile? image;
  String? image64;

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumsCubit, ForumsState>(
      listener: (context, state) {
        if (state is CreatePostSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        ForumsCubit cubit = ForumsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Create New Post'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(AppPadding.screenPadding),
            children: [
              Center(
                //Todo: if file.isEmpty show inkWell else Show Image
                child: InkWell(
                  onTap: () async {
                    image = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    image64 = cubit.imageToBase64(image!);
                  },
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.primary,
                        width: 1,
                      ),
                    ),
                    child: image != null
                        ? Image.file(
                            File(
                              image!.path,
                            ),
                            fit: BoxFit.cover,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: ColorManager.primary,
                              ),
                              Space(),
                              Text(
                                'Add Photo',
                                style: getRegularStyle(
                                    fontSize: FontSize.f14,
                                    color: ColorManager.primary),
                              )
                            ],
                          ),
                  ),
                ),
              ),
              Space(height: 50),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(controller: titleCtrl, label: 'Title'),
                    Space(height: 30),
                    CustomTextField(
                      controller: descriptionCtrl,
                      label: 'Description',
                      maxLines: 8,
                    ),
                    Space(height: 50),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: CustomButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            cubit.createNewPost(
                              title: titleCtrl.text,
                              description: descriptionCtrl.text,
                              image64: image64 ?? '',
                              context: context,
                            );
                          }
                        },
                        child: state is CreatePostLoading
                            ? Loading()
                            : Text(
                                'Post',
                                style: getMediumStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.f18),
                              ),
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
