import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule/src/data/repos/schedule/schedule_repository.dart';
import 'package:schedule/src/features/profile/widget/profile_screen.dart';
import 'package:schedule/src/features/schedule/bloc/schedule_bloc.dart';
import 'package:schedule/src/features/schedule/view/schedule_screen.dart';
import 'package:schedule/src/features/today/view/today_screen.dart';
import 'package:schedule/src/utils/constants/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        controller: _pageController,
        children: [
          TodayScreen(),
          BlocProvider(
            create: (context) {
              final repository = GetIt.instance<ScheduleRepository>();
              // final bool isEven = DateHelper.isEvenWeek(DateTime.now());
              return ScheduleBloc(repository: repository)
                ..add(ScheduleEvent.loadSchedule());
            },
            child: ScheduleMainScreen(),
          ),
          // BlocProvider(
          //   create: (context) {
          //     final DailyRepository repository = DailyRepository();
          //     return DailyBloc(repository: repository);
          //       // ..add(LoadDailyTask(user.id));
          //   },
          //   child: DailyScreen(),
          // ),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(ScheduleImages.todayIconActive),
            icon: SvgPicture.asset(ScheduleImages.todayIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(ScheduleImages.weekIconActive),
            icon: SvgPicture.asset(ScheduleImages.weekIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(ScheduleImages.profileIconActive),
            icon: SvgPicture.asset(ScheduleImages.profileIcon),
            label: '',
          )
        ],
      ),
    );
  }
}
