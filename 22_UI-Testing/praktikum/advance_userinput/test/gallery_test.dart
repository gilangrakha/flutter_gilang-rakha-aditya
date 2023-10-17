import 'package:advance_userinput/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Gallery Page should display images', (WidgetTester tester) async {
    // Build the GalleryPage widget
    await tester.pumpWidget(MaterialApp(
      home: GalleryPage(),
    ));

    // Verify that the 'Gallery' title is present
    expect(find.text('Gallery'), findsOneWidget);

    // Verify that the 'yourImageList' images are displayed
    for (final image in yourImageList) {
      expect(find.byWidgetPredicate((widget) {
        if (widget is Image) {
          final Image img = widget as Image;
          if (img.image is AssetImage) {
            final AssetImage assetImage = img.image as AssetImage;
            return assetImage.assetName == image;
          }
        }
        return false;
      }), findsOneWidget);
    }
  });

  // Add more test cases as needed
}
