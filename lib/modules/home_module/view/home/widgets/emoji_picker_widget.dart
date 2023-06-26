import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EmojiPickerWidget extends StatelessWidget {
  final TextEditingController emojiController;
  const EmojiPickerWidget({super.key, required this.emojiController});

  @override
  Widget build(BuildContext context) {
    return EmojiPicker(
      textEditingController: emojiController,
      onEmojiSelected: (category, emoji) {
        Modular.to.pop();
      },
      onBackspacePressed: null,
      // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
      config: const Config(
        columns: 7,
        // Issue: https://github.com/flutter/flutter/issues/28894
        verticalSpacing: 0,
        horizontalSpacing: 0,
        gridPadding: EdgeInsets.zero,
        initCategory: Category.RECENT,
        bgColor: Color(0xFFF2F2F2),
        indicatorColor: Colors.blue,
        iconColor: Colors.grey,
        iconColorSelected: Colors.blue,
        backspaceColor: Colors.blue,
        skinToneDialogBgColor: Colors.white,
        skinToneIndicatorColor: Colors.grey,
        enableSkinTones: true,
        recentTabBehavior: RecentTabBehavior.RECENT,
        recentsLimit: 28,
        noRecents: Text(
          'No Recents',
          style: TextStyle(fontSize: 20, color: Colors.black26),
          textAlign: TextAlign.center,
        ), // Needs to be const Widget
        loadingIndicator: SizedBox.shrink(), // Needs to be const Widget
        tabIndicatorAnimDuration: kTabScrollDuration,
        categoryIcons: CategoryIcons(),
        buttonMode: ButtonMode.MATERIAL,
      ),
    );
  }
}
