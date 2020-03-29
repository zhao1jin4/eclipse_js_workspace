import React, {Component} from 'react';
import ReactDOM, {render} from 'react-dom';
import {Provider} from 'react-redux';

import store from './Redux/Store/Store.jsx'
import ControlPanel from './Component/ControlPanel.jsx' 
render(
    <Provider store={store}>   {/* 子标签可以拿到store原理是使用了context */}
    <ControlPanel />
    </Provider>,
    document.body.appendChild(document.createElement('div'))
);

