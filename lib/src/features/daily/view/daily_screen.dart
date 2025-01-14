import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/features/daily/bloc/daily_bloc.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({super.key});

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DailyBloc>();
    return Scaffold(
      body: BlocBuilder<DailyBloc, DailyState>(
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
          return Center(child: Text('Немає цілей.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(AddDailyTask('Нова ціль.'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
