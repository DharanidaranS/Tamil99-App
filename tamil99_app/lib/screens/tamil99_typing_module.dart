import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class Tamil99TypingModule extends StatefulWidget {
  const Tamil99TypingModule({super.key});

  @override
  State<Tamil99TypingModule> createState() => _Tamil99TypingModuleState();
}

class _Tamil99TypingModuleState extends State<Tamil99TypingModule> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: 'தமிழ் மொழி உலகின் தொன்மையான செம்மொழிகளில் ஒன்றாகும். அதன் தனிச்சிறப்பு ஒலிப்பு நயமும், எழுத்துக்களின் ஒழுங்கமைப்பும் ஆகும்.'
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onKeyTapped(String keyLabel) {
    if (keyLabel == '⌫') {
      final text = _controller.text;
      final selection = _controller.selection;
      
      if (selection.baseOffset > 0) {
        final newText = text.replaceRange(selection.baseOffset - 1, selection.baseOffset, '');
        _controller.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: selection.baseOffset - 1),
        );
      }
      return;
    } else if (keyLabel == 'SPACE (இடைவெளி)') {
      keyLabel = ' ';
    } else if (keyLabel == '↵') {
      keyLabel = '\n';
    } else if (keyLabel == 'Tab') {
      keyLabel = '    ';
    } else if (['Caps', 'Shift', 'Ctrl', 'Alt', 'AltGr', 'Hide (F8)', ''].contains(keyLabel)) {
      return;
    }

    final text = _controller.text;
    final selection = _controller.selection.isValid ? _controller.selection : TextSelection.collapsed(offset: text.length);
    
    int cursorPosition = selection.baseOffset;
    String beforeCursor = cursorPosition > 0 ? text.substring(0, cursorPosition) : '';
    String afterCursor = cursorPosition < text.length ? text.substring(cursorPosition) : '';

    final Map<String, String> vowelModifiers = {
      'அ': '',
      'ஆ': 'ா',
      'இ': 'ி',
      'ஈ': 'ீ',
      'உ': 'ு',
      'ஊ': 'ூ',
      'எ': 'ெ',
      'ஏ': 'ே',
      'ஐ': 'ை',
      'ஒ': 'ொ',
      'ஓ': 'ோ',
      'ஔ': 'ௌ',
      '்': '்',
    };

    final String consonants = 'கஙசஞடணதநபமயரலவழளறனஷஸஹஜஸ்ரீ';
    
    String charToInsert = keyLabel;
    
    if (cursorPosition > 0) {
      String prevChar = beforeCursor.substring(beforeCursor.length - 1);
      
      if (vowelModifiers.containsKey(charToInsert)) {
        if (consonants.contains(prevChar)) {
          charToInsert = vowelModifiers[charToInsert]!;
        } else if (prevChar == '்' && beforeCursor.length > 1) {
          String prevPrevChar = beforeCursor.substring(beforeCursor.length - 2, beforeCursor.length - 1);
          if (consonants.contains(prevPrevChar)) {
            beforeCursor = beforeCursor.substring(0, beforeCursor.length - 1);
            charToInsert = vowelModifiers[charToInsert]!;
          }
        }
      }
    }

    String newText = beforeCursor + charToInsert + afterCursor;
    int newCursorPos = beforeCursor.length + charToInsert.length;
    
    _controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newCursorPos),
    );
    
    _focusNode.requestFocus();
  }

  void _clearText() {
    setState(() {
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // Uses parent background
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header / Toolbar
            _buildToolbar(),
            const SizedBox(height: 24),
            // Ligature Buffer
            _buildLigatureBuffer(),
            const SizedBox(height: 24),
            // Editor Area
            _buildEditorArea(),
            const SizedBox(height: 32),
            // Cadence row
            _buildCadenceRow(),
            const SizedBox(height: 48),
            // Virtual Keyboard
            _buildVirtualKeyboard(),
            const SizedBox(height: 64),
            // Productivity Orbit
            _buildProductivityOrbit(),
          ],
        ),
      ),
    );
  }

  Widget _buildToolbar() {
    return Row(
      children: [
        const Icon(Icons.format_bold, color: Colors.black87, size: 20),
        const SizedBox(width: 16),
        const Icon(Icons.format_italic, color: Colors.black87, size: 20),
        const SizedBox(width: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.red.shade100),
          ),
          child: const Row(
            children: [
              Icon(Icons.adjust, color: AppTheme.primary, size: 14),
              SizedBox(width: 6),
              Text('Pulli Auto-join active (F Key)', style: TextStyle(color: AppTheme.primary, fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black12),
          ),
          child: const Row(
            children: [
              Icon(Icons.circle, color: AppTheme.goldPrimary, size: 8),
              SizedBox(width: 6),
              Text('Unicode: 0B85-0BD7', style: TextStyle(color: Colors.black54, fontSize: 12)),
            ],
          ),
        ),
        const Spacer(),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.copy, size: 16, color: AppTheme.wineDeep),
          label: const Text('Copy Tamil', style: TextStyle(color: AppTheme.wineDeep, fontWeight: FontWeight.bold)),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppTheme.wineDeep),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(width: 12),
        TextButton.icon(
          onPressed: _clearText,
          icon: const Icon(Icons.delete_outline, size: 16, color: Colors.black54),
          label: const Text('Clear', style: TextStyle(color: Colors.black54)),
        ),
      ],
    );
  }

  Widget _buildLigatureBuffer() {
    return Row(
      children: [
        const Text('LIGATURE BUFFER:', style: TextStyle(color: AppTheme.wineDeep, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.primaryContainer,
            border: Border.all(color: AppTheme.goldPrimary.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text('க்  +  அ  =  க', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 12),
        const Text('Uyirmey composition confirmed via Tamil99 state engine', style: TextStyle(color: Colors.black54, fontSize: 12, fontStyle: FontStyle.italic)),
        const Spacer(),
        const Text('Active Layer: ', style: TextStyle(color: Colors.black54, fontSize: 12)),
        const Text('Primary (அ-ஔ / க்)', style: TextStyle(color: AppTheme.wineDeep, fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildEditorArea() {
    return Container(
      height: 400, // Fixed height to allow scrolling
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ]
      ),
      child: Stack(
        children: [
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            maxLines: null,
            expands: true,
            style: const TextStyle(color: Colors.black87, fontSize: 24, height: 1.8),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Start typing in Tamil99...',
              hintStyle: TextStyle(color: Colors.black26),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: const Row(
                children: [
                  Icon(Icons.circle, color: AppTheme.primary, size: 8),
                  SizedBox(width: 6),
                  Text('Caret 1.06s Pulse Active', style: TextStyle(color: AppTheme.primary, fontSize: 10, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCadenceRow() {
    return Row(
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CADENCE', style: TextStyle(color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold)),
            Text('Steady', style: TextStyle(color: AppTheme.wineDeep, fontSize: 14, fontWeight: FontWeight.bold)),
            Text('142ms', style: TextStyle(color: AppTheme.wineDeep, fontSize: 12)),
          ],
        ),
        const SizedBox(width: 48),
        // Visualizer removed
        const Spacer(),
        _buildStatBlock('SPEED', '48 WPM', subText: '▲ +4.2', subTextColor: AppTheme.wineDeep),
        const SizedBox(width: 32),
        _buildStatBlock('ACCURACY', '98.6%'),
        const SizedBox(width: 32),
        _buildStatBlock('CHARS', '${_controller.text.length}'), // Live char count
        const SizedBox(width: 32),
        _buildStatBlock('SESSION', '24m 18s'),
        const SizedBox(width: 32),
        _buildStatBlock('LATENCY', '0 Typo', valueColor: AppTheme.primary),
      ],
    );
  }

  Widget _buildStatBlock(String label, String value, {String? subText, Color? valueColor, Color? subTextColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: const TextStyle(color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(value, style: TextStyle(color: valueColor ?? Colors.black87, fontSize: 14, fontWeight: FontWeight.bold)),
            if (subText != null) ...[
              const SizedBox(width: 4),
              Text(subText, style: TextStyle(color: subTextColor ?? Colors.black87, fontSize: 10, fontWeight: FontWeight.bold)),
            ]
          ],
        ),
      ],
    );
  }

  Widget _buildVirtualKeyboard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ]
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.keyboard, color: AppTheme.goldPrimary, size: 18),
              const SizedBox(width: 8),
              const Text('Tamil99 Standard Physical Matrix', style: TextStyle(color: AppTheme.wineDeep, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.black12)),
                child: const Text('ISO Mechanical Bed', style: TextStyle(color: Colors.black54, fontSize: 10)),
              ),
              const Spacer(),
              const Text('Left: Uyir (Vowels) · Right: Mei (Consonants)', style: TextStyle(color: Colors.black54, fontSize: 12)),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down, color: Colors.black54, size: 16),
            ],
          ),
          const SizedBox(height: 16),
          // Row 1
          Row(
            children: [
              _buildKey('~', '`', flex: 10),
              _buildKey('!', '1', flex: 10),
              _buildKey('@', '2', flex: 10),
              _buildKey('#', '3', flex: 10),
              _buildKey('\$', '4', flex: 10),
              _buildKey('%', '5', flex: 10),
              _buildKey('^', '6', flex: 10),
              _buildKey('&', '7', flex: 10),
              _buildKey('*', '8', flex: 10),
              _buildKey('(', '9', flex: 10),
              _buildKey(')', '0', flex: 10),
              _buildKey('_', '-', flex: 10),
              _buildKey('Sri', 'ஸ்ரீ', flex: 10, isGold: true),
              _buildKey('', '⌫', flex: 15, isDark: true),
            ],
          ),
          const SizedBox(height: 8),
          // Row 2
          Row(
            children: [
              _buildKey('', 'Tab', flex: 15, isDark: true),
              _buildKey('Q', 'ஆ', flex: 10),
              _buildKey('W', 'ஈ', flex: 10),
              _buildKey('E', 'ஊ', flex: 10),
              _buildKey('R', 'ஐ', flex: 10),
              _buildKey('T', 'ஏ', flex: 10),
              _buildKey('Y', 'ள', flex: 10, isGoldBorder: true), 
              _buildKey('U', 'ற', flex: 10),
              _buildKey('I', 'ன', flex: 10),
              _buildKey('O', 'ட', flex: 10),
              _buildKey('P', 'ண', flex: 10),
              _buildKey('{ [', 'ச', flex: 10),
              _buildKey('} ]', 'ஞ', flex: 10),
              _buildKey('|', '\\', flex: 10),
            ],
          ),
          const SizedBox(height: 8),
          // Row 3
          Row(
            children: [
              _buildKey('', 'Caps', flex: 18, isDark: true),
              _buildKey('A', 'அ', flex: 10),
              _buildKey('S', 'இ', flex: 10),
              _buildKey('D', 'உ', flex: 10),
              _buildKey('F (Pulli)', '்', flex: 10, isRed: true),
              _buildKey('G', 'எ', flex: 10),
              _buildKey('H', 'க', flex: 10, isGoldBorder: true),
              _buildKey('J', 'ப', flex: 10),
              _buildKey('K', 'ம', flex: 10),
              _buildKey('L', 'த', flex: 10),
              _buildKey(': ;', 'ந', flex: 10),
              _buildKey('" \'', 'ய', flex: 10),
              _buildKey('', '↵', flex: 17, isSolidGold: true),
            ],
          ),
          const SizedBox(height: 8),
          // Row 4
          Row(
            children: [
              _buildKey('', 'Shift', flex: 22, isDark: true, showRedDot: true),
              _buildKey('Z', 'ஒ', flex: 10),
              _buildKey('X', 'ஓ', flex: 10),
              _buildKey('C', 'ஔ', flex: 10),
              _buildKey('V', 'வ', flex: 10),
              _buildKey('B', 'ங', flex: 10),
              _buildKey('N', 'ல', flex: 10),
              _buildKey('M', 'ர', flex: 10),
              _buildKey('< ,', 'ழ', flex: 10),
              _buildKey('> .', '.', flex: 10),
              _buildKey('Aytham', 'ஃ', flex: 10, isGoldBorder: true),
              _buildKey('', 'Shift', flex: 26, isDark: true),
            ],
          ),
          const SizedBox(height: 8),
          // Row 5
          Row(
            children: [
              _buildKey('', 'Ctrl', flex: 15, isDark: true),
              _buildKey('', 'Alt', flex: 15, isDark: true),
              _buildKey('', 'SPACE (இடைவெளி)', flex: 80, isDark: true),
              _buildKey('', 'AltGr', flex: 15, isDark: true),
              _buildKey('', 'Hide (F8)', flex: 20, isDark: true, prefixIcon: Icons.visibility_off_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKey(String topLabel, String mainLabel, {
    required int flex, 
    bool isDark = false, 
    bool isRed = false, 
    bool isGold = false, 
    bool isGoldBorder = false,
    bool isSolidGold = false,
    bool showRedDot = false,
    IconData? prefixIcon,
  }) {
    Color bgColor = Colors.white;
    Color borderColor = Colors.black12;
    Color mainTextColor = Colors.black87;
    Color topTextColor = Colors.black54;
    
    if (isDark) {
      bgColor = Colors.grey.shade50;
      mainTextColor = Colors.black54;
    }
    if (isRed) {
      bgColor = AppTheme.primaryContainer;
      borderColor = AppTheme.primary.withOpacity(0.3);
      mainTextColor = AppTheme.primary;
    }
    if (isGoldBorder || isGold) {
      borderColor = AppTheme.goldPrimary;
      mainTextColor = AppTheme.wineDeep;
      if (isGold) {
        bgColor = Colors.orange.shade50;
      }
    }
    if (isSolidGold) {
      bgColor = AppTheme.primary;
      mainTextColor = Colors.white;
      borderColor = AppTheme.primary;
    }

    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Material(
          color: bgColor,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            onTap: () => _onKeyTapped(mainLabel),
            borderRadius: BorderRadius.circular(6),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: borderColor, width: isGoldBorder || isGold || isRed ? 1.5 : 1.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    offset: const Offset(0, 2),
                    blurRadius: 2,
                  )
                ]
              ),
              child: Stack(
                children: [
                  if (showRedDot)
                    Positioned(
                      left: 8,
                      top: 8,
                      child: Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppTheme.primary, shape: BoxShape.circle)),
                    ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (topLabel.isNotEmpty)
                          Text(topLabel, style: TextStyle(color: topTextColor, fontSize: 9)),
                        if (topLabel.isNotEmpty) const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (prefixIcon != null) ...[
                              Icon(prefixIcon, color: mainTextColor, size: 14),
                              const SizedBox(width: 4),
                            ],
                            Text(mainLabel, style: TextStyle(color: mainTextColor, fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductivityOrbit() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.hub, color: AppTheme.goldPrimary, size: 24),
            SizedBox(width: 12),
            Text('Productivity Orbit & Quick Launch', style: TextStyle(color: AppTheme.wineDeep, fontSize: 20, fontWeight: FontWeight.bold)),
            Spacer(),
            Text('Global Access Accelerators', style: TextStyle(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            _buildOrbitCard('Tamil99 Studio', 'Master Canvas', 'Ctrl+1', Icons.keyboard),
            const SizedBox(width: 16),
            _buildOrbitCard('Phonetic Morph', 'English→Tamil', 'Ctrl+2', Icons.translate, iconColor: AppTheme.wineDeep),
            const SizedBox(width: 16),
            _buildOrbitCard('Voice Orb', 'Acoustic Tamil', 'Ctrl+3', Icons.mic, iconColor: AppTheme.primary),
            const SizedBox(width: 16),
            _buildOrbitCard('Typing Arena', 'Sangam Sprint', 'Ctrl+4', Icons.sports_esports),
            const SizedBox(width: 16),
            _buildOrbitCard('PDF Studio', 'Unicode Print', 'Ctrl+5', Icons.picture_as_pdf, iconColor: AppTheme.primary),
          ],
        ),
      ],
    );
  }

  Widget _buildOrbitCard(String title, String subtitle, String shortcut, IconData icon, {Color? iconColor}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: iconColor ?? AppTheme.goldPrimary, size: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.black12)),
                  child: Text(shortcut, style: const TextStyle(color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(title, style: const TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
