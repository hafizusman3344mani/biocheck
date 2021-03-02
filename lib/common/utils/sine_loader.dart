
import 'dart:convert';

import 'package:flutter/material.dart';

import 'custom_loader_view.dart';

class SinLoader extends StatelessWidget {


  static

  String abc = """
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 381 77" style="enable-background:new 0 0 381 77;" xml:space="preserve">
<style type="text/css">
	.st0{fill:none;}
	.st1{fill:none;stroke:#32394B;}
	.st2{fill:none;stroke:#32394B;stroke-width:0.7;}
</style>
<g>
	<path class="st2" d="M380.9,61.6h-33c-2.5,0-4.6-1.9-4.8-4.5c-1.7-24.6-3.7-47.3-6-40.7c-3.9,11.3-5.9,45.1-15.4,45.1h-36h-33
		c-2.5,0-4.6-1.9-4.8-4.5c-1.7-24.6-3.7-47.3-6-40.7c-3.9,11.3-5.9,45.1-15.4,45.1h-36h-33c-2.5,0-4.6-1.9-4.8-4.5
		c-1.7-24.6-3.7-47.3-6-40.7c-3.9,11.3-5.9,45.1-15.4,45.1h-36h-33c-2.5,0-4.6-1.9-4.8-4.5c-1.7-24.6-3.7-47.3-6-40.7
		c-3.9,11.3-5.9,45.1-15.4,45.1h-36"/>
</g>
</svg>

<style>
  
svg {
    height: 100%;
    width: 100%;
  }
  path{
  background: transparent;
    stroke: #b11918;
    stroke-width: 0.5px;
    fill: transparent;
    stroke-dasharray: 350, 200;
    stroke-dashoffset: 0;
    animation: pulse 6s infinite linear;

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
