#!/bin/bash
function installtheme () {
	echo "开始升级主题"
	echo `date`
	path=$(cd "$(dirname "$0")"; pwd)
	direpath=$path"/themes/next/"
	echo $direpath
	if [ ! -d $direpath ]; then 
	echo "文件夹已存在"
	rm -rf themes/next 
	echo "已删除文件夹"
	fi 
	echo "克隆从github克隆远程库"
	git clone https://github.com/iissnan/hexo-theme-next themes/next
	echo "备份新的主题参数"
	cp themes/next/_config.yml themes/next/back_config.yml
	echo "删除主题参数"
	rm -f themes/next/_config.yml
	echo "复制主题参数"
	cp _config-thems-next.yml themes/next/_config.yml
	echo "复制站点配置"
	cp _config-site.yml _config.yml
	echo "赋值readme.md"
	cp README.md themes/next/source/README.md
	echo "复制腾讯404界面"
	cp 404.md themes/next/source/404.html
	echo `date`
	echo "升级完毕"
}

function gitcommit () {
    echo "开始提交日志并且提交到github"
	echo "清除旧的静态页面"
	hexo clean
	echo `date`
	nowdate=`date +%Y%m%d`
	echo "添加git修改"
	git add .
	echo "提交git修改"
	git commit -m ${nowdate}
	echo "推送git的master分支"
	git push -u origin master

	#echo "生成静态页面并推送"
	#hexo generate
	#echo "发布静态页面"	
	#hexo deploy
	echo "如果没有错误就是搞定了"
}

function installhexo () {
	echo "安装hexo主程序"
	npm install -g hexo-cli
	npm install
	echo "安装插件"
	npm install hexo-generator-feed --save
	npm install hexo-generator-index --save
	npm install hexo-generator-archive --save
	npm install hexo-generator-tag --save
	npm install hexo-generator-sitemap --save
	npm install hexo-deployer-git --save
	npm install hexo-generator-category --save
	npm install hexo-generator-baidu-sitemap --save
	echo "如果没有错误就是搞定了"
}
case $1 in
	n)
	installhexo
	;;
	t)
	installtheme
	;;
	b)
	gitcommit
	;;
	*)  
	echo "daoyi.sh n 不同的电脑部署hexo"
	echo "daoyi.sh t 重新部署next主题"
	echo "daoyi.sh b 提交博客源代码并且发布"
	;;
esac