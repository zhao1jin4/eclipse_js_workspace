 
import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,ScrollView,RefreshControl} from 'react-native';  
 
type Props = {};
 

//export default
 class App extends Component<Props> {    
  render() { 
    /* ScrollView要一个高度 ,也在在父级元素约束
   
    */ 
    return (
      <View style={styles.container}> 
          <ScrollView 
               showsVerticalScrollIndicator={true} 
                onScrollBeginDrag={this.myBeginDrag}
                onScrollEndDrag={this.myEndDrag}
                onMomentumScrollBegin={this.myBeginMove}
                onMomentumScrollEnd={this.myEndMove}
                refreshControl={
                  <RefreshControl refreshing={false} onRefresh={this.myOnRefresh}></RefreshControl>
                }
           > 
                 {/*  fefreshControll 就是刷新时顶部转的那个图标 refreshing={false}表示开始不显示
                 android版本显示的不好看，图标是显示浮在上面
                  只对iOS平台的属性 tintColor="red" title="我的正在刷新"
                  */}
            <View style={styles.view_item}></View>
            <View style={styles.view_item}></View>
            <View style={styles.view_item}></View> 
          </ScrollView>
      </View>
    );
  }
  myBeginDrag(){
    console.log("myBeginDrag");//开始拖动时调用
  }
  myEndDrag(){
    console.log("myEndDrag");
  }
  myBeginMove(){
    console.log("myBeginMove");//为何和myEndDrag 一起被用？  拖动到边界时没有弹跳？？
  }
  myEndMove(){
    console.log("myEndMove");//为何和myEndDrag 一起被用？
  }
  myOnRefresh(){
    console.log("myOnRefresh");
  }
}

const styles = StyleSheet.create({
  container:{
    flex:1,
    backgroundColor:"yellow", 
  }, 
  view_item:{
    margin:10,
    height:300,  
    backgroundColor:"red"
  }

});

 module.exports=App;



