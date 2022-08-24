import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/routes_manager.dart';
import 'package:la_vie/view/resources/string_manager.dart';
import 'package:la_vie/view/screens/profile/profile_edit_screen.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/local_data/shared_pref/cache_helper.dart';
import 'package:la_vie/view_model/proile_cubit/profile_cubit.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/custom_scaffold.dart';
import '../authorize/authorize_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        ProfileCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: CustomNetworkChecker(
            child: state is GetCurrentUserSuccess
                ? ListView(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          //Darken Background
                          SizedBox(
                            height: 350,
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.85),
                                  BlendMode.darken),
                              child: CustomNetworkImage(
                                image: cubit.currentUserModel!.data!.imageUrl!,
                                withBaseUrl: false,
                              ),
                            ),
                          ),

                          //App Bar
                          Positioned(
                            top: 0,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: AppBar(
                                backgroundColor: Colors.transparent,
                                actions: [
                                  PopupMenuButton(
                                    icon: const Icon(
                                      Icons.more_horiz,
                                      color: ColorManager.white,
                                    ),
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          value: 0,
                                          child: Text(
                                            'Logout',
                                            style: getRegularStyle(
                                                fontSize: FontSize.f14),
                                          ),
                                        ),
                                      ];
                                    },
                                    onSelected: (value) {
                                      if (value == 0) {
                                        CacheHelper.clearData();
                                        StringManager.userToken = '';
                                        navigateAndFinish(
                                            context, const AuthorizeScreen());
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),

                          //Image with user name
                          Column(
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: ClipOval(
                                  child: CustomNetworkImage(
                                      image:
                                          cubit.currentUserModel!.data!.imageUrl!,
                                      radius: 40,
                                      withBaseUrl: false),
                                ),
                              ),
                              Space(height: 10),
                              Text(
                                '${cubit.currentUserModel!.data!.firstName} ${cubit.currentUserModel!.data!.lastName}',
                                style: getSemiBoldStyle(
                                    fontSize: FontSize.f26,
                                    color: ColorManager.white),
                              )
                            ],
                          ),

                          //Rounded Corners
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 10,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(AppSize.borderRadius),
                                    topRight:
                                        Radius.circular(AppSize.borderRadius)),
                                color: ColorManager.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.screenPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Point Container
                            Container(
                              padding:
                                  const EdgeInsets.all(AppPadding.cardPadding),
                              decoration: BoxDecoration(
                                color: ColorManager.primaryLight2,
                                borderRadius:
                                    BorderRadius.circular(AppSize.borderRadius),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AssetsManager.pointsIcon,
                                    width: 38,
                                    height: 38,
                                  ),
                                  Space(),
                                  //More than one point say show (points) else show (point)
                                  Text(
                                    'You have ${cubit.currentUserModel!.data!.userPoints ?? 0} ${(cubit.currentUserModel!.data!.userPoints ?? 0) > 1 ? 'points' : 'point'}',
                                    style: getMediumStyle(),
                                  )
                                ],
                              ),
                            ),
                            Space(),

                            Text(
                              'Edit Profile',
                              style: getMediumStyle(fontSize: FontSize.f20),
                            ),
                            Space(),
                            Card(
                              elevation: 1,
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.circular(AppSize.borderRadius),
                                onTap: () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileEditScreen(
                                            userData:
                                                cubit.currentUserModel!.data!)),
                                  );
                                  if (result == true) {
                                    cubit.getCurrentUser();
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(
                                      AppPadding.cardPadding),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorManager.textColor, width: 1),
                                    borderRadius: BorderRadius.circular(
                                        AppSize.borderRadius),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AssetsManager.editIcon,
                                        width: 30,
                                        height: 30,
                                      ),
                                      Text(
                                        '   Edit Your Profile',
                                        style: getRegularStyle(
                                            fontSize: FontSize.f18),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.arrow_forward_outlined,
                                        color: ColorManager.textColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Space(),
                          ],
                        ),
                      )
                    ],
                  )
                : state is GetCurrentUserLoading
                    ? Center(
                        child: Loading(
                          color: ColorManager.primary,
                        ),
                      )
                    : ErrorCard(
                        function: () {
                          cubit.getCurrentUser();
                        },
                        title: 'Retry',
                      ),
          ),
        );
      },
    );
  }
}
