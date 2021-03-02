
import 'dart:convert';

import 'package:flutter/material.dart';

import 'custom_loader_view.dart';

class Loader44 extends StatelessWidget {


  static

  String abc = """
 
<style>
body {
  background-color: #015871;
}

.container {
  position: relative;
  width: 700px;
  height: 300px;
  margin: 100px auto;
}

.shape {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  border-top-right-radius: 0;
  transform: rotate(-45deg);
  float: left;
  margin-top: 50px;
  margin-left: 20px;
  border: 5px solid #fff;
  overflow: hidden;
  position: relative;
}

.frame {
  position: absolute;
  transform: rotate(45deg);
  background-color: rgba(0, 234, 255, 0.5);
  bottom: -8px;
  left: 15px;
  right: 0;
  height: 245px;
  width: 200px;
}

.wave {
  position: absolute;
  top: 50%;
  left: 0;
  width: 200%;
  height: 200%;
  transform: translate(-25%, 0);
  background: #4973ff;
  animation: fill-up 10s ease infinite;
}

@keyframes fill-up {
  to {
    top: -60%;
  }
}

.wave:before,
.wave:after {
  content: '';
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 50%;
  transform: translate(-50%, -75%);
  background: #000;
}

.wave:before {
  border-radius: 45%;
  background: rgba(1, 88, 113, 1);
  animation: animate 3s linear infinite;
}

.wave:after {
  border-radius: 40%;
  background: rgba(1, 88, 113, 0.5);
  animation: animate 3s linear infinite;
}

@keyframes animate {
  0% {
    transform: translate(-50%, -75%) rotate(0deg);
  }
  100% {
    transform: translate(-50%, -75%) rotate(360deg);
  }
}
</style>
<div class="container">
  <div class="shape">
    <div class="frame">
      <div class="wave">

      </div>
    </div>
  </div>
</div>
<style>
  

  
  """;

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Container(
            color: Colors.transparent,
            height: 320.0,
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
