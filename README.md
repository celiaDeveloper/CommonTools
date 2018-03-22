# CommonTools
常用的工具类和第三方框架

(1)图片轮播器(SDCycleScrollView)
SDCycleScrollView 常用的图片轮播框架，可以实现图片的点击动作
![Image text](https://github.com/celiaDeveloper/CommonTools/blob/master/Screenshots/imageCycle.png)

(2)对输入的数字或者文字限制
重写父类：UITextField,UITextView,在代理方法中做文字计算和判断，也实现了UITextView有placeHolder功能
![Image text](https://github.com/celiaDeveloper/CommonTools/blob/master/Screenshots/textLimit.png)

(3)加载视图
HPProgressHUD(对MBProgressHUD的封装)
![Image text](https://github.com/celiaDeveloper/CommonTools/blob/master/Screenshots/loadView1.png)

(4)网络请求封装
HPApiSender(对AFNetworking的封装)
XMNetwork(对AFNetworking的封装)
    +(void)request:(NSString *)URL method:(XM_Method)method parameters:(NSDictionary *)parameters tipsShow:(UIView *)view finished:(finishedBlock)finished;

HYBNetwork(对AFNetworking的封装)
    + (HYBURLSessionTask *)getWithUrl:(NSString *)url refreshCache:(BOOL)refreshCache success:(HYBResponseSuccess)success fail:(HYBResponseFail)fail;
    + (HYBURLSessionTask *)postWithUrl:(NSString *)url refreshCache:(BOOL)refreshCache params:(NSDictionary *)params success:(HYBResponseSuccess)success fail:(HYBResponseFail)fail;


(5)segmentControl(DZNSegmentedControl)
![Image text](https://github.com/celiaDeveloper/CommonTools/blob/master/Screenshots/segment1.png)
![Image text](https://github.com/celiaDeveloper/CommonTools/blob/master/Screenshots/segment2.png)
