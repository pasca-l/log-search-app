import 'package:app/importer.dart';
import 'package:markdown/markdown.dart' as md;

class MarkdownH1Builder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return RichText(
      text: TextSpan(
        text: text.text,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
    );
  }
}

class MarkdownH2Builder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return RichText(
      text: TextSpan(
        text: text.text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
    );
  }
}

class MarkdownH3Builder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return RichText(
      text: TextSpan(
        text: text.text,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
    );
  }
}

class MarkdownH4Builder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return RichText(
      text: TextSpan(
        text: text.text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
    );
  }
}

class MarkdownH5Builder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return RichText(
      text: TextSpan(
        text: text.text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
    );
  }
}

class MarkdownH6Builder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return RichText(
      text: TextSpan(
        text: text.text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
    );
  }
}
