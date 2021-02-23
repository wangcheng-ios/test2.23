//
//  CJGetCurrentDate.m
//  YSMobile
//
//  Created by chenxiaojie on 16/1/18.
//  Copyright © 2016年 笨笨编程. All rights reserved.
//

#import "CJGetCurrentDate.h"

@implementation CJGetCurrentDate

+ (NSTimeInterval)cjGetCurrentDate {
    NSDate *nowDate = [NSDate date];
    return [nowDate timeIntervalSince1970];
}

+ (NSTimeInterval)cjGetFromDateStr:(NSString *)dateStr {
    return [[self cj_yyyy_MM_dd_EDateWith:dateStr] timeIntervalSince1970];
}

+ (NSTimeInterval)cjGetFromDate:(NSDate *)date {
    return [date timeIntervalSince1970];
}


+ (NSString *)cj_yyyy_MM_dd_HH_mm_ssStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    return [formatter stringFromDate:[NSDate date]];
}

+ (NSString *)cj_yyyy_MM_dd_HH_mm_ss_SSSStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmssSSS"];
    return [formatter stringFromDate:[NSDate date]];
}


+ (NSMutableArray *)cjDoubleToString:(double)time {
    NSMutableArray *timeAry = [NSMutableArray array];
    int second = (int)time % 60;
    int minute = (int)time/60 % 60;
    int house = (int)time/3600%24;
    int day = (int)time/(24 * 3600);
    [timeAry addObject:[NSString stringWithFormat:@"%02d", day]];
    [timeAry addObject:[NSString stringWithFormat:@"%02d", house]];
    [timeAry addObject:[NSString stringWithFormat:@"%02d", minute]];
    [timeAry addObject:[NSString stringWithFormat:@"%02d", second]];
    return timeAry;
}

