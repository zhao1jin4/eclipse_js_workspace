 
import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,FlatList} from 'react-native';  
 
type Props = {};
 
var allEmployees=[
  {
    name:"张三",
    age:20
  },
  {
    name:"李四",
    age:30
  },
  {
    name:"王五",
    age:24
  },
];
//export default
 class App extends Component<Props> {   
  
  render() 
  {  
    return (
      <FlatList
        data={allEmployees}
        renderItem={
            ({item}) => 
              <View style={{height:30 ,flexDirection:"row"}}>   {/*  key={item.age}没用？？ */}
               <View style={{backgroundColor:"yellow",borderBottomWidth:1,borderColor:"gray"}}><Text>name:{item.name} </Text></View>  
               <View style={{backgroundColor:"pink",borderBottomWidth:1,borderColor:"gray"}}><Text>age:{item.age} </Text></View>
              </View>
          }
      />
    );
  } 

}
 
const styles = StyleSheet.create({ 
 
 });

 module.exports=App;



