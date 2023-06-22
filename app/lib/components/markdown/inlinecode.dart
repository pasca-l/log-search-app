import 'package:app/importer.dart';
import 'package:markdown/markdown.dart' as md;

class MarkdownInlineCodeBuilder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return Container(
      color: Colors.grey,
      child: Text(text.text),
    );
  }
}