+ (NSString *)cjTimeIntervalToDateStr_yyyy_MM_dd:(NSString *)timeInterval {
    NSTimeInterval time = [timeInterval doubleValue];
    if (time == 0) {
        //time = [self cjGetCurrentDate];
        return nil;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return [self cj_yyyy_MM_dd_EdateStrWith:date];
}

+ (NSString *)cjTimeIntervalToDate13Str_yyyy_MM_dd:(NSString *)timeInterval {
    NSTimeInterval time = [timeInterval doubleValue]/1000;
    return [self cjTimeIntervalToDateStr_yyyy_MM_dd:[NSString stringWithFormat:@"%.0f", time]];
}
+ (NSString *)cjTimeIntervalToDate13Str_MM_dd:(NSString *)timeInterval {
    NSTimeInterval time = [timeInterval doubleValue]/1000;
    if (time == 0) {
        return nil;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return [self cjDateStrWith:date formatStr:@"MM月dd日"];
}

+ (NSString *)cjTimeIntervalToDateStr_yyyy_MM_dd_HH_mm:(NSString *)timeInterval {
    NSTimeInterval time = [timeInterval doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return [self cj_yyyy_MM_dd_HH_mm_EdateStrWith:date];
}

+ (NSString *)cjTimeIntervalToDateStr_yyyy_MM_dd_HH_mm_ss:(NSString *)timeInterval {
    NSTimeInterval time = [timeInterval doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return [self cj_yyyy_MM_dd_HH_mm_ss_EdateStrWith:date];
}


#pragma mark - 根据 formatStr 格式化 Date 为 String
+ (NSString *)formatDateToStringDate:(NSDate *)date formatStr:(NSString *)formatStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatStr];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

+ (NSString *)cjDateStrWith:(NSDate *)date formatStr:(NSString *)formatStr {
    return [self formatDateToStringDate:date formatStr:formatStr];
}

+ (NSString *)cj_yyyy_CdateStrWith:(NSDate *)date{
    return [self formatDateToStringDate:date formatStr:@"yyyy年"];
}
+ (NSString *)cj_MM_CdateStrWith:(NSDate *)date{
    return [self formatDateToStringDate:date formatStr:@"MM月"];
}
+ (NSString *)cj_DD_CdateStrWith:(NSDate *)date{
    return [self formatDateToStringDate:date formatStr:@"dd日"];
}
+ (NSString *)cj_yyyy_MM_dd_EdateStrWith:(NSDate *)date{
    return [self formatDateToStringDate:date formatStr:@"yyyy-MM-dd"];
}
+ (NSString *)cj_yyyy_MM_CdateStrWith:(NSDate *)date{
    return [self formatDateToStringDate:date formatStr:@"yyyy年MM月"];
}
+ (NSString *)cj_yyyy_MM_EdateStrWith:(NSDate *)date{
    return [self formatDateToStringDate:date formatStr:@"yyyy-MM"];
}
+ (NSString *)cj_MM_dd_EdateStrWith:(NSDate *)date{
    return [self formatDateToStringDate:date formatStr:@"MM-dd"];
}
+ (NSString *)cj_hh_mm_EdateStrWith:(NSDate *)date{
    return [self formatDateToStringDate:date formatStr:@"hh:mm"];
}
+ (NSString *)cj_hh_mm_ss_EdateStrWith:(NSDate *)date{
    return [self formatDateToStringDate:date formatStr:@"hh:mm:ss"];
}
+ (NSString *)cj_yyyy_MM_dd_HH_mm_EdateStrWith:(NSDate *)date{
    return [self formatDateToStringDate:date formatStr:@"yyyy-MM-dd HH:mm"];
}
+ (NSString *)cj_yyyy_MM_dd_HH_mm_ss_EdateStrWith:(NSDate *)date{
    return [self formatDateToStringDate:date formatStr:@"yyyy-MM-dd HH:mm:ss"];
}


#pragma mark - 根据 formatStr 格式化 String 为 Date
+ (NSDate *)formatStringToDateDateStr:(NSString *)dateStr formatStr:(NSString *)formatStr {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [dateFormatter setDateFormat:formatStr];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    return date;
}

+ (NSDate *)cj_yyyy_MM_dd_EDateWith:(NSString *)dateStr{
    return [self formatStringToDateDateStr:dateStr formatStr:@"yyyy-MM-dd"];
}


#pragma mark - 时间格式字符串转成另一种时间格式字符串
+ (NSString *)formatStringToDateDateStr:(NSString *)dateStr fromFormatStr:(NSString *)fromFormatStr toFormatStr:(NSString *)toFormatStr
{
    NSDate *date = [self formatStringToDateDateStr:dateStr formatStr:fromFormatStr];
    NSString *dateTime = [self formatDateToStringDate:date formatStr:toFormatStr];
    NSString *currentDateTime = [self formatDateToStringDate:[NSDate date] formatStr:toFormatStr];
    if ([dateTime isEqualToString:currentDateTime]) {
        return @"本月";
    }else
    {
        if ([[dateTime substringToIndex:4] isEqualToString:[currentDateTime substringToIndex:4]]) {
            return [self replaceNumberStr:[CJGetCurrentDate cj_MM_CdateStrWith:date]];
        }else
        {
            return [CJGetCurrentDate cj_yyyy_MM_EdateStrWith:date];
        }
        
    }
}

+ (NSString *)replaceNumberStr:(NSString *)numberStr
{
    if ([numberStr isEqualToString:@"01月"]) {
        return @"1月";
    }else if ([numberStr isEqualToString:@"02月"]) {
         return @"2月";
    }else if ([numberStr isEqualToString:@"03月"]) {
         return @"3月";
    }else if ([numberStr isEqualToString:@"04月"]) {
         return @"4月";
    }else if ([numberStr isEqualToString:@"05月"]) {
         return @"5月";
    }else if ([numberStr isEqualToString:@"06月"]) {
         return @"6月";
    }else if ([numberStr isEqualToString:@"07月"]) {
         return @"7月";
    }else if ([numberStr isEqualToString:@"08月"]) {
         return @"8月";
    }else if ([numberStr isEqualToString:@"09月"]) {
         return @"9月";
    }else if ([numberStr isEqualToString:@"10月"]) {
         return @"10月";
    }else if ([numberStr isEqualToString:@"11月"]) {
         return @"11月";
    }else if ([numberStr isEqualToString:@"12月"]) {
         return @"12月";
    }
    return nil;
}



+ (NSString *)weekdayStringFromDate:(NSDate *)inputDate{
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [weekdays objectAtIndex:theComponents.weekday];
}

@end
