import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'screens/dashboard_screen.dart';

class AppLanguageProvider extends ChangeNotifier {
  String _currentLanguage = 'EN';
  String get currentLanguage => _currentLanguage;
  
  void setLanguage(String lang) {
    _currentLanguage = lang;
    notifyListeners();
  }

  String translate(String text) {
    if (_currentLanguage == 'EN' || _currentLanguage == 'Phonetic') return text;
    
    const tamilDict = {
      'Dashboard': 'முகப்பு',
      'Tamil99 Typing': 'தமிழ்99 தட்டச்சு',
      'English → Tamil': 'ஆங்கிலம் → தமிழ்',
      'Voice to Text': 'குரல் வழி உரை',
      'Text Editor': 'உரை திருத்தி',
      'Learn Tamil': 'தமிழ் கற்க',
      'Typing Practice': 'தட்டச்சுப் பயிற்சி',
      'Government Forms': 'அரசு படிவங்கள்',
      'Documents & PDF': 'ஆவணங்கள் & PDF',
      'Keyboard API & SDK': 'விசைப்பலகை API & SDK',
      'Settings': 'அமைப்புகள்',
      'Help & Support': 'உதவி & ஆதரவு',
      'Tamil99 Smart Typing Suite': 'தமிழ்99 திறன்மிக்க தட்டச்சு தளம்',
      'Enterprise Desktop IME Platform & Gov Cloud Sync': 'எண்டர்பிரைஸ் டெஸ்க்டாப் IME தளம் & அரசு கிளவுட் ஒத்திசைவு',
      'Search commands...': 'கட்டளைகளை தேடுக...',
      'TN Gov Cloud Synced': 'TN அரசு கிளவுட் ஒத்திசைவு',
      'Recent Documents': 'சமீபத்திய ஆவணங்கள்',
      'Quick Actions': 'விரைவான செயல்கள்',
      'Usage Statistics': 'பயன்பாட்டு புள்ளிவிவரங்கள்',
      'Getting Started': 'தொடங்குதல்',
      'This module is currently under development.': 'இந்த தொகுதி தற்போது உருவாக்கத்தில் உள்ளது.',
      'Cloud Sync Status': 'கிளவுட் ஒத்திசைவு நிலை',
      'Notifications': 'அறிவிப்புகள்',
      'No new notifications at this time.': 'தற்போது புதிய அறிவிப்புகள் இல்லை.',
      'Close': 'மூடு',
    };
    
    return tamilDict[text] ?? text;
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
      ],
      child: const Tamil99App(),
    ),
  );
}

class Tamil99App extends StatelessWidget {
  const Tamil99App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tamil99 Smart Typing Suite',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const DashboardScreen(),
    );
  }
}
