import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view/widgets/empty_page.dart';
import 'package:la_vie/view/widgets/notification_item.dart';
import 'package:la_vie/view_model/proile_cubit/profile_cubit.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        ProfileCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Notification'),
          ),
          body: state is GetCurrentUserSuccess
              ? cubit.currentUserModel!.data!.userNotification!.isNotEmpty
              ? ListView.separated(
              itemBuilder: (context, index) =>
                  NotificationItem(
                      notification: cubit.currentUserModel!.data!
                          .userNotification![index]),
              separatorBuilder: (context, index) =>
              const Divider(
                  height: 0.5,
                  color: Colors.grey
              ),
              itemCount: cubit.currentUserModel!.data!
                  .userNotification!.length)
              : EmptyPage(header: 'No Available Notifications Right Now.')
              : state is GetCurrentUserLoading
              ? Loading(color: ColorManager.primary,)
              : ErrorCard(
            function: () {
              cubit.getCurrentUser();
            },
          ),
        );
      },
    );
  }
}
