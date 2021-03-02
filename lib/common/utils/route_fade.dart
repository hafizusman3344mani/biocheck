import 'package:animations/animations.dart';
import 'package:biocheck/screens/cronic_protocol/select_sport_type.dart';
import 'package:flutter/material.dart';

class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper({
    @required this.id,
    @required this.closedChild,
    @required this.openChild,
  })  : assert(id != null),
   assert(openChild != null),
        assert(closedChild != null);

  final int id;
  final Widget closedChild;
  final Widget openChild;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: Duration(milliseconds: 500),
      openBuilder: (context, closedContainer) {
        return openChild;
      },
      useRootNavigator: true,
      openColor: Colors.transparent.withOpacity(0.56),
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      closedElevation: 0,
      openElevation: 0,

      closedColor: Colors.transparent,
      closedBuilder: (context, openContainer) {
        return InkWell(
          onTap: () {
            openContainer();
          },
          child: closedChild,
        );
      },
    );
  }
}