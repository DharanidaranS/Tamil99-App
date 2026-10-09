import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'screens/dashboard_screen.dart';

class AppLanguageProvider extends ChangeNotifier {
  String _currentLanguage = 'ENG';
  String get currentLanguage => _currentLanguage;
  
  void setLanguage(String lang) {
    _currentLanguage = lang;
    notifyListeners();
  }

  String translate(String text) {
    if (_currentLanguage == 'ENG' || _currentLanguage == 'EN' || _currentLanguage == 'English' || _currentLanguage == 'Phonetic') return text;
    
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
      'Choose a workspace': 'பணியிடத்தை தேர்வு செய்க',
      'Fast IME Launch': 'விரைவான IME தொடக்கம்',
      'Type directly using official Tamil99 layout with live glyph preview & intelligent automatic uyirmei fusion.': 'நேரடி விசைப்பலகை காட்சி மற்றும் அறிவார்ந்த தானியங்கு உயிர்மெய் இணைப்புடன் அதிகாரப்பூர்வ தமிழ்99 அமைப்பைப் பயன்படுத்தி தட்டச்சு செய்க.',
      'Launch Tamil99 Mode': 'தமிழ்99 முறையைத் தொடங்கு',
      'Phonetic transliteration in real-time with Tamil word predictor.': 'தமிழ் சொல் கணிப்பானுடன் நேரடி ஒலிபெயர்ப்பு.',
      'Phonetic Tamil': 'ஒலிப்பியல் தமிழ்',
      'Launch Phonetic Engine': 'ஒலிப்பியல் இயந்திரத்தைத் தொடங்கு',
      'Tamil Voice to Text': 'தமிழ் குரல் வழி உரை',
      'Speak naturally in Tamil dialects with automated comma, thodarbu and full stop punctuation recognition.': 'தானியங்கு கமா, தொடர்பு மற்றும் முற்றுப்புள்ளி நிறுத்தற்குறி அங்கீகாரத்துடன் தமிழ் வட்டார வழக்குகளில் இயல்பாக பேசுங்கள்.',
      'Whisper Tamil v2': 'விஸ்பர் தமிழ் v2',
      'Start Voice Dictation': 'குரல் தட்டச்சை தொடங்கு',
      'New Tamil Document': 'புதிய தமிழ் ஆவணம்',
      'Draft an A4 official office note, state petition, circular letter, or academic research script with Tamil headers.': 'தமிழ் தலைப்புகளுடன் ஒரு A4 அதிகாரப்பூர்வ அலுவலக குறிப்பு, மாநில மனு, சுற்றறிக்கை அல்லது கல்வி ஆராய்ச்சி ஸ்கிரிப்டை வரைவு செய்க.',
      'Unicode Editor': 'யுனிகோட் திருத்தி',
      'Open Blank Canvas': 'வெற்றுப் பக்கத்தைத் திற',
      'Frequently Asked Questions': 'அடிக்கடி கேட்கப்படும் கேள்விகள்',
      'Quick answers to common issues': 'பொதுவான சிக்கல்களுக்கான விரைவான பதில்கள்',
      'How do I switch to Tamil99 typing?': 'நான் எவ்வாறு தமிழ்99 தட்டச்சுக்கு மாறுவது?',
      'Go to the Settings page and select "Tamil99 Standard" under the Default Keyboard Layout dropdown.': 'அமைப்புகள் பக்கத்திற்குச் சென்று, இயல்புநிலை விசைப்பலகை கீழ்தோன்றும் பட்டியலில் "Tamil99 Standard" என்பதைத் தேர்ந்தெடுக்கவும்.',
      'How does Cloud Sync work?': 'கிளவுட் ஒத்திசைவு எவ்வாறு செயல்படுகிறது?',
      'Your documents and custom dictionary words are securely backed up to the TN Gov Cloud automatically.': 'உங்கள் ஆவணங்கள் மற்றும் தனிப்பயன் அகராதி சொற்கள் TN அரசு கிளவுட்டில் தானாகவே பாதுகாப்பாக காப்புப் பிரதி எடுக்கப்படுகின்றன.',
      'Can I use Voice to Text offline?': 'நான் குரல் வழி உரையை ஆஃப்லைனில் பயன்படுத்தலாமா?',
      'Yes, basic phonetic mapping works offline, but full Whisper recognition requires an active internet connection.': 'ஆம், அடிப்படை ஒலிப்பியல் மேப்பிங் ஆஃப்லைனில் செயல்படும், ஆனால் முழு விஸ்பர் அங்கீகாரத்திற்கு செயலில் உள்ள இணைய இணைப்பு தேவை.',
      'Is the Phonetic Tamil engine accurate?': 'ஒலிப்பியல் தமிழ் இயந்திரம் துல்லியமானதா?',
      'It uses an intelligent predictive model designed by Tamil University for over 98% accuracy in formal Tamil.': 'இது முறையான தமிழில் 98% க்கும் அதிகமான துல்லியத்திற்காக தமிழ் பல்கலைக்கழகத்தால் வடிவமைக்கப்பட்ட ஒரு அறிவார்ந்த கணிப்பு மாதிரியைப் பயன்படுத்துகிறது.',
      'Pulli Auto-join active (F Key)': 'புள்ளி தானியங்கு இணைப்பு செயல்படுகிறது (F விசை)',
      'Unicode: 0B85-0BD7': 'யுனிகோட்: 0B85-0BD7',
      'Copy Tamil': 'தமிழை நகலெடு',
      'Clear': 'அழி',
      'LIGATURE BUFFER:': 'இணைப்பு இடையகம்:',
      'Uyirmey composition confirmed via Tamil99 state engine': 'தமிழ்99 இயந்திரம் மூலம் உயிர்மெய் கலவை உறுதிப்படுத்தப்பட்டது',
      'Active Layer: ': 'செயலில் உள்ள அடுக்கு: ',
      'Primary (அ-ஔ / க்)': 'முதன்மை (அ-ஔ / க்)',
      'Productivity Orbit & Quick Launch': 'உற்பத்தித்திறன் சுற்றுப்பாதை & விரைவு தொடக்கம்',
      'Global Access Accelerators': 'உலகளாவிய அணுகல் முடுக்கிகள்',
      'Tamil99 Studio': 'தமிழ்99 ஸ்டுடியோ',
      'Master Canvas': 'முதன்மைத் திரை',
      'Phonetic Morph': 'ஒலிப்பியல் மாற்றம்',
      'Voice Orb': 'குரல் உருண்டை',
      'Acoustic Tamil': 'ஒலியியல் தமிழ்',
      'Typing Arena': 'தட்டச்சு அரங்கம்',
      'Sangam Sprint': 'சங்கம் ஸ்பிரிண்ட்',
      'PDF Studio': 'PDF ஸ்டுடியோ',
      'Unicode Print': 'யுனிகோட் அச்சு',
      'English to Tamil Phonetic Typing': 'ஆங்கிலத்திலிருந்து தமிழ் ஒலிப்பியல் தட்டச்சு',
      'Type in English (e.g. "vanakkam")...': 'ஆங்கிலத்தில் தட்டச்சு செய்யவும் (எ.கா. "vanakkam")...',
      'Translation will appear here...': 'மொழிபெயர்ப்பு இங்கே தோன்றும்...',
      'Tamil Voice to Text Dictation': 'தமிழ் குரல் முதல் உரை தட்டச்சு',
      'Listening for Tamil speech...': 'தமிழ் பேச்சைக் கேட்கிறது...',
      'Tap the microphone to start speaking': 'பேசத் தொடங்க மைக்ரோஃபோனைத் தட்டவும்',
      'Waiting for voice input...': 'குரல் உள்ளீட்டிற்காகக் காத்திருக்கிறது...',
      'Recent Documents & Forms': 'சமீபத்திய ஆவணங்கள் மற்றும் படிவங்கள்',
      '24 Indexed': '24 குறியீடுகள்',
      'Filter files...': 'கோப்புகளை வடிகட்டு...',
      'New': 'புதிய',
      'Tamil Nadu Government forms, legal petitions, circulars, and departmental manuscripts': 'தமிழ்நாடு அரசு படிவங்கள், சட்ட மனுக்கள், சுற்றறிக்கைகள் மற்றும் துறைசார் கையெழுத்துப் பிரதிகள்',
      'Tamil99 Key Guide': 'தமிழ்99 விசை வழிகாட்டி',
      'Status: All documents and settings are backed up to TN Gov Cloud.': 'நிலை: அனைத்து ஆவணங்களும் அமைப்புகளும் TN அரசு கிளவுட்டில் காப்புப் பிரதி எடுக்கப்பட்டுள்ளன.',
      'Available Forms': 'கிடைக்கும் படிவங்கள்',
      'Select a form from the left to begin filling it out.': 'நிரப்பத் தொடங்க, இடதுபுறத்தில் உள்ள படிவத்தைத் தேர்ந்தெடுக்கவும்.',
      'சமர்ப்பி (Submit)': 'சமர்ப்பி',
      'Form Submitted Successfully!': 'படிவம் வெற்றிகரமாக சமர்ப்பிக்கப்பட்டது!',
      'My Documents': 'எனது ஆவணங்கள்',
      'Select a document to preview.': 'முன்னோட்டத்திற்கு ஆவணத்தைத் தேர்ந்தெடுக்கவும்.',
      'Open': 'திற',
      'Download': 'பதிவிறக்கு',
      'Share': 'பகிர்',
      'Delete': 'நீக்கு',
      'Developer API & SDK': 'டெவலப்பர் API மற்றும் SDK',
      'Integrate our powerful Tamil99 typing engine directly into your own web or mobile applications.': 'எங்கள் சக்திவாய்ந்த தமிழ்99 தட்டச்சு எஞ்சினை உங்கள் சொந்த வலை அல்லது மொபைல் பயன்பாடுகளில் நேரடியாக ஒருங்கிணைக்கவும்.',
      'Your Secret API Key': 'உங்கள் ரகசிய API விசை',
      'API Key copied to clipboard!': 'API விசை நகலெடுக்கப்பட்டது!',
      'Copy Key': 'விசையை நகலெடு',
      'Quick Integration Guide': 'விரைவான ஒருங்கிணைப்பு வழிகாட்டி',
      'HTML / JS Widget': 'HTML / JS விட்ஜெட்',
      'Find answers to common questions or reach out to our support team.': 'பொதுவான கேள்விகளுக்கான பதில்களைக் கண்டறியவும் அல்லது எங்கள் ஆதரவுக் குழுவைத் தொடர்பு கொள்ளவும்.',
      'Frequently Asked Questions (FAQ)': 'அடிக்கடி கேட்கப்படும் கேள்விகள் (FAQ)',
      'Is my typing data saved online?': 'எனது தட்டச்சுத் தரவு ஆன்லைனில் சேமிக்கப்பட்டுள்ளதா?',
      'No, your typing practice stats and text editor documents are saved completely offline on your local device.': 'இல்லை, உங்கள் தட்டச்சுப் பயிற்சி புள்ளிவிவரங்கள் மற்றும் உரை ஆவணங்கள் உங்கள் சாதனத்தில் ஆஃப்லைனில் சேமிக்கப்படும்.',
      'How can I use this keyboard in other apps?': 'பிற பயன்பாடுகளில் இந்த விசைப்பலகையை எவ்வாறு பயன்படுத்துவது?',
      'You can check the "Keyboard API & SDK" section to learn how to integrate our open-source typing engine into your own apps or web platforms.': 'எங்கள் ஓப்பன் சோர்ஸ் தட்டச்சு எஞ்சினை உங்கள் சொந்த பயன்பாடுகள் அல்லது வலை தளங்களில் எவ்வாறு ஒருங்கிணைப்பது என்பதை அறிய "கீபோர்டு API & SDK" பகுதியைப் பார்க்கவும்.',
      'How does the voice typing work?': 'குரல் தட்டச்சு எவ்வாறு செயல்படுகிறது?',
      'Voice typing utilizes your device\'s built-in speech recognition to transcribe spoken Tamil into text. Click the mic icon to start speaking.': 'உங்கள் சாதனத்தின் உள்ளமைக்கப்பட்ட பேச்சை அறிந்துகொள்ளும் திறனைப் பயன்படுத்தி குரல் தட்டச்சு செயல்படுகிறது. பேசத் தொடங்க மைக் ஐகானைக் கிளிக் செய்யவும்.',
      'Resources & Legal': 'வளங்கள் & சட்டம்',
      'Detailed User Guide': 'விரிவான பயனர் கையேடு',
      'Privacy Policy': 'தனியுரிமைக் கொள்கை',
      'Terms of Service': 'சேவை விதிமுறைகள்',
      'Contact Us': 'எங்களை தொடர்பு கொள்ள',
      'Your Email': 'உங்கள் மின்னஞ்சல்',
      'How can we help you?': 'நாங்கள் உங்களுக்கு எப்படி உதவ முடியும்?',
      'Message sent to support! We will reply soon.': 'ஆதரவுக்கு செய்தி அனுப்பப்பட்டது! விரைவில் பதிலளிப்போம்.',
      'Please enter a message first.': 'முதலில் ஒரு செய்தியை உள்ளிடவும்.',
      'Send Message': 'செய்தி அனுப்பு',
      'Tamil99 App v1.0.0\nMade with ❤️ for Tamil': 'தமிழ்99 செயலி v1.0.0\nதமிழுக்காக ❤️ உடன் உருவாக்கப்பட்டது',
      'TN Govt Circular Draft': 'தமிழக அரசு சுற்றறிக்கை வரைவு',
      'Save Draft': 'வரைவை சேமி',
      'Draft saved successfully!': 'வரைவு வெற்றிகரமாக சேமிக்கப்பட்டது!',
      'Words:': 'சொற்கள்:',
      'Learn Tamil Basics': 'தமிழ் அடிப்படைகளை கற்கவும்',
      'Vowels (Uyir)': 'உயிர் எழுத்துக்கள்',
      'Consonants (Mei)': 'மெய்யெழுத்துக்கள்',
      'Typing Practice Arena': 'தட்டச்சு பயிற்சி களம்',
      'Restart': 'மீண்டும் தொடங்கு',
      'Speed': 'வேகம்',
      'Accuracy': 'துல்லியம்',
      'Progress': 'முன்னேற்றம்',
      'Start typing the text above...': 'மேலே உள்ள உரையைத் தட்டச்சு செய்யத் தொடங்குங்கள்...',
      'Tip #14': 'உதவிக்குறிப்பு #14',
      'Did you know? Pressing produces க் (kKa), and produces the grantha ligature ஸ்ரீ.': 'உங்களுக்குத் தெரியுமா? க் மற்றும் அ அழுத்துவது க (kKa) உருவாக்கும், மற்றும் கிரந்த எழுத்தான ஸ்ரீ உருவாக்கும்.',
      'Flagship IME': 'முன்னணி தட்டச்சு',
      'TAMIL99 WORKSPACE': 'தமிழ்99 பணியிடம்',
      'Engine v2.4 Active': 'இயந்திரம் v2.4 செயலில் உள்ளது',
      'Tamil99 IME': 'தமிழ்99 விசைப்பலகை',
      'Kavitha R. (Govt. Dept)': 'கவிதா R. (அரசு துறை)',
      'Enterprise License': 'நிறுவன உரிமம்',
      'Tamil typing, made simple': 'தமிழ் தட்டச்சு, மிகவும் எளிமையானது',
      'Choose a workspace to start typing, translate, or work with Tamil text.': 'தமிழ் உரையுடன் தட்டச்சு செய்ய, மொழிபெயர்க்க அல்லது பணிபுரிய ஒரு பணியிடத்தைத் தேர்ந்தெடுக்கவும்.',
      'Start typing in Tamil99...': 'தமிழ்99 இல் தட்டச்சு செய்யத் தொடங்கவும்...',
      'Start writing here...': 'இங்கே எழுதத் தொடங்குங்கள்...',
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
