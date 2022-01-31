# express-delivery-logistics-management-
快递物流管理系统(SSM,JQUERY-EASYUI,MYSQL)

快递物流管理系统(SSM,JQUERY-EASYUI,MYSQL)(毕业论文27564字,共78页,程序代码,MySQL数据库)

【项目功能介绍】
需要远程调试咨询的，可以联系QQ-1305637939
1397

物流公司货运配送管理系统要求基于B/S架构，开发出一个对硬件要求相对较低，功能全面能实现物流管理人员日常工作，操作简单方便，易上手，使用流畅，可扩展性强的应用管理系统。主要实现用户注册、登录，角色管理，用户管理，配货管理，车辆管理，货物仓储管理，数据汇总统计功能。具体实现目标为：

⑴角色管理：系统通过角色管理对不同角色进行权限分配，实现不同角色的用户登录系统拥有不同的权限功能。系统分为超级管理员、订单管理员、车辆管理员。新注册用户登录系统没有任何操作权限，因为新注册用户没有被分配角色，这需要超级管理员给新用户分配相应角色使该用户拥有该角色的权限。同时超级管理员可进行新角色的创建，删除已有角色，修改角色功能。

⑵用户管理：拥有用户信息管理权限的用户登录后可创建新用户，修改用户信息(密码、联系方式、邮箱等)，删除用户，为用户分配角色。但用户列表中不会有超级管理员信息，因为超级管理员信息在系统中不应出现不能被修改，防止误操作。

⑶配货管理：配货管理模块中分为发货管理、车源路线管理、订单管理子模块。发货管理，用户可进行订单的创建，系统自动生产15位的订单号(不可修改)，用户填写下单人，下单人联系方式，下单人地址，下单日期，并添加此订单需要运送的货物，保存生成订单。同时可进行订单的修改，批量删除，按订单号查询操作。车源路线管理，用户可选择为还未分配运送车辆的订单分配运送车辆，指定行车路线。车辆处于维修状态的不出现在选择列表中，车辆载重小于货物总重量时通过消息提醒用户重新选择。订单确认，当运送完成时，用户可进行订单确认，确认该订单已完成。

⑷车辆管理：车辆管理模块中分为车辆类型管理、车辆信息管理、行车路线管理子模块。车辆类型管理，用户可创建新的车辆类型，修改车辆类型信息，删除某种车辆类型，当系统中存在车辆属于该类型，则无法删除同时提醒用户。车辆信息管理，用户对车辆信息进行创建、修改、删除操作。行车路线管理，用户可创建新的行车路线，修改路线信息，删除已有的行车路线。

⑸货物仓储管理：该模块主要实现库存分类管理、库存信息管理。库存分类管理，用户可创建新的货物类别，修改删除该货物类别或为该类别添加字类别，删除时库存中有属于该类别的商品则无法删除，系统给出提示消息。库存信息管理，用户可创建新的库存货物，为货物分配所属类型，修改库存信息，删除该货物，但删除是逻辑删除，不是物理删除，货物的状态栏显示该商品已被删除。同时提供分页以及按商品名称查询功能。

⑹数据汇总统计：该模块实现按月度、季度或年度统计各路线的盈利或运货量情况，用户可选择以柱状图或饼图的方式显示。用户可依据统计结构来调整路线及车辆以获得最大化收益。

【运行环境】  Eclipse, IDEA    JDK1.7(JDK1.8)   Tomcat7(Tomcat8)

【技术栈】  JAVA, JSP, SSM, JQUERY, JQUERY EASYUI,   MYSQL, HTML, CSS, JAVASCRIPT

【项目运行截图】
![image](https://user-images.githubusercontent.com/60497009/151756882-7408f7d8-8ff8-4474-a09f-4a905ffb4905.png)
![image](https://user-images.githubusercontent.com/60497009/151756907-f2ae0d3e-e8f1-4a29-9022-7c1503369381.png)
![image](https://user-images.githubusercontent.com/60497009/151756929-d6c1f3b7-d4f5-4c4b-9ee8-9ccf770b79f0.png)
![image](https://user-images.githubusercontent.com/60497009/151756942-85334e6d-e3f1-4118-9f33-3381a6aa804b.png)
![image](https://user-images.githubusercontent.com/60497009/151756965-3adafe61-06d4-49d2-b58f-c377716987d1.png)
![image](https://user-images.githubusercontent.com/60497009/151756990-81439056-01fe-496a-9fed-2c4ecf545cac.png)
![image](https://user-images.githubusercontent.com/60497009/151757004-f455b2cd-0666-4655-830a-20a398f2bd7c.png)
![image](https://user-images.githubusercontent.com/60497009/151757018-069c7216-537e-47a8-9719-0a07e6677c54.png)

