import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/layouts/grid_layout.dart';
import 'package:myapp/features/App/models/product_model.dart';
import 'package:myapp/features/App/screens/home/widgets/products/product_card_widget.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class MProducts extends StatelessWidget {
  final Stream<List<ProductModel>> stream;
  const MProducts({
    super.key,
    required this.stream,
  });

  @override
  Widget build(BuildContext context) {
    final size = MHelperFunctions.screenSize(context);

    return StreamBuilder(
      stream: stream,

      // -- Builder
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator(
              strokeCap: StrokeCap.round,
              color: primaryColor,
            ),
          );
        }

        // -- Handle errors
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text(
              'Something went wrong! Please try again.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }

        // -- Handle empty data case
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.only(top: size.height * .20),
              child: Text(
                'N O     P R O D U C T S     F O U N D',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          );
        }

        // -- Render product list
        final List<ProductModel> list = snapshot.data!;
        return MGridLayout(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisExtent: 280,
          itemCount: list.length,
          itemBuilder: (_, index) => MProductCardWidget(
            index: index,
            product: list[index],
          ),
        );
      },
    );
  }
}
