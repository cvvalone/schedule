import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:schedule/src/features/settings/bloc/settings/settings_bloc.dart';
import 'package:schedule/src/utils/constants/colors.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final calcWidth = width - width * 0.1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Про нас'),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(2),
            child: Container(
              height: 2,
              color: ScheduleColors.greyColor,
              width: calcWidth,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Цей застосунок розроблений командою:',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Gap(10),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10),
                  Text(
                    '• UI/UX design: Шевчук Ростислав (інтуїтивний інтерфейс та візуальна концепція).',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Gap(10),
                  Text(
                    '• User UI: Приймук Павло (користувацький інтерфейс).',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Gap(10),
                  Text(
                    '• AdminPanel:  Печериця Дмитро(панель керування даними розкладу).',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Gap(10),
                  Text(
                    '• Backend: Чорноморець Назар (архітектура та логіка серверної частини).',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Gap(10),
                  Text(
                    '• Керівник проєкту: Кренцін Михайло',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Gap(10),
                ],
              ),
            ),
            Text(
              'Наша мета — перетворити перегляд розкладу на просту та зрозумілу взаємодію. Завдяки чіткій структурі, адаптивному дизайну та моментальному доступу до даних, студенти отримують усю необхідну інформацію: заняття, аудиторії, викладачі — у кілька дотиків.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
