
import 'package:analyzer/dart/element/element.dart' as analyzer;
import 'package:craft_element_builder/element_builder.dart';

abstract class LibraryElementVisitor implements analyzer.ElementVisitor<ElementBuilder> {
  LibraryElementBuilder visitLibraryElement(analyzer.LibraryElement element) {

  }
}
