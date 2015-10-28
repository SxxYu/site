title: hexo常用命令
---
##安装hexo

```
npm install hexo-cli -g
npm install hexo --save
```

##初始化
```
hexo init
npm install --save
npm install
```

##安装插件
```
npm install hexo-generator-index --save
npm install hexo-generator-archive --save
npm install hexo-generator-category --save
npm install hexo-generator-tag --save
npm install hexo-server --save
npm install hexo-deployer-git --save
npm install hexo-deployer-heroku --save
npm install hexo-deployer-rsync --save
npm install hexo-deployer-openshift --save
npm install hexo-renderer-marked@0.2 --save
npm install hexo-renderer-stylus@0.2 --save
npm install hexo-generator-feed@1 --save
npm install hexo-generator-sitemap@1 --save
```
##主题相关
```
git clone https://github.com/iissnan/hexo-theme-next themes/next	#	下载主题
git clone https://github.com/iissnan/hexo-theme-next themes/next#	更新
```

##hexo简写命令
```
hexo n #新
hexo g #构建
hexo s #服务器demo
```

##部署github
```
git clone git://github.com/jquery/jquery.git	#检出仓库
git remote -v									#查看远程仓库
git remote add [name] [url]						#添加远程仓库
git remote rm [name]							#删除远程仓库
git remote set-url --push [name] [newUrl]		#修改远程仓库
git pull [remoteName] [localBranchName]			#拉取远程仓库
git push [remoteName] [localBranchName]			#推送远程仓库
```



