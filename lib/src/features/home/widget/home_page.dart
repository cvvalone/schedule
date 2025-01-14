import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/features/app/bloc/app_bloc.dart';
import 'package:schedule/src/features/daily/bloc/daily_bloc.dart';
import 'package:schedule/src/features/daily/view/daily_screen.dart';
import 'package:schedule/src/features/home/widget/home_screen.dart';

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
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final String? photo = user.photo;
    return Scaffold(
      appBar: AppBar(
        title: const Text('VTFC'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutPressed());
            },
          ),
        ],
      ),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        controller: _pageController,
        children: [
          HomeScreen(
            photo: photo,
            user: user,
          ),
          Scaffold(
            body: Text("Second"),
          ),
          BlocProvider(
            create: (context) => DailyBloc(),
            child: DailyScreen(),
          ),
          Scaffold(
            body: Text("fourth"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Сьогодні',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_week),
            label: 'Розклад',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Плани',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            tooltip: 'Налаштування',
            label: 'Налаштування',
          )
        ],
      ),
    );
  }
}
