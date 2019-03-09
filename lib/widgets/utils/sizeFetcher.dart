import 'package:flutter/widgets.dart';

class SizeFetcher extends StatefulWidget {
  final Function(Size) sizeFetched;
  final Widget child;

  SizeFetcher({@required this.sizeFetched, @required this.child});

  @override
  _SizeFetcherState createState() => _SizeFetcherState();
}

class _SizeFetcherState extends State<SizeFetcher> {
  GlobalKey _fetchByKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  _afterLayout(_) {
    _getSizes();
  }

  _getSizes() {
    final RenderBox widgetRenderBox = _fetchByKey.currentContext.findRenderObject();
    final widgetSize = widgetRenderBox.size;
    widget.sizeFetched(widgetSize);
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: true,
      child: Container(
        key: _fetchByKey,
        child: widget.child,
      ),
    );
  }
}
