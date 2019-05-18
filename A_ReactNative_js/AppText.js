 
import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View} from 'react-native';
 
import Header from './AppTextHeader';
import Body from './AppTextBody';


const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

type Props = {};

//export default
 class App extends Component<Props> {
  render() { 
      var allNews=[
        "1.这是第一条，这是第一条，这是第一条，这是第一条，这是第一条，这是第一条，这是第一条，这是第一条，这是第一条，这是第一条",
        "2.这是第二条"
      ]
    return (
      <View style={{flex:1}}> 
        <Header></Header> 
        <Body news={allNews}></Body>
        <Text>hello2</Text>
     </View>
    );
  }
}

 module.exports=App;



