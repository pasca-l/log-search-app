import 'package:app/importer.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:highlighter/highlighter.dart' show highlight, Node;

class MarkdownCodeBlockBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitText(md.Text text, TextStyle? preferredStyle) {
    return HighlightedCodeBlock(
      text.text,
      theme: githubTheme,
    );
  }
}

// Referenced https://github.com/predatorx7/highlight/blob/master/flutter_highlighter/lib/flutter_highlighter.dart
class HighlightedCodeBlock extends StatelessWidget {
  HighlightedCodeBlock(
    String input, {
    super.key,
    this.theme = const {},
    int tabSize = 8,
  }) : source = input.replaceAll('\t', ' ' * tabSize);

  final String source;
  final Map<String, TextStyle> theme;

  List<TextSpan> _convert(List<Node> nodes) {
    List<TextSpan> spans = [];
    var currentSpans = spans;
    List<List<TextSpan>> stack = [];

    _traverse(Node node) {
      if (node.value != null) {
        currentSpans.add(node.className == null
            ? TextSpan(text: node.value)
            : TextSpan(text: node.value, style: theme[node.className!]));
      } else if (node.children != null) {
        List<TextSpan> tmp = [];
        currentSpans
            .add(TextSpan(children: tmp, style: theme[node.className!]));
        stack.add(currentSpans);
        currentSpans = tmp;

        for (var n in node.children!) {
          _traverse(n);
          if (n == node.children!.last) {
            currentSpans = stack.isEmpty ? spans : stack.removeLast();
          }
        }
      }
    }

    for (var node in nodes) {
      _traverse(node);
    }

    // remove trailing line break
    var lastSpan = spans.removeLast();
    spans.add(TextSpan(
      text: lastSpan.text?.trimRight(),
      style: lastSpan.style,
    ));

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme['root']?.backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  color: theme['root']?.color,
                ),
                children: _convert(
                  highlight
                      .parse(
                        source,
                        // language: 'dart',
                        autoDetection: true,
                      )
                      .nodes!,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: source));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Copied code to clipboard!')));
                },
                icon: Icon(
                  Icons.content_copy_outlined,
                  size: 18,
                  color: theme['root']?.color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
