//
//  XDAPI.h
//  CommonTools
//
//  Created by Celia on 2017/7/10.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#ifndef XDAPI_h
#define XDAPI_h

#pragma mark - 域名

#define sessionIDKey @"session_id%@"//session_id 必须拼接用户名区分

#define keychainsServiceName @"com.zhijianshangcheng.cn"//keychains所属的服务

#define RN @"http://zhijianshangcheng.dep.hopex.cn/"  //测试站

//#define RN @"http://zhijianshangcheng.dep.hopex.cn/" //正式站

#define Ad_RN RN@"data/afficheimg/"//广告拼接域名


#pragma mark - app调用接口

#define goods_cate RN@"json/api_goods_cate.php?"//获取商品分类

#define ads_list RN@"json/api_ads_list.php?"//获取广告位列表

#define ads_info RN@"json/api_ads_info.php?"//获取广告列表信息

#define goods_gallery RN@"json/api_goods_gallery.php?"//获取单个商品的相册





#endif /* XDAPI_h */
