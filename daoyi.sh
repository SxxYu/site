#!/bin/bash
function installtheme () {
	echo "开始升级主题"
	echo `date`
	path=$(cd "$(dirname "$0")"; pwd)
	direpath=$path"/themes/next/"
	echo $direpath
	echo "文件夹已存在"
	rm -rf themes/next
	echo "已删除文件夹"
	echo "克隆从github克隆远程库"
	git clone https://github.com/iissnan/hexo-theme-next themes/next
	echo "备份新的主题参数"
	cp themes/next/_config.yml theme_back_config.yml
	echo "删除主题参数"
	rm -f themes/next/_config.yml
	echo "复制主题参数"
	cp _config-thems-next.yml themes/next/_config.yml
	echo "复制站点配置"
	cp _config-site.yml _config.yml
	#echo "复制readme.md"
	#cp README.md
	echo "复制腾讯404界面"
	cp 404.md themes/next/source/404.html
	echo "复制nojekyll"
	cp .nojekyll themes/next/source/.nojekyll
	echo `date`
	echo "升级完毕"
}

function gitcommit () {
    echo "开始提交日志并且提交到github"
    echo "清除旧的参数备份"
    rm _config-thems-next.yml
    rm _config-site.yml
    echo "建立新的备份"
    cp themes/next/_config.yml _config-thems-next.yml
    cp _config.yml _config-site.yml
	echo `date`
	nowdate=`date '+%Y-%m-%d-%T'`
	echo "添加git修改"
	git add .
	echo "提交git修改"
	git commit -m ${nowdate}
	echo "推送git的master分支"
	git push -u origin master
	cd ../
	mkdir website
	cd website
	git clone git@github.com:SxxYu/SxxYu.github.io.git
	cd ../
	cd site
	hexo clean
	hexo g
	cd ../
	cp -rf site/public/* website
	cd website
	git add .
	git commit -m ${nowdate}
	#git remote add origin git@github.com:SxxYu/SxxYu.github.io.git
	git push -u origin master
	#hexo deploy

	cd ../
	hexo clean
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
