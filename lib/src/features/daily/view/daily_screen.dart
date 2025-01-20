import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/features/app/bloc/app_bloc.dart';
import 'package:schedule/src/features/daily/bloc/daily_bloc.dart';
import 'package:schedule/src/utils/constants/sizes.dart';
import 'package:schedule/src/utils/formatters/date_helper.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({super.key});

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  TextEditingController _dailyController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  DateTime? _pickedDate;

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final bloc = context.read<DailyBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Плани'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<DailyBloc, DailyState>(
          builder: (context, state) {
            if (state is DailyLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DailyLoaded) {
              return ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  final task = state.tasks[index];
                  return ListTile(
                    title: Text(
                      task.title,
                      style: TextStyle(
                          decoration: task.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                            fontSize: ScheduleSizes.fontSizeLg),
                    ),
                    subtitle: Text(
                      task.description.length > 30
                          ? task.description.substring(0, 30) + '...'
                          : task.description,
                      style: TextStyle(
                          decoration: task.isCompleted
                              ? TextDecoration.lineThrough
                              : null),
                    ),
                    leading: Checkbox(
                        value: task.isCompleted,
                        onChanged: (_) {
                          setState(() {
                            if (task.id != null) {
                              bloc.add(ToggleDailyStatus(user.id, task.id!));
                            }
                          });
                        }),
                    onLongPress: () {
                      if (task.id != null) {
                        bloc.add(DeleteDailyTask(user.id, task.id!));
                      }
                    },
                  );
                },
              );
            } else {
              return Center(child: Text('Цілей поки немає.'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context, bloc, user);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context, DailyBloc bloc, User user) {
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
                  labelText: 'Введіть заголовок цілі',
                ),
              ),
              SizedBox(height: ScheduleSizes.spaceBetweenItems),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Введіть опис цілі',
                ),
              ),
              SizedBox(height: ScheduleSizes.spaceBetweenItems),
              TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Оберіть дату',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  _pickedDate = await _selectDate();
                  if (_pickedDate != null) {
                    _dateController.text = DateHelper.formatDate(_pickedDate!);
                  }
                },
              ),
              SizedBox(height: ScheduleSizes.spaceBetweenItems),
              ElevatedButton(
                onPressed: () {
                  final taskTitle = _dailyController.text.trim();
                  final taskDescription = _descriptionController.text.trim();
                  if (taskTitle.isNotEmpty &&
                      taskDescription.isNotEmpty &&
                      _pickedDate != null) {
                    bloc.add(AddDailyTask(
                      user.id,
                      taskTitle,
                      taskDescription,
                      _pickedDate!,
                    ));
                    _dailyController.clear();
                    _descriptionController.clear();
                    _dateController.clear();
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

  Future<DateTime?> _selectDate() async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: currentDate,
        lastDate: DateTime(2100));
    if (selectedDate != null) {
      return selectedDate;
    }
    return null;
  }

  @override
  void dispose() {
    _dailyController.dispose();
    super.dispose();
  }
}
