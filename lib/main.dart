import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:seenear/core/init/di/locator.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:seenear/src/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_API_KEY']!);
  // 상태바 투명화
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark));
  // GetIt 초기화
  setupLocator();
  // 화면을 세로로 고정
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorSystem.orange,
          primary: ColorSystem.orange,
          brightness: Brightness.light,
        ),
        fontFamily: 'pretendard',
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ko', 'KR')],
      routerConfig: configRouter,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Capture"),
      ),
      body: const Center(
        child: Text("Screen Capture"),
      ),
    );
  }
}
