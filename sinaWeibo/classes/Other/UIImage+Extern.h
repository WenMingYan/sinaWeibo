//
//  UIImage+Extern.h
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/6.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extern)

/**
 *  根据图片名自动加载适配iOS6、7图片
 *
 *  @param name 图片名
 *
 *  @return 适配后的图片
 */
+ (UIImage *)imageWithName:(NSString *)name ;

/**
 *  根据图片名拉伸图片
 *
 *  @param name 图片名
 *
 *  @return 拉伸后的图片
 */
+ (UIImage *)resizeImage:(NSString *)name;

@end
