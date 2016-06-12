#nvmhome-docker

```
$ whoami
name:		kelvin
email:		kelvv@outlook.com
homepage:	www.kelvv.com
github:		https://github.com/kelvv
blog:		[](http://www.jianshu.com/users/0a730b7c99b7/latest_articles)
```

****

This is a docker image . 

It will give you ability to deploy app in nodejs quickly , just use **docker**

Out of the box it pre-installed the following features:

* pm2         -- process manager for nodejs
* my-deploy   -- code autoupdate tool
* git         -- version control system
* ssh         -- remoting tool
* nvm         -- version manager for nodejs
* npm         -- package manager
* node        -- So,you know


###requirement

**docker** : you should install docker in your server first

###export port
* 22 : ssh

###usage

1. you had simple app in git (github,bitbucket ...)

	```	
$ docker run -p 0.0.0.0:${ssh-port}:22 -p 0.0.0.0:${app-port}:${real-app-port} -e 'projecturl=${git-https-url}' -e "autoupdate=true" -itd  kelvv/nvmhome-docke
	```

2. you need to install something else 

	```
	$ git clone https://github.com/kelvv/nvmhome-docker.git
	# change the Dockerfile ~.~
	```

### manage

This is the most easy way to manage your docker container with :
```
$ ssh ip -p ${ssh-port}  
```
    

###Contributing

Contributions welcome

###License

MIT
