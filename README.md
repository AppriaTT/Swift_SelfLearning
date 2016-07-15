
![](http://img.shields.io/badge/iOS-8.0%2B-blue.svg) 
![](http://img.shields.io/badge/Swift-2.0-blue.svg)
![License](https://img.shields.io/github/license/lexrus/VPNOn.svg?style=flat)    

# Swift_SelfLearning
学习前辈自学swift的小项目 贴上他的github  https://github.com/allenwong/30DaysofSwift  还有他的简书讲解, 如果学习过程中遇到问题就去看看他的操作 http://www.jianshu.com/p/52032bc4cbe4

# 争取每天坚持一发, 从代码中感受到swift的美, 争取早日重写公司的app

#swift01 Timer
![](https://github.com/AppriaTT/Swift_SelfLearning/blob/master/Swift/Swift01Timer/Swift01Timer/01.png)

#swift02 customFont
自定义字体的切换, 运用到了tableview 和 字体的设定, 需要进行一些操作, 建议去原博看一看
![](https://raw.githubusercontent.com/AppriaTT/Swift_SelfLearning/master/Swift/Swift02CustomFont/Swift02CustomFont/02.png)

#swift03 localVideo
播放本地视频;  加载自定义的tableViewcell: 写了协议, 数据传输 全部使用了代码完成, 没有用sb.有很多不懂的细节

![](https://raw.githubusercontent.com/AppriaTT/Swift_SelfLearning/master/Swift/swift03video/swift03video/03.png)

#swift04 snapchatMenu
模仿了snapchat的界面 左右滑动, 中间是实时采集的视频数据, 可以点击拍照;
中间有一个小坑: 我没有照抄原来作者的代码, 使用了自定义的view 显示层的frame设置需要先后看一下

![](https://raw.githubusercontent.com/AppriaTT/Swift_SelfLearning/master/Swift/swift04%20snapchatMenu/swift04%20snapchatMenu/04.png)

#swift05 roll view
直接使用了collectionView 中间卡了很久不显示图像, 感叹号和问号的意义需要明确一下, 

##问号 ? 有两个意义:
1.声明Optional值变量
2.用在对Optional值操作中，用来判断是否能响应后面的操作

##感叹号!有两个意义
1.强制对Optional值进行拆包(unwrap)
2.声明Implicitly Unwrapped Optionals值，一般用于类中的属性

![](https://raw.githubusercontent.com/AppriaTT/Swift_SelfLearning/master/Swift/swift05%20roll%20view/swift05%20roll%20view/05.gif)

#swift06 find my location 位置反编码
遇到一个语法盲点
placeMark: CLPlacemark?
 if let containsPlacemark = placeMark {} 这样是可以直接判断其中是否有值的
 
 ![](https://raw.githubusercontent.com/AppriaTT/Swift_SelfLearning/master/Swift/swift06%20findMyLocation/swift06%20findMyLocation/06.png)
 
#swift07 下拉刷新 
没有什么盲点 使用的系统的控件

![](https://raw.githubusercontent.com/AppriaTT/Swift_SelfLearning/master/Swift/swift07%20pullToRefresh/swift07%20pullToRefresh/07.gif)

#swift08 播放本地音频 自动切换颜色 
do try catch 语法

![](https://raw.githubusercontent.com/AppriaTT/Swift_SelfLearning/master/Swift/swift08%20randomColorization/swift08%20randomColorization/08.gif)

#swift09 缩放拉伸图片
遇到一个bug点, 放大后图片会位移, 需要在开始的时候设置一下contentInset

![](https://raw.githubusercontent.com/AppriaTT/Swift_SelfLearning/master/Swift/swift09%20ImageScrollerEffect/swift09%20ImageScrollerEffect/09.gif)

#swift10 异步播放小视频
异步播放的代码需要熟悉, 自定了一些控件 ,需要注意一些问题

![](https://github.com/AppriaTT/Swift_SelfLearning/blob/master/Swift/swift10%20videoBG/swift10%20videoBG/10.gif)

#swift11 透明cell

![](https://github.com/AppriaTT/Swift_SelfLearning/blob/master/Swift/swift11%20clearTBCell/swift11%20clearTBCell/11.png)
#swift12 登陆动画
spring动画

![](https://github.com/AppriaTT/Swift_SelfLearning/blob/master/Swift/swift12/swift12/12.gif)

#swift13 飞入的cell
spring动画

![](https://github.com/AppriaTT/Swift_SelfLearning/blob/master/Swift/swift13/swift13/13.gif)

#swift14 转动的表情 选择器
![](https://github.com/AppriaTT/Swift_SelfLearning/blob/master/Swift/swift14%20EmojiMachine/swift14%20EmojiMachine/14.gif)
