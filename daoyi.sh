#!/bin/bash
function installtheme () {
	echo "开始升级主题"
	echo `date`
	path=$(cd "$(dirname "$0")"; pwd)
	direpath=$path"/themes/next"
	echo $direpath
	if [ ! -d "$direpath" ]; then
		echo "文件夹不存在！"
	else
		echo "文件夹存在！"
		echo "删除主题文件夹"
		rm -rf themes/next
	fi
	echo "克隆从github克隆远程库"
	git clone https://github.com/iissnan/hexo-theme-next themes/next
	echo "备份新的主题参数"
	mv themes/next/_config.yml themes/next/new_theme_config.yml
	#echo "删除主题参数"
	#rm -f themes/next/_config.yml
	echo "复制主题参数"
	cp _config-thems-next.yml themes/next/_config.yml
	#echo "复制站点配置"
	#cp _config-site.yml _config.yml
	echo "删除主题目录的Git记录文件"
	rm -rf themes/next/.git
	echo "删除页脚文件"
	rm -rf themes/next/layout/_partials/footer.swig
	echo "复制页脚文件到主题目录"
	cp footer.swig themes/next/layout/_partials/footer.swig
	#echo "复制readme.md"
	#cp README.md
	echo "复制腾讯404界面"
	cp 404.md themes/next/source/404.html
	echo "复制nojekyll"
	cp .nojekyll themes/next/source/.nojekyll
	echo `date`
	echo "升级完毕"
}

function tests () {
	path=$(cd "$(dirname "$0")"; pwd)
	direpath=$path"/themes/next"
	echo $direpath
	if [ ! -d "$direpath" ]; then
		echo "文件夹不存在！"
	else
		echo "文件夹存在！"
		echo "删除主题文件夹"
	fi
	
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
	path=$(cd "$(dirname "$0")"; pwd)
	direpath=$path"/.deploy"
	echo $direpath
	if [ ! -d "$direpath" ]; then
		echo "文件夹不存在！克隆！"
		git clone git@github.com:SxxYu/SxxYu.github.io.git .deploy	
	else
		echo "文件夹存在！拉取"
		echo "进入！.deploy目录"
		cd .deploy
		echo "开始拉取。。。。"
		git pull
		echo "拉取完毕进入上级目录"
		cd ../
	fi
	echo "清除hexo生成的静态文件"
	hexo clean
	echo "生成新的静态文件"
	hexo g
	echo "复制静态文件到.deploy目录"
	cp -rf public/* .deploy
	echo "进入.deploy目录"
	cd .deploy
	echo "添加静态页面更改"
	git add .
	echo "提交静态页面更改"
	git commit -m ${nowdate}
	#git remote add origin git@github.com:SxxYu/SxxYu.github.io.git
	echo "PUSH到github仓库"
	git push -u origin master
	#hexo deploy
	#cd ../
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
	x)
	installhexo
	;;
	z)
	installtheme
	;;
	b)
	gitcommit
	;;
	t)
	tests
	;;
	*)
	echo "daoyi.sh x 不同的电脑部署hexo"
	echo "daoyi.sh z 重新部署next主题"
	echo "daoyi.sh b 提交博客源代码并且发布"
	;;
esac
