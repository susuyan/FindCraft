import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenHelper {

  // 初始化
  static init (context){
    //假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1624)
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1624, allowFontScaling: true)..init(context);
  }
  // 设置字体大小
  static setFontSize (double val){
    return ScreenUtil.getInstance().setSp(val);
  }
  // 设置宽度
  static setWidth (double val){
    return ScreenUtil.getInstance().setWidth(val);
  }

  // 设置高度
  static setHeight (double val){
    return ScreenUtil.getInstance().setHeight(val);
  }

   // 获取设备高度 - DP
  static getScreenHeight(){
    return ScreenUtil.screenHeightDp;
  }
  // 获取设备宽度 - DP
  static getScreenWidth(){
    return ScreenUtil.screenWidthDp;
  }

}