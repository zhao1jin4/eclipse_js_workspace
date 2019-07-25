/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View} from 'react-native';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

type Props = {};
export default class App extends Component<Props> {
  render() {
     
    return (
      /*在开始xml前要这样注释
      <Text style={styles.myCenter}>酒店</Text>
      */ 
     
      <View style={[styles.container,styles.myCenter]  /*  多个样式使用数组 ,已经在{}中的注释 */}> 
        <View style={[styles.item,styles.myCenter,styles.myFlex]}>
          <Text >酒店</Text>
        </View>  
       {/* 
       在xml中这样注释
       */ }
        <View style={[styles.item,styles.myFlex,styles.leftRightBorder]}>
          <View style={[styles.myCenter,styles.myFlex,styles.bottomBorder]}>
            <Text >海外酒店</Text>
          </View>  
          <View style={[styles.myFlex,styles.myCenter]}>
            <Text  >物价酒店</Text>
          </View>  
        </View>
        <View style={[styles.item,styles.myFlex]}>
          <View  style={[styles.myCenter,styles.myFlex,styles.bottomBorder]} >
            <Text  >团购</Text>
          </View>  
          <View style={[styles.myCenter,styles.myFlex]} >
            <Text  >客栈</Text>
          </View>  
        </View>
        
      </View>
      
    );
  }
}
 
const styles = StyleSheet.create({
  container: {  
    marginTop:30, 
    backgroundColor:"grey",  
    flexDirection:"row",
  }, 
  myFlex:{
    flex:1
  },
  myCenter:{
    alignItems: 'center',
    justifyContent: 'center',
  },
  item:{
    backgroundColor:"orange",
    margin:1,
    height:80,
    borderRadius:5,
    flexDirection:"column",
  } ,
  leftRightBorder:{
    borderLeftWidth:1,
    borderRightWidth:1,
    borderColor:"white",
  },bottomBorder:{
    borderBottomWidth:1,
    borderColor:"white",
  }



});

// view 类似于div  https://reactnative.cn/docs/view/



