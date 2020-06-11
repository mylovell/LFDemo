
xib 显示到 SB 上.

1、创建 CustomView 文件；
2、创建 CustomXib ，File's owner 为 CustomView ，注意 xib view 的  class 不能是 CustomView(否则死循环) ，为空即可。
3、在 CustomView.m 的 initWithCoder: 中加载 CustomXib ，添加到 CustomView 上。
4、在 SB 上拖拽个view，类型设置为 CustomView，运行后即可显示 CustomXib。
