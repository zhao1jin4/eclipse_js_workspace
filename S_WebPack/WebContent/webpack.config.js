
const path = require('path');

module.exports = {
  mode: 'development', //production,development
  entry: './src/index.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist')
  }
  , module: {
     rules: [
       {
         test: /\.css$/,
         use: [
           'style-loader',
           'css-loader'
         ]
       }
	   , {
	      test: /\.(png|svg|jpg|gif)$/,
	      use: [
	        'file-loader'
	      ]
	    } 
		
     ]
   }  
    
};