 
import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View} from 'react-native';
 

type Props = {};

//export default
 class Body extends Component<Props> {
  showMsg(msg) {
    alert(msg);
  }
  render() {
    var newsArray=[];
    for(var i in this.props.news)
    {
      var text=(
          //多个Text每个需要唯一的key,给ReactNative用的
          //numberOfLines 显示行数  
          //onPress 手指触摸事件  
          <Text onPress={this.showMsg.bind(this,this.props.news[i])} numberOfLines={2} key={i} 
            style={styles.new_item}> 
              {this.props.news[i]}
          </Text>
        );
        newsArray.push(text);
    }
    return (
      <View style={{flex:1}}> 
          <Text style={styles.new_title}>今日要闻</Text> 
          {newsArray}
      </View>
    );
  }
}
 
const styles = StyleSheet.create({  
 new_title:{
   fontWeight:"bold"
 },
 new_item:{
   fontSize:15,
   lineHeight:30
 }

});

module.exports=Body;



