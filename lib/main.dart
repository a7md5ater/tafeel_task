import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafeel_task/app/app.dart';
import 'package:tafeel_task/app/bloc_observer.dart';
import 'package:tafeel_task/app/injector.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  widgetsBinding.deferFirstFrame();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  widgetsBinding.allowFirstFrame();
  runApp(const MyApp());
}
