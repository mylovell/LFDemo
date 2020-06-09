
* xib 中 layer 的 IBInspectable 属性设置失效问题：
    如果在 xib 中使用 IBInspectable 属性，与layer 相关的都会失效，比如 cornerRadiu、borderWidth、borderColor 。
    解决办法：进行有效设置：在 storyboard 或代码自定义类的 initWithCoder: 中设置 layer 的相关属性，二者都有效。建议 initWithCoder: 一次性统一设置。
