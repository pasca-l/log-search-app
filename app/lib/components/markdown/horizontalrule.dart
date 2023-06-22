import 'package:app/importer.dart';
import 'package:markdown/markdown.dart' as md;

class MarkdownHrBuilder extends MarkdownElementBuilder {
  @override
  Widget visitElementBefore(md.Element element) {
    return const Divider();
  }
}
