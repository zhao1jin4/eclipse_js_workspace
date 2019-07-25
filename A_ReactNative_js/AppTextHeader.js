 
import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View} from 'react-native';
 

type Props = {};

//export default
 class Header extends Component<Props> {
  render() {
     
    return (
      <View style={styles.title}>
        <Text style={{fontSize:25,fontWeight:"bold",textAlign:"center"}}>
          <Text style={{color:"blue"}}>网易</Text>
          <Text style={{color:"red",backgroundColor:"yellow"}}>新闻</Text>
          <Text>有态度</Text>
        </Text>
      </View>
    );
  }
}
 
const styles = StyleSheet.create({ 
title:{
  marginTop:25,
  height:40,
  borderBottomWidth:1,
  borderBottomColor:"red",
  alignItems:"center"
}
 

});

module.exports=Header;



