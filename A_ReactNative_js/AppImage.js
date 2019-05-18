 
import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,Image} from 'react-native';
 
 
type Props = {}; 

//export default
 class App extends Component<Props> {   
  /*resizeMode 当值为
      cover,保持宽高比,填满容器，可以超出容器
      contain,保持宽高比,在容器内
      stretch,不保持宽高比,填满容器
  */
  render() { 
     //请求外网的数据，Xcode要修改info.plist 文件 App Transport Security Settings 的默认子项Excption Domains删除，增加子项Allow Arbitrary Loads  设置为YES
     //本地图标Xcode要拖动 images.xcassets中
    return (
      <View style={styles.container}> 
         {/*
         https://reactjs.org/logo-og.png
         https://m.baidu.com/static/index/plus/plus_logo_web.png
         android自带的  <uses-permission android:name="android.permission.INTERNET" /> 网络图不显示？??
         <View style={styles.img}> 
            <Image source={{uri:"https://reactjs.org/logo-og.png"}}></Image> 
        </View>
         */} 
        <View style={styles.img}>  
          {/* 
            ./f8.png 是在项目根级目录下,下级有android，ios目录,测试可显示
            */}
             <Image source={require("./f8.png")}></Image>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container:{
    flex:1,
    backgroundColor:"pink",
    alignItems: 'center',
    justifyContent: 'center',
  },
  img:{
    width:300,
    height:300,
    backgroundColor:"gray"
  }
});

 module.exports=App;



