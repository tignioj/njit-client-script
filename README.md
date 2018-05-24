简单用法一：
====

	用winscp解压全部文件到root目录

	执行chmod +x run.sh

	执行
	<code>./run.sh 你的账号 你的密码 网卡 mac地址</code>
	（mac地址可输入可不输，具体看你们学校是否绑定mac）
	
	举例
	1.带mac
		./run.sh 12345678 abcba eth0.2 "AA:BB:CC:DD:EE:FF:GG"
	2.不带mac
		./run.sh 12345678 abcba eth0.2


用法二：
====
	对于k2p,k2
	用winscp解压全部文件到root目录
	执行chmod +x njit-client-mips
	执行./njit-client-mips 账号 密码 网卡


##问题分析：
1.如果出现Server success等字眼，那么恭喜你可能成功了，但不一定，上个网就知道
2.如果出现mac 乱码，去前端192.168.2.1（具体看你的路由器）改wan口的mac地址，如果没的改，就用以下方法

	ifconfig 网卡 down
	ifconfig 网卡 hw ether mac地址
	ifconfig 网卡 up
##mac地址查看方法，window按win+r 输入cmd进入控制台，输入ipconfig /all
找到以太网对应的物理地址
或者去window的inode客户端找————>设置-->INCs--> Ethernet 对应的 Mac address




##怎么看网卡？
输入ipconfig,最后一个 带eth的一般就是路由器wan口的网卡
####比如输入ipconfig假如出现

<code>
lo :
	blalbalk

eth0:
	blalbala
eth1
	balabala

eth0.2
	blalbala
ens
	blabala
</code>
那么这里面的eth0.2可能就是你的以太网网卡
