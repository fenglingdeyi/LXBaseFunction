//
//  LXHellpClass.m
//  LXBaseConfigProject
//
//  Created by lx on 16/1/10.
//  Copyright © 2016年 lx. All rights reserved.
//

#import "LXHelpClass.h"
#import "SynthesizeSingleton.h"
#include <sys/sysctl.h>
#import <sys/utsname.h>

@interface LXHelpClass ()
{
    UILabel *promptLabel;
    UILabel *promptNoNetLabel;
}

@end

@implementation LXHelpClass

SYNTHESIZE_SINGLETON_FOR_CLASS(LXHelpClass);

// 当第一次使用这个单例时，会调用这个init方法。
- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

+ (NSString*)devicePlatformString
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return platform;
}

+ (NSString*)deviceString
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s (A1700/1688)";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus (A1699/A1687)";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G (A1213)";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G (A1288)";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G (A1318)";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G (A1367)";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G (A1421/A1509)";
    if ([platform isEqualToString:@"iPod6,1"])   return @"iPod Touch 5G (A1441/A1509)";
    if ([platform isEqualToString:@"iPod7,1"])   return @"iPod Touch 6G (A1521/A1509)";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G (A1219/A1337)";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2 (A1395)";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2 (A1396)";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2 (A1397)";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2 (A1395+New Chip)";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G (A1432)";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G (A1454)";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G (A1455)";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3 (A1416)";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3 (A1403)";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3 (A1430)";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4 (A1458)";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4 (A1459)";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4 (A1460)";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air (A1474)";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air (A1475)";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air (A1476)";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G (A1489)";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G (A1490)";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G (A1491)";
    if ([platform isEqualToString:@"iPad5,3"])   return @"iPad Air2 (A1566)";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
}

+ (NSDictionary *)getTestFileContent
{
    NSError*error;
    NSString *filePath = [[NSBundle  mainBundle]pathForResource:@"TestFile"ofType:@"json"];
    NSData *jdata = [[NSData alloc] initWithContentsOfFile:filePath];
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingMutableContainers error:&error];
    
    return jsonObject;
}

+ (CGFloat)calculateLabelighWithText:(NSString *)textStr withMaxSize:(CGSize)maxSize withFont:(CGFloat)font
{
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName, nil];
    CGSize actualSize = [textStr boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
    return actualSize.height;
}

+ (void)setDeviceLandscape:(NSInteger)direction
{
    SEL selector = NSSelectorFromString(@"setOrientation:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
    [invocation setSelector:selector];
    [invocation setTarget:[UIDevice currentDevice]];
    NSInteger val = direction;//UIInterfaceOrientationLandscapeRight;
    [invocation setArgument:&val atIndex:2];
    [invocation invoke];
}

+ (NSString *)getTimeByProgress:(float)current
{
    NSDate *pastDate = [NSDate dateWithTimeIntervalSince1970: current];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    if (current / 3600 >= 1) {
        [formatter setDateFormat:@"HH:mm:ss"];
    } else {
        [formatter setDateFormat:@"mm:ss"];
    }
    
    return [formatter stringFromDate:pastDate];
}

+ (UIImage *)getEllipseImageWithImage:(UIImage *)originImage
{
    CGFloat padding = 2; // 圆形图像距离图像的边距
    UIColor *epsBackColor = [UIColor clearColor]; // 图像的背景色
    CGSize originsize = originImage.size;
    CGRect originRect = CGRectMake (0, 0, originsize.width, originsize.height);
    UIGraphicsBeginImageContext(originsize);
    CGContextRef ctx = UIGraphicsGetCurrentContext ();
    // 目标区域。
    CGRect desRect = CGRectMake(padding, padding,originsize.width-(padding*2), originsize.height-(padding*2));
    // 设置填充背景色。
    CGContextSetFillColorWithColor(ctx, epsBackColor. CGColor);
    UIRectFill(originRect); // 真正的填充
    // 设置椭圆变形区域。
    CGContextAddEllipseInRect(ctx,desRect);
    CGContextClip(ctx); // 截取椭圆区域。
    [originImage drawInRect:originRect]; // 将图像画在目标区域。
    UIImage *desImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return desImage;
}

+ (NSURL *)networkResourcesIntoLocalWithHttp:(NSString *)httpStr withLocalFile:(NSString *)fileName
{
    NSData * audioData = [NSData dataWithContentsOfURL:[NSURL URLWithString:httpStr]];
    //将数据保存到本地指定位置
    NSString *docDirPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", docDirPath , fileName];
    [audioData writeToFile:filePath atomically:YES];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    return fileURL;
}

@end



