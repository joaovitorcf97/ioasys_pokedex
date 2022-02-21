import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ioasys_pokedex/app/core/theme/theme.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 16,
      ),
      child: Column(
        children: [
          SizedBox(
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                ),
                const SizedBox(width: 8),
                const Text(
                  'ioasys pokédex',
                  style: TextStyle(
                    color: AppTheme.pink,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
