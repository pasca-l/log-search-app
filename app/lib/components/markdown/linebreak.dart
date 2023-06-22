import 'package:app/importer.dart';
import 'package:markdown/markdown.dart' as md;

class MarkdownBrBuilder extends MarkdownElementBuilder {
  @override
  Widget visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    return const Text('\n');
  }
}
