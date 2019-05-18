 
import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,TouchableOpacity,TextInput} from 'react-native';
 

 
type Props = {};

//lifecyle有变化
    /*
    Mounting 
      constructor()
      static getDerivedStateFromProps()
      render()
      componentDidMount() 
      
    Updating
      static getDerivedStateFromProps()
      shouldComponentUpdate()
      render()
      getSnapshotBeforeUpdate()
      componentDidUpdate()

    Unmounting
      componentWillUnmount()

    Error Handling
      static getDerivedStateFromError()
      componentDidCatch()

    */

//export default
 class App extends Component<Props> { 

   //不能在构造器中用setState(), 但可以 this.state = { counter: 0 },只有构造器可这么用,其它地方要用this.setState() 
  componentDidMount( ) 
  {   
    //setState有变化 
    this.setState((state, props) => {
      return {inputStr: ""};
    }); 

  }
  myOnChangeText(text){
    console.log("text="+text);   
    this.setState((state, props) => {//报 this.setState不存的原因是没有bind
      return {inputStr: text};
    }); 
     
  }
  myOnClickBtn(){
    console.log("state="+this.state); 
    alert(this.state.inputStr);
  }
  
  render() { 
     
    return (
     <View style={styles.container}>
       <TextInput style={styles.text} placeholder="请输入" 
           returnKeyType="search"  /* 输入法的回车显示的搜索 */ onChangeText={this.myOnChangeText.bind(this)}></TextInput>
       <TouchableOpacity onPress={this.myOnClickBtn.bind(this)}   /* TouchableOpacity 点击时会有白层在上面的效果,注释在<>中 */> 
         <View style={styles.btn}>
            <Text>搜索</Text>
         </View>
       </TouchableOpacity>
     </View>
    );
  }
}

const styles = StyleSheet.create({
  container:{
    flexDirection:"row",
    height:35, 
  },
  text:{
    borderWidth:1,
    borderColor:"black",
    width:220
  },
  btn:{ 
    width:55, 
    height:35, 
    backgroundColor:"gray",
    justifyContent:"center",
    alignItems:"center"
  }
});

 module.exports=App;



