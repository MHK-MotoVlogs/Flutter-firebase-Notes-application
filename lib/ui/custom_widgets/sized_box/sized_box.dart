import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeightSizedBox extends StatelessWidget {
  const HeightSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    /// accessing screen width

    final width = MediaQuery.of(context).size.width;

    /// sized box having height according to width

    return SizedBox(
      height: width * 0.05,
    );
  }
}
