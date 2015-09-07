//
//  UIImage+Extern.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/6.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "UIImage+Extern.h"

@implementation UIImage (Extern)

+ (UIImage *)imageWithName:(NSString *)name {
    NSString *newName = nil;
    UIImage *image = nil;
    if (isAfteriOS7) {
        newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    }
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}

+ (UIImage *)resizeImage:(NSString *)name {
    UIImage *image = [UIImage imageWithName:name];
    CGFloat imageH = image.size.height * 0.5;
    CGFloat imageW = image.size.width * 0.5;
    return [image stretchableImageWithLeftCapWidth:imageW topCapHeight:imageH];
}


@end
