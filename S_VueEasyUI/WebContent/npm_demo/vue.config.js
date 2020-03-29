//这个只对vue-cli 3 开始才行
/*
 如是vue-cli 2 版本
 设置config/index.js中的proxyTable代理 
测试OK,但要加前缀/api
proxyTable: {
	'/api':{
        target:'http://localhost:8080/S_VueEasyUI',
        changeOrigin:true,
        pathRewrite:{
            '^/api':''
        }
    }
}
 */
module.exports = { 
	devServer: {
		proxy: 'http://localhost:8080/S_VueEasyUI'
	}
}