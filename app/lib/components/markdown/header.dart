import 'package:app/importer.dart';
import 'package:markdown/markdown.dart' as md;

class MarkdownH1Builder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
          ),
          child: Text(
            text.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class MarkdownH2Builder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
          ),
          child: Text(
            text.text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
