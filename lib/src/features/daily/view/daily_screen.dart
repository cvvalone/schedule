import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/features/daily/bloc/daily_bloc.dart';
import 'package:schedule/src/utils/constants/sizes.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({super.key});

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  TextEditingController _dailyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DailyBloc>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<DailyBloc, DailyState>(
          builder: (context, state) {
            if (state is DailyLoaded) {
              return ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  final task = state.tasks[index];
                  return ListTile(
                    title: Text(task.title),
                    trailing: IconButton(
                      icon: Icon(task.isCompleted
                          ? Icons.check_box
                          : Icons.check_box_outline_blank),
                      onPressed: () => bloc.add(ToggleDailyStatus(task.id)),
                    ),
                    onLongPress: () {
                      bloc.add(DeleteDailyTask(task.id));
                    },
                  );
                },
              );
            }
            return Center(child: Text('Цілей поки немає.'));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showAddTaskDialog(context, bloc);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context, DailyBloc bloc) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(ScheduleSizes.borderRadiusMd)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _dailyController,
                decoration: InputDecoration(
                  labelText: 'Введіть нову ціль',
                ),
              ),
              SizedBox(height: ScheduleSizes.spaceBetweenItems),
              ElevatedButton(
                onPressed: () {
                  final taskTitle = _dailyController.text.trim();
                  if(taskTitle.isNotEmpty){
                    bloc.add(AddDailyTask(_dailyController.text));
                    _dailyController.clear();
                    Navigator.pop(context);
                  }
                },
                child: Text('Додати'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _dailyController.dispose();
    super.dispose();
  }
}
