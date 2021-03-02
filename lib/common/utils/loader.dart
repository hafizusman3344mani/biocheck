
import 'dart:convert';

import 'package:flutter/material.dart';

import 'custom_loader_view.dart';

class Loader extends StatelessWidget {


  static

  String abc = """
 
<svg x="0px" y="0px" viewBox="0 0 298 53.9">
  <path class="st0" d="M297.5,41.2h-76.6c-0.5,0-0.9,0.4-1,0.8l-1.6,11.3l-3.1-32c0-0.5-0.4-0.9-0.9-0.9c-0.5,0-0.9,0.3-1,0.8
                       l-5.3,25.5l-2.3-10.9c-0.1-0.4-0.4-0.7-0.9-0.8c-0.4,0-0.8,0.2-1,0.6l-2.3,4.8h-107c0,0,0,0,0,0H82c-1.6,0-2.2,1.1-2.2,1.6
                       l-1.6,11.3l-3.1-52c0-0.5-0.4-0.9-0.9-0.9c-0.5,0-0.9,0.3-1,0.8l-9.3,45.5l-2.3-10.9c-0.1-0.4-0.4-0.7-0.9-0.8c-0.4,0-0.8,0.2-1,0.6
                       l-2.3,4.8H0.5"/>
</svg>
<style>
  
svg {
    height: 100%;
    width: 100%;
  }
  path{
  background: transparent;
    stroke: #b11918;
    stroke-width: 2px;
    fill: transparent;
    stroke-dasharray: 150, 200;
    stroke-dashoffset: 0;
    animation: pulse 4s infinite linear;

  }

@keyframes pulse {
  0% {
    stroke-dashoffset: 0;
  }
  100% {
    stroke-dashoffset: 1050;
  }
}
</style>
  
  """;

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Container(
          color: Colors.transparent,
          height: 120.0,
          child:CustomLoaderView(
            initialUrl: Uri.dataFromString(
                abc,
                mimeType: 'text/html',
                encoding: Encoding.getByName('utf-8')
            ).toString(),
          ),
        ),
    );
  }

}
