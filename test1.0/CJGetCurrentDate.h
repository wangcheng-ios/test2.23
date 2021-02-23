//
//  CJGetCurrentDate.h
//  YSMobile
//
//  Created by chenxiaojie on 16/1/18.
//  Copyright © 2016年 笨笨编程. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJGetCurrentDate : NSObject

/**
 获取当前时间距离1970年

 @return interval
 */
+ (NSTimeInterval)cjGetCurrentDate;

/**
 计算指定事件距离1970年时间戳

 @param dateStr yyyy_MM_dd格式时间
 @return interval
 */
+ (NSTimeInterval)cjGetFromDateStr:(NSString *)dateStr;

+ (NSTimeInterval)cjGetFromDate:(NSDate *)date;

//1477462713
+ (NSString *)cj_yyyy_MM_dd_HH_mm_ssStr;
//1477462713SSS
+ (NSString *)cj_yyyy_MM_dd_HH_mm_ss_SSSStr;


/**
 根据时间戳转天、时、分、秒数组

 @param time 时间戳
 @return Array
 */
+ (NSMutableArray *)cjDoubleToString:(double)time;


/**
 *  根据时间戳转指定格式时间字符串
 **/
+ (NSString *)cjTimeIntervalToDateStr_yyyy_MM_dd:(NSString *)timeInterval;
/**
 @brief 格式化时间戳到指定格式时间
 @param timeInterval        13位时间戳
 */
+ (NSString *)cjTimeIntervalToDate13Str_yyyy_MM_dd:(NSString *)timeInterval;
+ (NSString *)cjTimeIntervalToDate13Str_MM_dd:(NSString *)timeInterval;

+ (NSString *)cjTimeIntervalToDateStr_yyyy_MM_dd_HH_mm:(NSString *)timeInterval;
+ (NSString *)cjTimeIntervalToDateStr_yyyy_MM_dd_HH_mm_ss:(NSString *)timeInterval;


#pragma mark - 格式化为指定时间字符串
/**
 @brief 通过 date     格式化时间 到指定格式时间字符串
 @param date            需要格式化 date
 @param formatStr       需要格式化样式 如：yyyy年MM月dd日、hh:mm:ss、yyyy-MM-dd HH:mm:ss 等
 */
+ (NSString *)cjDateStrWith:(NSDate *)date formatStr:(NSString *)formatStr;

/**
 *  yyyy年
 **/
+ (NSString *)cj_yyyy_CdateStrWith:(NSDate *)date;
/**
 *  MM月
 **/
+ (NSString *)cj_MM_CdateStrWith:(NSDate *)date;
/**
 *  dd日
 **/
+ (NSString *)cj_DD_CdateStrWith:(NSDate *)date;
/**
 * yyyy-MM-dd
 */
+ (NSString *)cj_yyyy_MM_dd_EdateStrWith:(NSDate *)date;
/**
 * yyyy年MM月
 */
+ (NSString *)cj_yyyy_MM_CdateStrWith:(NSDate *)date;
/**
 * yyyy-MM
 */
+ (NSString *)cj_yyyy_MM_EdateStrWith:(NSDate *)date;
/**
 * MM-dd
 */
+ (NSString *)cj_MM_dd_EdateStrWith:(NSDate *)date;
/**
 * hh:mm
 */
+ (NSString *)cj_hh_mm_EdateStrWith:(NSDate *)date;
/**
 * hh:mm:ss
 */
+ (NSString *)cj_hh_mm_ss_EdateStrWith:(NSDate *)date;
/**
 * yyyy-MM-dd HH:mm
 */
+ (NSString *)cj_yyyy_MM_dd_HH_mm_EdateStrWith:(NSDate *)date;
/**
 * yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)cj_yyyy_MM_dd_HH_mm_ss_EdateStrWith:(NSDate *)date;


#pragma mark - 格式化为指定Date
/**
 *  yyyy-MM-dd
 */
+ (NSDate *)cj_yyyy_MM_dd_EDateWith:(NSString *)dateStr;


#pragma mark - 根据 formatStr 格式化 String 为 Date
+ (NSDate *)formatStringToDateDateStr:(NSString *)dateStr formatStr:(NSString *)formatStr;


#pragma mark - 时间格式字符串转成另一种时间格式字符串
+ (NSString *)formatStringToDateDateStr:(NSString *)dateStr fromFormatStr:(NSString *)fromFormatStr toFormatStr:(NSString *)toFormatStr;



#pragma mark - Date --> 星期 String
+ (NSString *)weekdayStringFromDate:(NSDate *)inputDate;

@end
