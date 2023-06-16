import 'package:app/importer.dart';
import 'package:flutter_highlighter/themes/github.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter/painting.dart';

class MarkdownCodeBlockBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    String lang = '';

    if (element.attributes['class'] != null) {
      String langClass = element.attributes['class'] as String;
      lang = langClass.substring(9);
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 4),
        child: HighlightView(
          element.textContent,
          language: lang,
          theme: atomOneDarkTheme,
          padding: EdgeInsets.all(8),
        ),
      ),
    );
  }
  // Widget visitText(md.Text text, TextStyle? preferredStyle) {
  //   return Column(
  //     children: [
  //       Stack(
  //         alignment: Alignment.topRight,
  //         children: [
  //           Container(
  //             width: double.infinity,
  //             decoration: BoxDecoration(
  //               color: Colors.grey,
  //               borderRadius: BorderRadius.circular(5),
  //             ),
  //             child: Padding(
  //               padding: EdgeInsets.fromLTRB(20, 20, 20, 4),
  //               child: Text(
  //                 text.text,
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ),
  //           ),

  //         ],
  //       ),
  //     ],
  //   );
  // }
}

// IconButton(
//   onPressed: () {
//     final code = ClipboardData(text: text.text);
//     Clipboard.setData(code);
//   },
//   tooltip: 'copy to clipboard',
//   icon: Icon(
//     Icons.content_copy_outlined,
//     size: 20,
//     color: Colors.white,
//   ),
// ),

const atomOneDarkTheme = {
  'root':
      TextStyle(color: Color(0xffabb2bf), backgroundColor: Color(0xff282c34)),
  'comment': TextStyle(color: Color(0xff5c6370), fontStyle: FontStyle.italic),
  'quote': TextStyle(color: Color(0xff5c6370), fontStyle: FontStyle.italic),
  'doctag': TextStyle(color: Color(0xffc678dd)),
  'keyword': TextStyle(color: Color(0xffc678dd)),
  'formula': TextStyle(color: Color(0xffc678dd)),
  'section': TextStyle(color: Color(0xffe06c75)),
  'name': TextStyle(color: Color(0xffe06c75)),
  'selector-tag': TextStyle(color: Color(0xffe06c75)),
  'deletion': TextStyle(color: Color(0xffe06c75)),
  'subst': TextStyle(color: Color(0xffe06c75)),
  'literal': TextStyle(color: Color(0xff56b6c2)),
  'string': TextStyle(color: Color(0xff98c379)),
  'regexp': TextStyle(color: Color(0xff98c379)),
  'addition': TextStyle(color: Color(0xff98c379)),
  'attribute': TextStyle(color: Color(0xff98c379)),
  'meta-string': TextStyle(color: Color(0xff98c379)),
  'built_in': TextStyle(color: Color(0xffe6c07b)),
  'attr': TextStyle(color: Color(0xffd19a66)),
  'variable': TextStyle(color: Color(0xffd19a66)),
  'template-variable': TextStyle(color: Color(0xffd19a66)),
  'type': TextStyle(color: Color(0xffd19a66)),
  'selector-class': TextStyle(color: Color(0xffd19a66)),
  'selector-attr': TextStyle(color: Color(0xffd19a66)),
  'selector-pseudo': TextStyle(color: Color(0xffd19a66)),
  'number': TextStyle(color: Color(0xffd19a66)),
  'symbol': TextStyle(color: Color(0xff61aeee)),
  'bullet': TextStyle(color: Color(0xff61aeee)),
  'link': TextStyle(color: Color(0xff61aeee)),
  'meta': TextStyle(color: Color(0xff61aeee)),
  'selector-id': TextStyle(color: Color(0xff61aeee)),
  'title': TextStyle(color: Color(0xff61aeee)),
  'emphasis': TextStyle(fontStyle: FontStyle.italic),
  'strong': TextStyle(fontWeight: FontWeight.bold),
};
