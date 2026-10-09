import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../theme/app_theme.dart';
import 'tamil99_typing_module.dart';
import 'package:audioplayers/audioplayers.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _selectedItem = 'Dashboard';

  void _onNavigate(String title) {
    setState(() {
      _selectedItem = title;
    });
  }

  Widget _buildMainContent() {
    if (_selectedItem == 'Dashboard') {
      return const DashboardHomeContent();
    }
    
    return Expanded(
      child: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppTheme.background,
              child: _buildModuleContent(_selectedItem),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleContent(String pageName) {
    switch (pageName) {
      case 'Tamil99 Typing':
        return const Tamil99TypingModule();
      case 'English → Tamil':
        return const PhoneticTranslationModule();
      case 'Voice to Text':
        return const VoiceToTextModule();
      case 'Text Editor':
        return const TextEditorModule();
      case 'Learn Tamil':
        return const LearnTamilModule();
      case 'Typing Practice':
        return const TypingPracticeModule();
      case 'Government Forms':
        return const GovernmentFormsModule();
      case 'Documents & PDF':
        return const DocumentsAndPdfModule();
      case 'Keyboard API & SDK':
        return const KeyboardApiSdkModule();
      case 'Settings':
        return const SettingsModule();
      case 'Help & Support':
        return const HelpAndSupportModule();
      default:
        return _buildGenericPlaceholder(pageName);
    }
  }

  Widget _buildGenericPlaceholder(String pageName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _getIconForPage(pageName),
          size: 80,
          color: AppTheme.goldPrimary.withOpacity(0.5),
        ),
        const SizedBox(height: 24),
        Text(context.watch<AppLanguageProvider>().translate(pageName), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
        const SizedBox(height: 16),
        Text(context.watch<AppLanguageProvider>().translate('This module is currently under development.'), style: const TextStyle(fontSize: 16, color: Colors.black54)),
      ],
    );
  }

  IconData _getIconForPage(String page) {
    switch (page) {
      case 'Tamil99 Typing': return Icons.keyboard;
      case 'English → Tamil': return Icons.translate;
      case 'Voice to Text': return Icons.mic;
      case 'Text Editor': return Icons.edit_document;
      case 'Learn Tamil': return Icons.school;
      case 'Typing Practice': return Icons.speed;
      case 'Government Forms': return Icons.verified_user;
      case 'Documents & PDF': return Icons.picture_as_pdf;
      case 'Keyboard API & SDK': return Icons.code;
      case 'Settings': return Icons.settings;
      case 'Help & Support': return Icons.help;
      default: return Icons.widgets;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Row(
        children: [
          AppSidebar(selectedItem: _selectedItem, onItemTapped: _onNavigate),
          _buildMainContent(),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------
// MODULE IMPLEMENTATIONS
// -------------------------------------------------------------


class PhoneticTranslationModule extends StatefulWidget {
  const PhoneticTranslationModule({super.key});
  @override
  State<PhoneticTranslationModule> createState() => _PhoneticTranslationModuleState();
}

class _PhoneticTranslationModuleState extends State<PhoneticTranslationModule> {
  final TextEditingController _englishController = TextEditingController();
  String outputText = "";
  
  @override
  void dispose() {
    _englishController.dispose();
    super.dispose();
  }

  void _transliterate(String input) {
    String lower = input.toLowerCase();
    
    // Ordered phonetic map (longest sequences first to prevent partial matches)
    final Map<String, String> phonetics = {
      'vanakkam': 'வணக்கம்',
      'amma': 'அம்மா',
      'appa': 'அப்பா',
      'tamil': 'தமிழ்',
      'nanri': 'நன்றி',
      'india': 'இந்தியா',
      'zha': 'ழ', 'zh': 'ழ்',
      'nga': 'ங', 'ng': 'ங்',
      'cha': 'ச', 'ch': 'ச்',
      'nja': 'ஞ', 'nj': 'ஞ்',
      'tha': 'த', 'th': 'த்',
      'aa': 'ஆ', 'ii': 'ஈ', 'uu': 'ஊ', 'ee': 'ஏ', 'ai': 'ஐ', 'oo': 'ஓ', 'au': 'ஔ',
      'ka': 'க', 'k': 'க்',
      'ta': 'ட', 't': 'ட்',
      'na': 'ந', 'n': 'ன்',
      'pa': 'ப', 'p': 'ப்',
      'ma': 'ம', 'm': 'ம்',
      'ya': 'ய', 'y': 'ய்',
      'ra': 'ர', 'r': 'ர்',
      'la': 'ல', 'l': 'ல்',
      'va': 'வ', 'v': 'வ்',
      'wa': 'வ', 'w': 'வ்',
      'sa': 'ச', 's': 'ஸ்',
      'a': 'அ', 'i': 'இ', 'u': 'உ', 'e': 'எ', 'o': 'ஒ',
    };

    for (var entry in phonetics.entries) {
      lower = lower.replaceAll(entry.key, entry.value);
    }
    
    setState(() {
      outputText = lower;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.watch<AppLanguageProvider>().translate('English to Tamil Phonetic Typing'), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
          const SizedBox(height: 24),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black12)),
                    child: TextField(
                      controller: _englishController,
                      onChanged: _transliterate,
                      maxLines: null,
                      expands: true,
                      decoration: InputDecoration(
                        hintText: context.watch<AppLanguageProvider>().translate('Type in English (e.g. "vanakkam")...'),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(24),
                      ),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: AppTheme.primaryContainer, shape: BoxShape.circle, boxShadow: [BoxShadow(color: AppTheme.primary.withOpacity(0.3), blurRadius: 10)]),
                    child: const Icon(Icons.compare_arrows, color: Colors.white, size: 32),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppTheme.goldPrimary.withOpacity(0.5))),
                    child: SingleChildScrollView(
                      child: Text(outputText.isEmpty ? context.watch<AppLanguageProvider>().translate('Translation will appear here...') : outputText, style: TextStyle(fontSize: 18, color: outputText.isEmpty ? Colors.black38 : Colors.black87, height: 1.6)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VoiceToTextModule extends StatefulWidget {
  const VoiceToTextModule({super.key});
  @override
  State<VoiceToTextModule> createState() => _VoiceToTextModuleState();
}

class _VoiceToTextModuleState extends State<VoiceToTextModule> {
  bool isRecording = false;
  String outputText = "";
  final List<String> simulatedWords = "வணக்கம்! இது தமிழ் வாய்வழி உரை தட்டச்சுப் பகுதியின் ஒரு செயல்பாட்டு மாதிரி. நீங்கள் பேசும் வார்த்தைகள் இங்கே நேரடியாக தமிழ் உரையாக மாறுவதை நீங்கள் காணலாம்.".split(" ");
  int _currentWordIndex = 0;

  void _toggleRecording() {
    setState(() {
      isRecording = !isRecording;
      if (isRecording) {
        outputText = "";
        _currentWordIndex = 0;
        _simulateListening();
      }
    });
  }
  
  void _simulateListening() async {
    while (isRecording && mounted) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (!isRecording || !mounted) break;
      
      setState(() {
        if (_currentWordIndex < simulatedWords.length) {
          outputText += (outputText.isEmpty ? "" : " ") + simulatedWords[_currentWordIndex];
          _currentWordIndex++;
        } else {
          isRecording = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Text(context.watch<AppLanguageProvider>().translate('Tamil Voice to Text Dictation'), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: _toggleRecording,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: isRecording ? Colors.red : AppTheme.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: (isRecording ? Colors.red : AppTheme.primary).withOpacity(0.4),
                    blurRadius: isRecording ? 30 : 10,
                    spreadRadius: isRecording ? 10 : 2,
                  ),
                ],
              ),
              child: const Icon(Icons.mic, color: Colors.white, size: 48),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            context.watch<AppLanguageProvider>().translate(isRecording ? 'Listening for Tamil speech...' : 'Tap the microphone to start speaking'),
            style: TextStyle(fontSize: 16, color: isRecording ? Colors.red : Colors.black54, fontWeight: isRecording ? FontWeight.bold : FontWeight.normal),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Container(
              width: 800,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black12),
              ),
              child: SingleChildScrollView(
                child: Text(
                  outputText.isEmpty ? context.watch<AppLanguageProvider>().translate('Waiting for voice input...') : outputText,
                  style: TextStyle(
                    fontSize: 24, 
                    color: outputText.isEmpty ? Colors.black38 : Colors.black87, 
                    height: 1.6
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextEditorModule extends StatefulWidget {
  const TextEditorModule({super.key});

  @override
  State<TextEditorModule> createState() => _TextEditorModuleState();
}

class _TextEditorModuleState extends State<TextEditorModule> {
  final TextEditingController _controller = TextEditingController();
  bool isBold = false;
  bool isItalic = false;
  bool isUnderline = false;
  TextAlign textAlign = TextAlign.left;

  int get wordCount {
    if (_controller.text.trim().isEmpty) return 0;
    return _controller.text.trim().split(RegExp(r'\s+')).length;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveDraft() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.read<AppLanguageProvider>().translate('Draft saved successfully!')),
        backgroundColor: AppTheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = (String text) => context.watch<AppLanguageProvider>().translate(text);
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t('TN Govt Circular Draft'), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
              ElevatedButton.icon(
                onPressed: _saveDraft,
                icon: const Icon(Icons.save),
                label: Text(t('Save Draft')),
                style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, foregroundColor: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 16),
          // Toolbar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black12), borderRadius: const BorderRadius.vertical(top: Radius.circular(8))),
            child: Row(
              children: [
                _buildToolbarIcon(Icons.format_bold, isBold, () => setState(() => isBold = !isBold)),
                _buildToolbarIcon(Icons.format_italic, isItalic, () => setState(() => isItalic = !isItalic)),
                _buildToolbarIcon(Icons.format_underline, isUnderline, () => setState(() => isUnderline = !isUnderline)),
                const VerticalDivider(width: 32),
                _buildToolbarIcon(Icons.format_align_left, textAlign == TextAlign.left, () => setState(() => textAlign = TextAlign.left)),
                _buildToolbarIcon(Icons.format_align_center, textAlign == TextAlign.center, () => setState(() => textAlign = TextAlign.center)),
                _buildToolbarIcon(Icons.format_align_right, textAlign == TextAlign.right, () => setState(() => textAlign = TextAlign.right)),
                const Spacer(),
                Text('${t('Words:')} $wordCount', style: const TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
              ),
              child: TextField(
                controller: _controller,
                textAlign: textAlign,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(border: InputBorder.none, hintText: context.watch<AppLanguageProvider>().translate('Start writing here...')),
                style: TextStyle(
                  fontSize: 16, 
                  height: 1.8,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                  decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildToolbarIcon(IconData icon, bool isActive, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.primaryContainer : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(
        icon: Icon(icon, color: isActive ? AppTheme.primary : Colors.black87), 
        onPressed: onTap, 
        splashRadius: 20,
      ),
    );
  }
}

class LearnTamilModule extends StatefulWidget {
  const LearnTamilModule({super.key});
  @override
  State<LearnTamilModule> createState() => _LearnTamilModuleState();
}

class _LearnTamilModuleState extends State<LearnTamilModule> {
  String selectedCategory = 'Vowels (Uyir)';
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  final Map<String, List<Map<String, String>>> lessons = {
    'Vowels (Uyir)': [
      {'ta': 'அ', 'en': 'a'}, {'ta': 'ஆ', 'en': 'aa'}, {'ta': 'இ', 'en': 'i'},
      {'ta': 'ஈ', 'en': 'ee'}, {'ta': 'உ', 'en': 'u'}, {'ta': 'ஊ', 'en': 'oo'},
      {'ta': 'எ', 'en': 'e'}, {'ta': 'ஏ', 'en': 'ae'}, {'ta': 'ஐ', 'en': 'ai'},
      {'ta': 'ஒ', 'en': 'o'}, {'ta': 'ஓ', 'en': 'oa'}, {'ta': 'ஔ', 'en': 'au'},
      {'ta': 'ஃ', 'en': 'akh'},
    ],
    'Consonants (Mei)': [
      {'ta': 'க்', 'en': 'ik'}, {'ta': 'ங்', 'en': 'ing'}, {'ta': 'ச்', 'en': 'ich'},
      {'ta': 'ஞ்', 'en': 'inj'}, {'ta': 'ட்', 'en': 'it'}, {'ta': 'ண்', 'en': 'in'},
      {'ta': 'த்', 'en': 'ith'}, {'ta': 'ந்', 'en': 'indh'}, {'ta': 'ப்', 'en': 'ip'},
      {'ta': 'ம்', 'en': 'im'}, {'ta': 'ய்', 'en': 'iy'}, {'ta': 'ர்', 'en': 'ir'},
      {'ta': 'ல்', 'en': 'il'}, {'ta': 'வ்', 'en': 'iv'}, {'ta': 'ழ்', 'en': 'izh'},
      {'ta': 'ள்', 'en': 'ill'}, {'ta': 'ற்', 'en': 'itr'}, {'ta': 'ன்', 'en': 'in'},
    ]
  };

  @override
  Widget build(BuildContext context) {
    final t = (String text) => context.watch<AppLanguageProvider>().translate(text);
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t('Learn Tamil Basics'), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
          const SizedBox(height: 24),
          Row(
            children: [
              _buildTab('Vowels (Uyir)'),
              const SizedBox(width: 16),
              _buildTab('Consonants (Mei)'),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: GridView.builder(
              itemCount: lessons[selectedCategory]!.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final item = lessons[selectedCategory]![index];
                return _buildFlashcard(item['ta']!, item['en']!);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTab(String title) {
    bool isSelected = selectedCategory == title;
    return InkWell(
      onTap: () => setState(() => selectedCategory = title),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? AppTheme.primary : Colors.black12),
        ),
        child: Text(
          context.watch<AppLanguageProvider>().translate(title), 
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87, 
            fontWeight: FontWeight.bold
          )
        ),
      ),
    );
  }

  Widget _buildFlashcard(String tamil, String english) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Pronunciation: $english'), duration: const Duration(seconds: 1)));
          try {
            await audioPlayer.play(UrlSource('https://translate.google.com/translate_tts?ie=UTF-8&q=${Uri.encodeComponent(tamil)}&tl=ta&client=tw-ob'));
          } catch (e) {
            debugPrint("Audio Error: $e");
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(tamil, style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(color: AppTheme.goldPrimary.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                child: Text(english, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.primary)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TypingPracticeModule extends StatefulWidget {
  const TypingPracticeModule({super.key});
  @override
  State<TypingPracticeModule> createState() => _TypingPracticeModuleState();
}

class _TypingPracticeModuleState extends State<TypingPracticeModule> {
  final List<String> _practiceSentences = [
    "தமிழ் நமது தாய்மொழி. இதை கற்பது மிகவும் எளிமையானது.",
    "அகர முதல எழுத்தெல்லாம் ஆதி பகவன் முதற்றே உலகு.",
    "யாதும் ஊரே யாவரும் கேளிர்.",
    "கற்க கசடறக் கற்பவை கற்றபின் நிற்க அதற்குத் தக.",
    "திருக்குறள் உலகப் பொதுமறை என்று அழைக்கப்படுகிறது."
  ];
  
  int _currentSentenceIndex = 0;
  
  String get targetText => _practiceSentences[_currentSentenceIndex];

  final TextEditingController _controller = TextEditingController();
  
  DateTime? startTime;
  int wpm = 0;
  double accuracy = 100.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    String typed = _controller.text;
    
    if (typed.isNotEmpty && startTime == null) {
      startTime = DateTime.now();
    }

    if (typed.isEmpty) {
      setState(() {
        wpm = 0;
        accuracy = 100.0;
        startTime = null;
      });
      return;
    }

    int correctChars = 0;
    int minLen = typed.length < targetText.length ? typed.length : targetText.length;
    
    for (int i = 0; i < minLen; i++) {
      if (typed[i] == targetText[i]) {
        correctChars++;
      }
    }

    accuracy = (correctChars / typed.length) * 100;

    if (startTime != null) {
      final minutes = DateTime.now().difference(startTime!).inSeconds / 60.0;
      if (minutes > 0) {
        wpm = ((typed.length / 5) / minutes).round();
      }
    }

    setState(() {});
  }

  void _reset() {
    _controller.clear();
    setState(() {
      startTime = null;
      wpm = 0;
      accuracy = 100.0;
    });
  }

  void _nextSentence() {
    setState(() {
      _currentSentenceIndex = (_currentSentenceIndex + 1) % _practiceSentences.length;
    });
    _reset();
  }

  @override
  Widget build(BuildContext context) {
    final t = (String text) => context.watch<AppLanguageProvider>().translate(text);
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t('Typing Practice Arena'), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
              ElevatedButton.icon(
                onPressed: _reset,
                icon: const Icon(Icons.refresh),
                label: Text(t('Restart')),
                style: ElevatedButton.styleFrom(backgroundColor: AppTheme.goldPrimary, foregroundColor: AppTheme.wineDeep),
              )
            ],
          ),
          const SizedBox(height: 32),
          // Stats Row
          Row(
            children: [
              _buildStatCard('Speed', '$wpm WPM', Icons.speed),
              const SizedBox(width: 16),
              _buildStatCard('Accuracy', '${accuracy.toStringAsFixed(1)}%', Icons.check_circle_outline),
              const SizedBox(width: 16),
              _buildStatCard('Progress', '${_controller.text.length} / ${targetText.length}', Icons.trending_up),
            ],
          ),
          const SizedBox(height: 32),
          // Target Text
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.primaryContainer, width: 2),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    targetText,
                    style: const TextStyle(fontSize: 24, color: Colors.black87, height: 1.6, letterSpacing: 1.2),
                  ),
                ),
                IconButton(
                  onPressed: _nextSentence,
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: AppTheme.primary,
                  tooltip: 'Next Sentence',
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Input
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: TextField(
                controller: _controller,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: context.watch<AppLanguageProvider>().translate('Start typing the text above...'),
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 24, color: AppTheme.primary, height: 1.6, letterSpacing: 1.2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppTheme.primary, size: 32),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.watch<AppLanguageProvider>().translate(label), style: const TextStyle(color: Colors.black54, fontSize: 14)),
                Text(value, style: const TextStyle(color: AppTheme.wineDeep, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GovernmentFormsModule extends StatefulWidget {
  const GovernmentFormsModule({super.key});
  @override
  State<GovernmentFormsModule> createState() => _GovernmentFormsModuleState();
}

class _GovernmentFormsModuleState extends State<GovernmentFormsModule> {
  final List<Map<String, String>> forms = [
    {'title': 'வருமானச் சான்றிதழ் (Income Certificate)', 'desc': 'Application for obtaining an income certificate for official use.'},
    {'title': 'சாதிச் சான்றிதழ் (Community Certificate)', 'desc': 'Application for obtaining a community certificate.'},
    {'title': 'பட்டா மாறுதல் (Patta Transfer)', 'desc': 'Request to transfer Patta for land registration.'},
    {'title': 'பிறப்புச் சான்றிதழ் (Birth Certificate)', 'desc': 'Application to register a new birth.'},
  ];

  Map<String, String>? selectedForm;

  @override
  Widget build(BuildContext context) {
    final t = (String text) => context.watch<AppLanguageProvider>().translate(text);
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: List of Forms
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t('Available Forms'), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView.builder(
                    itemCount: forms.length,
                    itemBuilder: (context, index) {
                      final form = forms[index];
                      final isSelected = selectedForm == form;
                      return Card(
                        elevation: isSelected ? 4 : 1,
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: isSelected ? AppTheme.primary : Colors.transparent, width: 2),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          title: Text(form['title']!, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? AppTheme.primary : Colors.black87)),
                          subtitle: Text(form['desc']!),
                          leading: const Icon(Icons.description, color: AppTheme.goldPrimary),
                          onTap: () {
                            setState(() {
                              selectedForm = form;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 32),
          // Right: Form Preview/Editor
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: selectedForm == null
                  ? Center(child: Text(t('Select a form from the left to begin filling it out.'), style: const TextStyle(color: Colors.black54, fontSize: 18)))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(selectedForm!['title']!, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
                        const Divider(height: 48, thickness: 2),
                        _buildFormField('பெயர் (Name)', 'Enter your full name'),
                        const SizedBox(height: 16),
                        _buildFormField('தந்தை/கணவர் பெயர் (Father/Husband Name)', 'Enter father/husband name'),
                        const SizedBox(height: 16),
                        _buildFormField('முகவரி (Address)', 'Enter complete address', maxLines: 3),
                        const SizedBox(height: 32),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('Form Submitted Successfully!'))));
                            },
                            icon: const Icon(Icons.send),
                            label: Text(t('சமர்ப்பி (Submit)')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFormField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 16)),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}

class DocumentsAndPdfModule extends StatefulWidget {
  const DocumentsAndPdfModule({super.key});
  @override
  State<DocumentsAndPdfModule> createState() => _DocumentsAndPdfModuleState();
}

class _DocumentsAndPdfModuleState extends State<DocumentsAndPdfModule> {
  final List<Map<String, String>> documents = [
    {'name': 'Govt_Circular_Oct2026.pdf', 'date': 'Oct 08, 2026', 'size': '2.4 MB', 'type': 'pdf'},
    {'name': 'Income_Certificate_Draft.pdf', 'date': 'Oct 07, 2026', 'size': '1.1 MB', 'type': 'pdf'},
    {'name': 'Meeting_Minutes.docx', 'date': 'Oct 05, 2026', 'size': '450 KB', 'type': 'doc'},
    {'name': 'Translated_Notes.txt', 'date': 'Oct 01, 2026', 'size': '12 KB', 'type': 'txt'},
  ];

  Map<String, String>? selectedDoc;

  @override
  Widget build(BuildContext context) {
    final t = (String text) => context.watch<AppLanguageProvider>().translate(text);
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Document List
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t('My Documents'), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final doc = documents[index];
                      final isSelected = selectedDoc == doc;
                      IconData icon = Icons.insert_drive_file;
                      if (doc['type'] == 'pdf') icon = Icons.picture_as_pdf;
                      if (doc['type'] == 'doc') icon = Icons.description;
                      
                      return Card(
                        elevation: isSelected ? 4 : 1,
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: isSelected ? AppTheme.primary : Colors.transparent, width: 2),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppTheme.goldPrimary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(icon, color: AppTheme.wineDeep),
                          ),
                          title: Text(doc['name']!, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? AppTheme.primary : Colors.black87)),
                          subtitle: Text('${doc['date']} • ${doc['size']}'),
                          onTap: () {
                            setState(() {
                              selectedDoc = doc;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 32),
          // Right: Document Preview
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: selectedDoc == null
                  ? Center(child: Text(t('Select a document to preview.'), style: const TextStyle(color: Colors.black54, fontSize: 18)))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          selectedDoc!['type'] == 'pdf' ? Icons.picture_as_pdf : Icons.insert_drive_file,
                          size: 120,
                          color: AppTheme.goldPrimary,
                        ),
                        const SizedBox(height: 24),
                        Text(selectedDoc!['name']!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
                        const SizedBox(height: 8),
                        Text('Last modified: ${selectedDoc!['date']}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
                        const SizedBox(height: 48),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildActionButton(Icons.open_in_new, t('Open'), () {}),
                            const SizedBox(width: 16),
                            _buildActionButton(Icons.download, t('Download'), () {}),
                            const SizedBox(width: 16),
                            _buildActionButton(Icons.share, t('Share'), () {}),
                            const SizedBox(width: 16),
                            _buildActionButton(Icons.delete, t('Delete'), () {}, isDestructive: true),
                          ],
                        )
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onTap, {bool isDestructive = false}) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isDestructive ? Colors.red.shade50 : AppTheme.primary,
        foregroundColor: isDestructive ? Colors.red : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        elevation: 0,
      ),
    );
  }
}

class KeyboardApiSdkModule extends StatelessWidget {
  const KeyboardApiSdkModule({super.key});

  @override
  Widget build(BuildContext context) {
    final t = (String text) => context.watch<AppLanguageProvider>().translate(text);
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t('Developer API & SDK'), style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
          const SizedBox(height: 8),
          Text(t('Integrate our powerful Tamil99 typing engine directly into your own web or mobile applications.'), style: const TextStyle(fontSize: 16, color: Colors.black54)),
          const SizedBox(height: 32),
          // API Key Section
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.primary.withOpacity(0.2)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t('Your Secret API Key'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('tm99_live_8f7d6a5b4c3d2e1f0a9b8c7d6e5f4...', style: TextStyle(fontFamily: 'Courier', fontSize: 16, color: Colors.black87)),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('API Key copied to clipboard!'))));
                  },
                  icon: const Icon(Icons.copy),
                  label: Text(t('Copy Key')),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Code Snippet Section
          Text(t('Quick Integration Guide'), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                // Web Snippet
                Expanded(
                  child: _buildCodeCard(
                    title: t('HTML / JS Widget'),
                    icon: Icons.language,
                    code: '''
<!-- Include the Tamil99 SDK -->
<script src="https://api.tamil99.dev/sdk/v1.js"></script>

<!-- Initialize on an input field -->
<script>
  Tamil99.init({
    apiKey: 'YOUR_API_KEY',
    targetElement: '#myInputField',
    theme: 'light'
  });
</script>
''',
                  ),
                ),
                const SizedBox(width: 24),
                // Flutter Snippet
                Expanded(
                  child: _buildCodeCard(
                    title: 'Flutter Package',
                    icon: Icons.phone_android,
                    code: '''
// 1. Add dependency in pubspec.yaml
// dependencies:
//   tamil99_sdk: ^1.0.0

import 'package:tamil99_sdk/tamil99_sdk.dart';

// 2. Use the widget
Tamil99Keyboard(
  apiKey: 'YOUR_API_KEY',
  controller: myTextController,
  onTyping: (text) => print(text),
);
''',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCodeCard({required String title, required IconData icon, required String code}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Dark theme for code
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF2D2D2D),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white70, size: 20),
                const SizedBox(width: 8),
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(
                code,
                style: const TextStyle(fontFamily: 'Courier', color: Color(0xFFA9B7C6), fontSize: 14, height: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsModule extends StatefulWidget {
  const SettingsModule({super.key});

  @override
  State<SettingsModule> createState() => _SettingsModuleState();
}

class _SettingsModuleState extends State<SettingsModule> {
  bool _isDarkMode = false;
  bool _autoCorrect = true;
  bool _soundOnKey = false;
  String _keyboardLayout = 'Tamil99 Standard';

  // Profile Variables
  String _userName = 'Tamil User';
  String _userEmail = 'user@tamil99.in';
  String _userPhone = '+91 9876543210';

  // Localization Maps
  final Map<String, Map<String, String>> _i18n = {
    'English': {
      'title': 'Application Settings',
      'desc': 'Customize your typing experience and application preferences.',
      'appearance': 'Appearance',
      'dark_mode': 'Dark Mode',
      'dark_mode_desc': 'Toggle between light and dark themes.',
      'lang_layout': 'Language & Layout',
      'app_lang': 'App Language',
      'app_lang_desc': 'Choose the interface language.',
      'def_layout': 'Default Keyboard Layout',
      'def_layout_desc': 'Select your preferred typing method.',
      'typing_pref': 'Typing Preferences',
      'auto_correct': 'Auto-Correction',
      'auto_correct_desc': 'Automatically fix common typing mistakes.',
      'key_sound': 'Keyboard Sound',
      'key_sound_desc': 'Play a click sound on every keystroke.',
      'profile': 'User Profile',
      'profile_name': 'Full Name',
      'profile_email': 'Email Address',
      'profile_phone': 'Phone Number',
      'save': 'Save Settings',
      'saved_msg': 'Settings saved successfully!',
    },
    'தமிழ்': {
      'title': 'பயன்பாட்டு அமைப்புகள் (Settings)',
      'desc': 'உங்கள் தட்டச்சு அனுபவம் மற்றும் பயன்பாட்டு விருப்பங்களை தனிப்பயனாக்கவும்.',
      'appearance': 'தோற்றம் (Appearance)',
      'dark_mode': 'இரவு முறை (Dark Mode)',
      'dark_mode_desc': 'வெளிச்சம் மற்றும் இருண்ட நிறங்களுக்கு இடையே மாற்று.',
      'lang_layout': 'மொழி & விசைப்பலகை',
      'app_lang': 'பயன்பாட்டு மொழி (App Language)',
      'app_lang_desc': 'இடைமுக மொழியைத் தேர்வுசெய்க.',
      'def_layout': 'இயல்புநிலை விசைப்பலகை',
      'def_layout_desc': 'உங்கள் விருப்பமான தட்டச்சு முறையைத் தேர்ந்தெடுக்கவும்.',
      'typing_pref': 'தட்டச்சு விருப்பங்கள்',
      'auto_correct': 'தானியங்கு திருத்தம்',
      'auto_correct_desc': 'பொதுவான தட்டச்சு தவறுகளை தானாக சரிசெய்யும்.',
      'key_sound': 'விசைப்பலகை ஒலி',
      'key_sound_desc': 'ஒவ்வொரு விசை அழுத்தத்திலும் ஒலியை இயக்கவும்.',
      'profile': 'பயனர் சுயவிவரம் (User Profile)',
      'profile_name': 'முழு பெயர் (Full Name)',
      'profile_email': 'மின்னஞ்சல் (Email)',
      'profile_phone': 'தொலைபேசி எண் (Phone)',
      'save': 'அமைப்புகளைச் சேமி (Save)',
      'saved_msg': 'அமைப்புகள் வெற்றிகரமாக சேமிக்கப்பட்டன!',
    }
  };

  String _t(String key) {
    final isTamil = context.watch<AppLanguageProvider>().currentLanguage == 'TAMIL' || context.watch<AppLanguageProvider>().currentLanguage == 'Tamil99';
    return _i18n[isTamil ? 'தமிழ்' : 'English']![key]!;
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic theme variables based on _isDarkMode
    final Color bgColor = _isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final Color textColor = _isDarkMode ? Colors.white : Colors.black87;
    final Color subtitleColor = _isDarkMode ? Colors.white70 : Colors.black54;
    final Color headerColor = _isDarkMode ? Colors.white : AppTheme.wineDeep;

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_t('title'), style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: headerColor)),
          const SizedBox(height: 8),
          Text(_t('desc'), style: TextStyle(fontSize: 16, color: subtitleColor)),
          const SizedBox(height: 32),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _isDarkMode ? Colors.white12 : Colors.black12),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: ListView(
                children: [
                  _buildSectionHeader(_t('profile')),
                  _buildTextFieldRow(_t('profile_name'), _userName, (val) => _userName = val, textColor),
                  const SizedBox(height: 16),
                  _buildTextFieldRow(_t('profile_email'), _userEmail, (val) => _userEmail = val, textColor),
                  const SizedBox(height: 16),
                  _buildTextFieldRow(_t('profile_phone'), _userPhone, (val) => _userPhone = val, textColor),
                  const Divider(height: 32),
                  
                  _buildSectionHeader(_t('appearance')),
                  SwitchListTile(
                    title: Text(_t('dark_mode'), style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
                    subtitle: Text(_t('dark_mode_desc'), style: TextStyle(color: subtitleColor)),
                    value: _isDarkMode,
                    activeColor: AppTheme.primary,
                    onChanged: (bool value) {
                      setState(() {
                        _isDarkMode = value;
                      });
                    },
                  ),
                  const Divider(height: 32),
                  
                  _buildSectionHeader(_t('lang_layout')),
                  _buildDropdownRow(
                    _t('app_lang'),
                    _t('app_lang_desc'),
                    ['English', 'தமிழ்'],
                    context.watch<AppLanguageProvider>().currentLanguage == 'Tamil' ? 'தமிழ்' : 'English',
                    (val) {
                      context.read<AppLanguageProvider>().setLanguage(val == 'தமிழ்' ? 'Tamil' : 'English');
                    },
                    textColor,
                    subtitleColor,
                  ),
                  const SizedBox(height: 16),
                  _buildDropdownRow(
                    _t('def_layout'),
                    _t('def_layout_desc'),
                    ['Tamil99 Standard', 'Phonetic (English to Tamil)', 'Anjal'],
                    _keyboardLayout,
                    (val) => setState(() => _keyboardLayout = val!),
                    textColor,
                    subtitleColor,
                  ),
                  const Divider(height: 32),
                  
                  _buildSectionHeader(_t('typing_pref')),
                  SwitchListTile(
                    title: Text(_t('auto_correct'), style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
                    subtitle: Text(_t('auto_correct_desc'), style: TextStyle(color: subtitleColor)),
                    value: _autoCorrect,
                    activeColor: AppTheme.primary,
                    onChanged: (bool value) {
                      setState(() {
                        _autoCorrect = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text(_t('key_sound'), style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
                    subtitle: Text(_t('key_sound_desc'), style: TextStyle(color: subtitleColor)),
                    value: _soundOnKey,
                    activeColor: AppTheme.primary,
                    onChanged: (bool value) {
                      setState(() {
                        _soundOnKey = value;
                      });
                    },
                  ),
                  const SizedBox(height: 48),
                  
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_t('saved_msg'))));
                      },
                      icon: const Icon(Icons.save),
                      label: Text(_t('save')),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 16.0),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.goldPrimary)),
    );
  }

  Widget _buildTextFieldRow(String title, String currentValue, ValueChanged<String> onChanged, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor))),
          Expanded(
            flex: 3,
            child: TextFormField(
              initialValue: currentValue,
              onChanged: onChanged,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownRow(String title, String subtitle, List<String> options, String currentValue, ValueChanged<String?> onChanged, Color textColor, Color subtitleColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: subtitleColor, fontSize: 14)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: currentValue,
                dropdownColor: _isDarkMode ? const Color(0xFF2D2D2D) : Colors.white,
                style: TextStyle(color: textColor, fontSize: 16),
                items: options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HelpAndSupportModule extends StatefulWidget {
  const HelpAndSupportModule({super.key});

  @override
  State<HelpAndSupportModule> createState() => _HelpAndSupportModuleState();
}

class _HelpAndSupportModuleState extends State<HelpAndSupportModule> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = (String text) => context.watch<AppLanguageProvider>().translate(text);

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t('Help & Support'), style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.wineDeep)),
          const SizedBox(height: 8),
          Text(t('Find answers to common questions or reach out to our support team.'), style: const TextStyle(fontSize: 16, color: Colors.black54)),
          const SizedBox(height: 32),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Column: FAQs & Links
                Expanded(
                  flex: 3,
                  child: ListView(
                    children: [
                      _buildSectionHeader(t('Frequently Asked Questions (FAQ)')),
                      _buildFaqItem(t('How do I switch to Tamil99 typing?'), t('Go to the Settings page and select "Tamil99 Standard" under the Default Keyboard Layout dropdown.')),
                      _buildFaqItem(t('Is my typing data saved online?'), t('No, your typing practice stats and text editor documents are saved completely offline on your local device.')),
                      _buildFaqItem(t('How can I use this keyboard in other apps?'), t('You can check the "Keyboard API & SDK" section to learn how to integrate our open-source typing engine into your own apps or web platforms.')),
                      _buildFaqItem(t('How does the voice typing work?'), t('Voice typing utilizes your device\'s built-in speech recognition to transcribe spoken Tamil into text. Click the mic icon to start speaking.')),
                      
                      const SizedBox(height: 32),
                      _buildSectionHeader(t('Resources & Legal')),
                      ListTile(
                        leading: const Icon(Icons.menu_book, color: AppTheme.primary),
                        title: Text(t('Detailed User Guide')),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.privacy_tip, color: AppTheme.primary),
                        title: Text(t('Privacy Policy')),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.gavel, color: AppTheme.primary),
                        title: Text(t('Terms of Service')),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                // Right Column: Contact Form & Info
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t('Contact Us'), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            labelText: t('Your Email'),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _messageController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: t('How can we help you?'),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (_messageController.text.isNotEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('Message sent to support! We will reply soon.'))));
                                _messageController.clear();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t('Please enter a message first.'))));
                              }
                            },
                            icon: const Icon(Icons.send, size: 18),
                            label: Text(t('Send Message')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Center(
                          child: Text(
                            t('Tamil99 App v1.0.0\nMade with ❤️ for Tamil'),
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.black54, height: 1.5),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.goldPrimary)),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black12),
      ),
      child: ExpansionTile(
        title: Text(question, style: const TextStyle(fontWeight: FontWeight.bold)),
        childrenPadding: const EdgeInsets.all(16).copyWith(top: 0),
        expandedAlignment: Alignment.centerLeft,
        children: [
          Text(answer, style: const TextStyle(color: Colors.black87, height: 1.5)),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------
// ORIGINAL DASHBOARD & CORE WIDGETS
// -------------------------------------------------------------

class DashboardHomeContent extends StatelessWidget {
  const DashboardHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final parentState = context.findAncestorStateOfType<_DashboardScreenState>();
    final t = (String text) => context.watch<AppLanguageProvider>().translate(text);

    return Expanded(
      child: Column(
        children: [
          // Top Header
          const AppHeader(),
          // Scrollable workspace
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DashboardHeroBanner(),
                  const SizedBox(height: 32),
                  SectionTitle(title: t('Choose a workspace'), badgeText: t('Fast IME Launch')),
                  const SizedBox(height: 16),
                  // Workspace Cards Grid
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double cardWidth = (constraints.maxWidth - 48) / 4;
                      if (cardWidth < 200) cardWidth = (constraints.maxWidth - 16) / 2;
                      if (cardWidth < 200) cardWidth = constraints.maxWidth;
                      
                      return Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          SizedBox(width: cardWidth, child: WorkspaceCard(title: t('Tamil99 Typing'), icon: Icons.keyboard, description: t('Type directly using official Tamil99 layout with live glyph preview & intelligent automatic uyirmei fusion.'), isFlagship: true, actionText: t('Launch Tamil99 Mode'), onTap: () => parentState?._onNavigate('Tamil99 Typing'))),
                          SizedBox(width: cardWidth, child: WorkspaceCard(title: t('English → Tamil'), icon: Icons.translate, description: t('Phonetic transliteration in real-time with Tamil word predictor.'), badge: t('Phonetic Tamil'), actionText: t('Launch Phonetic Engine'), onTap: () => parentState?._onNavigate('English → Tamil'))),
                          SizedBox(width: cardWidth, child: WorkspaceCard(title: t('Tamil Voice to Text'), icon: Icons.mic, description: t('Speak naturally in Tamil dialects with automated comma, thodarbu and full stop punctuation recognition.'), badge: t('Whisper Tamil v2'), actionText: t('Start Voice Dictation'), onTap: () => parentState?._onNavigate('Voice to Text'))),
                          SizedBox(width: cardWidth, child: WorkspaceCard(title: t('New Tamil Document'), icon: Icons.description, description: t('Draft an A4 official office note, state petition, circular letter, or academic research script with Tamil headers.'), badge: t('Unicode Editor'), actionText: t('Open Blank Canvas'), onTap: () => parentState?._onNavigate('Text Editor'))),
                        ],
                      );
                    }
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      Container(
                        width: 600,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black12),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 16,
                              runSpacing: 12,
                              alignment: WrapAlignment.spaceBetween,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 8,
                                  children: [
                                    Text(t('Recent Documents & Forms'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(12)),
                                      child: Text(t('24 Indexed'), style: TextStyle(fontSize: 10, color: Colors.red.shade900, fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 36,
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.search, size: 16, color: Colors.black54),
                                          SizedBox(width: 8),
                                          Expanded(child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: t('Filter files...'),
                                              hintStyle: const TextStyle(color: Colors.black54, fontSize: 12),
                                              isDense: true,
                                              contentPadding: EdgeInsets.zero,
                                            ),
                                            style: TextStyle(fontSize: 12),
                                          )),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    InkWell(
                                      onTap: () => parentState?._onNavigate('Text Editor'),
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        height: 36,
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        decoration: BoxDecoration(
                                          color: AppTheme.primary,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.add, color: Colors.white, size: 16),
                                            SizedBox(width: 8),
                                            Text(t('New'), style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(t('Tamil Nadu Government forms, legal petitions, circulars, and departmental manuscripts'), style: const TextStyle(color: Colors.black54, fontSize: 12)),
                          ],
                        ),
                      ),
                      Container(
                        width: 300,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppTheme.goldPrimary.withOpacity(0.3)),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(Icons.lightbulb_outline, color: AppTheme.goldPrimary, size: 20),
                                      const SizedBox(width: 8),
                                      Expanded(child: Text(t('Tamil99 Key Guide'), style: const TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis)),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(12)),
                                  child: Text(t('Tip #14'), style: TextStyle(fontSize: 10, color: Colors.red.shade900, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(t('Did you know? Pressing produces க் (kKa), and produces the grantha ligature ஸ்ரீ.'), style: const TextStyle(fontSize: 12, color: Colors.black87)),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String badgeText;
  const SectionTitle({super.key, required this.title, required this.badgeText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppTheme.primaryContainer, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(color: Colors.blueGrey.shade50, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.black12)),
          child: Text(badgeText, style: TextStyle(fontSize: 10, color: Colors.blueGrey.shade700, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}

class WorkspaceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final String? badge;
  final bool isFlagship;
  final String actionText;
  final VoidCallback onTap;

  const WorkspaceCard({super.key, required this.title, required this.icon, required this.description, this.badge, this.isFlagship = false, required this.actionText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Colors.black12),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isFlagship ? AppTheme.primaryContainer : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(badge ?? context.watch<AppLanguageProvider>().translate('Flagship IME'), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isFlagship ? Colors.white : Colors.black87)),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(icon, color: AppTheme.goldPrimary, size: 24),
                  const SizedBox(width: 8),
                  Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), overflow: TextOverflow.ellipsis)),
                ],
              ),
              const SizedBox(height: 12),
              Text(description, style: const TextStyle(fontSize: 12, color: Colors.black54, height: 1.5)),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(actionText, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primary), overflow: TextOverflow.ellipsis)),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 16, color: AppTheme.primary),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppSidebar extends StatelessWidget {
  final String selectedItem;
  final Function(String) onItemTapped;

  const AppSidebar({super.key, required this.selectedItem, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.wineDeep, AppTheme.wineDark, AppTheme.primary],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        border: Border(right: BorderSide(color: Colors.white10)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.goldPrimary.withOpacity(0.4)),
                  ),
                  child: const Center(
                    child: Text('த', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(context.watch<AppLanguageProvider>().translate('Tamil99 Suite'), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                          const SizedBox(width: 4),
                          Text(context.watch<AppLanguageProvider>().translate('PRO'), style: const TextStyle(fontSize: 8, color: AppTheme.goldPrimary, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Text('தமிழ் ஸ்மார்ட் டைப்பிங்', style: TextStyle(color: AppTheme.goldLight, fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.white10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              children: [
                _buildSectionHeader(context, 'WORKSPACE'),
                _buildNavItem(context, Icons.grid_view, 'Dashboard'),
                _buildNavItem(context, Icons.keyboard, 'Tamil99 Typing'),
                _buildNavItem(context, Icons.translate, 'English → Tamil'),
                _buildNavItem(context, Icons.mic, 'Voice to Text'),
                _buildNavItem(context, Icons.edit_document, 'Text Editor'),
                const SizedBox(height: 16),
                _buildSectionHeader(context, 'LEARN & PRACTICE'),
                _buildNavItem(context, Icons.school, 'Learn Tamil'),
                _buildNavItem(context, Icons.speed, 'Typing Practice', trailing: _buildBadge('96 WPM', Colors.tealAccent)),
                const SizedBox(height: 16),
                _buildSectionHeader(context, 'PRODUCTIVITY'),
                _buildNavItem(context, Icons.verified_user, 'Government Forms'),
                _buildNavItem(context, Icons.picture_as_pdf, 'Documents & PDF'),
                const SizedBox(height: 16),
                _buildSectionHeader(context, 'DEVELOPER & SYSTEM'),
                _buildNavItem(context, Icons.code, 'Keyboard API & SDK'),
                _buildNavItem(context, Icons.settings, 'Settings'),
                _buildNavItem(context, Icons.help, 'Help & Support'),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.white10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle)),
                          const SizedBox(width: 8),
                          Expanded(child: Text(context.watch<AppLanguageProvider>().translate('Engine v2.4 Active'), style: const TextStyle(fontSize: 10, color: Colors.white70), overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: AppTheme.goldPrimary, borderRadius: BorderRadius.circular(4)),
                      child: Text(context.watch<AppLanguageProvider>().translate('Tamil99 IME'), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () => onItemTapped('Settings'),
                  borderRadius: BorderRadius.circular(8),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [AppTheme.goldPrimary, AppTheme.primaryContainer]),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: const Icon(Icons.person, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(context.watch<AppLanguageProvider>().translate('Kavitha R. (Govt. Dept)'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white), overflow: TextOverflow.ellipsis),
                            Text(context.watch<AppLanguageProvider>().translate('Enterprise License'), style: const TextStyle(fontSize: 10, color: AppTheme.goldLight), overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final translatedTitle = context.watch<AppLanguageProvider>().translate(title);
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 8, top: 4),
      child: Text(translatedTitle, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white38, letterSpacing: 1.2)),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String title, {Widget? trailing}) {
    bool isSelected = selectedItem == title;
    final translatedTitle = context.watch<AppLanguageProvider>().translate(title);
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        gradient: isSelected ? const LinearGradient(colors: [AppTheme.primaryContainer, AppTheme.wineDeep]) : null,
        borderRadius: BorderRadius.circular(8),
        border: isSelected ? Border.all(color: AppTheme.goldPrimary.withOpacity(0.3)) : null,
      ),
      child: ListTile(
        onTap: () => onItemTapped(title),
        dense: true,
        leading: Icon(icon, color: isSelected ? AppTheme.goldLight : Colors.white54, size: 20),
        title: Text(translatedTitle, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, color: isSelected ? Colors.white : Colors.white70, fontSize: 13)),
        trailing: trailing,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        minLeadingWidth: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: TextStyle(fontSize: 9, color: color, fontWeight: FontWeight.bold)),
    );
  }
}

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  String _activeMode = 'ENG';
  bool _isDarkMode = false;
  bool _hasNotifications = true;

  String t(String text) {
    if (!mounted) return text;
    return context.read<AppLanguageProvider>().translate(text);
  }

  void _showSyncDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.cloud_done, color: Colors.teal),
            const SizedBox(width: 8),
            Text(t('Cloud Sync Status'))
          ]
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Account: kavitha.r@tn.gov.in'),
            const SizedBox(height: 8),
            const Text('Last synced: Just now'),
            const SizedBox(height: 8),
            Text(t('Status: All documents and settings are backed up to TN Gov Cloud.'), style: const TextStyle(color: Colors.black54)),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(t('Close'))),
        ],
      )
    );
  }

  void _showNotifications() {
    setState(() {
      _hasNotifications = false;
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t('Notifications')),
        content: Text(t('No new notifications at this time.')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(t('Close'))),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: _isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        border: Border(bottom: BorderSide(color: _isDarkMode ? Colors.white12 : Colors.black12)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text('த', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(context.watch<AppLanguageProvider>().translate('Tamil99 Smart Typing Suite'), style: TextStyle(fontWeight: FontWeight.bold, color: _isDarkMode ? Colors.white : Colors.black87, fontSize: 16), overflow: TextOverflow.ellipsis),
                          Text(context.watch<AppLanguageProvider>().translate('Enterprise Desktop IME Platform & Gov Cloud Sync'), style: TextStyle(fontSize: 10, color: _isDarkMode ? Colors.white54 : Colors.black54), overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 16),
                  Container(
                    width: 250,
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: _isDarkMode ? Colors.white24 : Colors.black12),
                      borderRadius: BorderRadius.circular(8),
                      color: _isDarkMode ? const Color(0xFF2D2D2D) : Colors.grey.shade50,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, size: 18, color: _isDarkMode ? Colors.white54 : Colors.black54),
                        const SizedBox(width: 8),
                        Expanded(child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: context.watch<AppLanguageProvider>().translate('Search commands...'),
                            hintStyle: TextStyle(color: _isDarkMode ? Colors.white38 : Colors.black45, fontSize: 11),
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: TextStyle(fontSize: 11, color: _isDarkMode ? Colors.white : Colors.black),
                        )),
                        Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: _isDarkMode ? Colors.white12 : Colors.white, border: Border.all(color: _isDarkMode ? Colors.transparent : Colors.black12), borderRadius: BorderRadius.circular(4)), child: Text('Ctrl + K', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: _isDarkMode ? Colors.white : Colors.black))),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // MODE SELECTOR
                  Container(
                    height: 36,
                    decoration: BoxDecoration(
                      color: _isDarkMode ? const Color(0xFF2D2D2D) : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: _isDarkMode ? Colors.white12 : Colors.black12),
                    ),
                    child: Row(
                      children: [
                        _buildModeTab('ENG', isDark: _isDarkMode),
                        _buildModeTab('TAMIL', isDark: _isDarkMode),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  // NOTIFICATION
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      IconButton(onPressed: _showNotifications, icon: Icon(Icons.notifications_none, color: _isDarkMode ? Colors.white70 : Colors.black54)),
                      if (_hasNotifications)
                        Positioned(
                          right: 12,
                          top: 12,
                          child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle)),
                        )
                    ],
                  ),
                  const SizedBox(width: 8),
                  
                  // THEME TOGGLE
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isDarkMode = !_isDarkMode;
                      });
                    }, 
                    icon: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode_outlined, color: _isDarkMode ? Colors.amber : Colors.black54)
                  ),
                  const SizedBox(width: 8),
                  
                  // CLOUD SYNC
                  InkWell(
                    onTap: _showSyncDialog,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: Colors.teal.shade50, borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        children: [
                          const Icon(Icons.cloud_done_outlined, color: Colors.teal, size: 16),
                          const SizedBox(width: 6),
                          Text(context.watch<AppLanguageProvider>().translate('TN Gov Cloud Synced'), style: const TextStyle(color: Colors.teal, fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  // PROFILE AVATAR
                  InkWell(
                    onTap: () {
                      final parentState = context.findAncestorStateOfType<_DashboardScreenState>();
                      parentState?._onNavigate('Settings');
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(width: 32, height: 32, decoration: BoxDecoration(color: AppTheme.wineDeep, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.person, color: AppTheme.goldLight, size: 18)),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  ),
);
  }

  Widget _buildModeTab(String mode, {required bool isDark}) {
    bool isActive = _activeMode == mode;
    final translatedMode = context.watch<AppLanguageProvider>().translate(mode);
    return InkWell(
      onTap: () {
        setState(() {
          _activeMode = mode;
        });
        
        context.read<AppLanguageProvider>().setLanguage(mode);

        
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Keyboard mode changed to $mode'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppTheme.primaryContainer,
            duration: const Duration(milliseconds: 1500),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.primaryContainer : Colors.transparent,
          borderRadius: BorderRadius.circular(8)
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            if (isActive) const Icon(Icons.circle, size: 6, color: AppTheme.goldPrimary),
            if (isActive) const SizedBox(width: 4),
            Text(
              translatedMode, 
              style: TextStyle(
                color: isActive ? Colors.white : (isDark ? Colors.white54 : Colors.black54), 
                fontSize: 12, 
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal
              )
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardHeroBanner extends StatelessWidget {
  const DashboardHeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF40000A), Color(0xFF6E0518), Color(0xFF991C2C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.goldPrimary.withOpacity(0.35)),
        boxShadow: [
          BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.2), blurRadius: 20, spreadRadius: 5),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [AppTheme.goldLight, AppTheme.goldPrimary]),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.military_tech, size: 14, color: Colors.brown),
                          const SizedBox(width: 4),
                          Text(context.watch<AppLanguageProvider>().translate('TAMIL99 WORKSPACE'), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87, letterSpacing: 1.1)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  context.watch<AppLanguageProvider>().translate('Tamil typing, made simple'),
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  context.watch<AppLanguageProvider>().translate('Choose a workspace to start typing, translate, or work with Tamil text.'),
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
