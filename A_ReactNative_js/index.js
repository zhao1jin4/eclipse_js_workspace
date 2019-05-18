/**
 * @format
 */

import {AppRegistry} from 'react-native';

import {name as appName} from './app.json';
//import App from './App';
//AppRegistry.registerComponent(appName, () => App);

// import AppFlex from './AppFlex';
// AppRegistry.registerComponent(appName, () => AppFlex);

// import AppView from './AppView';
// AppRegistry.registerComponent(appName, () => AppView); 

// import AppText from './AppText';
// AppRegistry.registerComponent(appName, () => AppText);

// import AppTouchable from './AppTouchable';
// AppRegistry.registerComponent(appName, () => AppTouchable); 
 
//网络图片不行？？
import AppImage from './AppImage';
AppRegistry.registerComponent(appName, () => AppImage);
 
//事件不太对
// import AppScrollView from './AppScrollView';
// AppRegistry.registerComponent(appName, () => AppScrollView);

//
// import AppFlatList from './AppFlatList'; //ListView过时了用 FlatList 或 SectionList
// AppRegistry.registerComponent(appName, () => AppFlatList);

//------未成功
// import AppNavigation from './AppNavigation'; //Navigator已经没了 npm install --save react-navigation
// AppRegistry.registerComponent(appName, () => AppNavigation);

//也没有TabBarIOS