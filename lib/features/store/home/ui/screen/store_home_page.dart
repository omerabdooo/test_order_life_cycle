import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/setup_service_locator.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/features/store/home/data/repos/all_order_repo_impl.dart';
import 'package:test_order_life_cycle/features/store/home/domain/usecases/all_order_usecase.dart';
import 'package:test_order_life_cycle/features/store/home/ui/manger/cubit/all_order_cubit.dart';
import 'package:test_order_life_cycle/features/store/home/ui/widget/store_home_page_item_widget.dart';
import 'package:test_order_life_cycle/features/store/home/ui/widget/store_home_page_order_widget.dart';

class StoreHomePage extends StatefulWidget {
  const StoreHomePage({super.key});

  @override
  State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllOrderCubit(AllOrderUsecase(
        getit<AllOrderRepoImpl>(),
      )),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: TabBar(
                indicatorWeight: 4.w,
                dividerColor: AppColors.scaffColor,
                indicatorColor: AppColors.redDark,
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.black,
                tabs: [
                  Tab(
                    child: Text("الطلبات", style: KTextStyle.tabs),
                  ),
                  Tab(
                    child: Text(
                      "الاصناف",
                      style: KTextStyle.tabs,
                    ),
                  ),
                ]),
          ),
          body: const TabBarView(
            children: [
              StoreHomePageOrderWidget(),
              ///////////////////////////
              StoreHomePageItemWidget()
            ],
          ),
        ),
      ),
    );
  }
}
