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
      <View style={styles.container}>
        <View style={styles.child1}>
        
        </View>  
        <View style={styles.child2}>
        
        </View>
      </View>
    );
  }
}

/*

const styles = StyleSheet.create({
  container: { 
    margin:30,
    width:300,
    height:500,
    backgroundColor:"yellow",
    // flexDirection 默认是竖向column  http://www.runoob.com/css3/css3-flexbox.html
    flexDirection:"row", 
    justifyContent: 'center', //横向
    alignItems: 'center', //竖向 
  },
  child1: {
    width:100,
    height:100, 
    backgroundColor:"green",
  },
  child2: {
    width:100,
    height:100, 
    backgroundColor:"blue",
  },
});
*/

//flex :1 表示子组件要以把父组件填满,如有多个组件flex :1均分,如大于1按总数的百分比
const styles = StyleSheet.create({
  container: { 
    flex :1,
    margin:30, 
    backgroundColor:"yellow", 
  },
  child1: {
    flex :1, //只是高度上点1/3
    backgroundColor:"green",
  },
  child2: {
    flex :2, //只是高度上点2/3
    backgroundColor:"blue",
  },
});
 


