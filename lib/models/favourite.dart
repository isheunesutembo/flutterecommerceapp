import 'package:ephamarcy/models/product.dart';
import'package:freezed_annotation/freezed_annotation.dart';
part 'favourite.freezed.dart';
part 'favourite.g.dart';
@freezed
abstract class Favourite with _$Favourite{
  factory Favourite({
    required List<Product>products
  })=_Favourite;
   factory Favourite.fromJson(Map<String,dynamic>json)=>_$FavouriteFromJson(json);
}