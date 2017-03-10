# SegmentView
###UIScrollView嵌套UITableView以及动态计算cell的行高
###先上效果图
![效果图](http://upload-images.jianshu.io/upload_images/3873966-126567d871234e3e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
这三个页面是可以左右切换滑动的，纯代码撸，运用了<code>block</code>传值。
[查看源码](https://github.com/KingComeFromChina/SegmentView.git)
##clone
`
git clone https://github.com/KingComeFromChina/SegmentView.git
`
###核心代码
```
CGFloat contentHeight = [model.content boundingRectWithSize:
CGSizeMake([UIScreen mainScreen].bounds.size.width - 30 - 20, MAXFLOAT) options:
NSStringDrawingUsesLineFragmentOrigin attributes:
@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
context:nil].size.height + 5;
```
###如果帮到你了，请点击右上角star
