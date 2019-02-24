import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/resources/StringsConstants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CarouselImages extends StatelessWidget{

  final List<String> comics;
  final int index;

  CarouselImages(this.comics, this.index);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.COLOR_RED,
        title: Text(StringsConstants.CAROUSEL_SCREEN_TITLE),
      ),
      body: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              
              comics[index],
              fit: BoxFit.cover,
            );
          },
          autoplay: false,
          index: index,
          itemCount: comics.length,
          scrollDirection: Axis.horizontal,
          pagination: new SwiperPagination(alignment: Alignment.bottomCenter),
          control: new SwiperControl(),
        ),
    );
  }

  

 
}