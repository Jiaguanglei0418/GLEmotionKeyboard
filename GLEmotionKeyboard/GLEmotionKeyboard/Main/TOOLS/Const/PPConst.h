#import <Foundation/Foundation.h>

#define APPKEY_Sina @"1114982661"
#define APPSECRET_Sina @"6cb2f4419209cd4a40e1c98b94e554a4"
#define APPREDIRECT_Sina @"www.baidu.com"

#define ACCOUNT_PATH [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]


/**
 *  1. RGB背景色
 */
#define PPCOLOR_RGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define PPCOLOR_BG [UIColor colorWithRed:231/255.0 green:231/255.0 blue:231/255.0 alpha:1]

#define PPCOLOR_RANDOM PPCOLOR_RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))


#define PPCOLOR_TABBAR_TITLE PPCOLOR_RGB(236,103,0)
#define PPCOLOR_TABBAR_NORMAL PPCOLOR_RGB(107,107,107)
#define PPCOLOR_TABBAR_DISABLED PPCOLOR_RGB(177,177,177)

// 监听选中城市 通知
extern NSString *const PPHomeCitySearchVcCitySelectedNoticefication;
extern NSString *const PPHomeCitySearchVcSelectedCityName;


// 监听选中排序 通知
extern NSString *const PPHomeSortVcNoticefication;
extern NSString *const PPHomeSortSelectedSort;


// 监听修改分类 通知 -- dropdown cell
extern NSString *const PPHomeCategoryVcCategorySelectedNoticefication;
extern NSString *const PPHomeCategorySelectedCategory;
extern NSString *const PPHomeCategorySelectedSubCategoryName;


// 监听修改区域 通知
extern NSString *const PPHomeRegionVcRegionSelectedNoticefication;
extern NSString *const PPHomeRegionSelectedRegion;
extern NSString *const PPHomeRegionSelectedSubRegionName;

// 监听收藏, 取消收藏 通知
extern NSString *const PPCollectionStateDidChangeNoticefication;
extern NSString *const PPIsCollectedkey;
extern NSString *const PPCollectDealkey;


// 监听支付宝 完成支付, 跳转
extern NSString *const PPAlipayResultNoticefication;
extern NSString *const PPAlipayResultURLKey;



/**
 *  2.通知
 */
#define PPNOTICEFICATION [NSNotificationCenter defaultCenter]



/**
 *  3. 获取屏幕宽度
 */
#define PP_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define PP_SCREEN_HIGHT [UIScreen mainScreen].bounds.size.height
#define PP_SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define PP_SCREEN_RECT [UIScreen mainScreen].bounds


/**
 *  4. weakSelf
 */
#define WS(weakSelf)  __weak typeof(self)weakSelf = self


// ---------------------------- 打印日志  ----------------------------------
// 自定义log
#ifdef DEBUG
#define PPLog(FORMAT, ...) fprintf(stderr,"\n%s %d\n %s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
//#define PPLog(...) NSLog(@"%s %@",__func__, [NSString stringWithFormat:__VA_ARGS__])

#else
#define PPLog(FORMAT, ...)

#endif


// 打印返回responsedata
#define PPLogData(obj,content) \
if(SADEBUG) \
{ \
NSData *data = [NSJSONSerialization dataWithJSONObject:obj options:0 error:nil]; \
NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]; \
NSLog(@"%@----->%@",content,string); \
}


#define XCODE_COLORS_ESCAPE @"\033["
#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;"
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;"
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"

/**  不同等级的Log，也可开关，当前已开  */
#define LOG_LEVEL_Warn
#define LOG_LEVEL_INFO
#define LOG_LEVEL_ERROR
//如需关闭，就将你需要关闭的宏定义注销那么该种形式的Log将不显示或者以默认颜色显示
#ifdef LOG_LEVEL_ERROR
#define KKLogError(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#else
#define KKLogError(...) //NSLog(__VA_ARGS__)
#endif


// 设置输出颜色 --  需要安装Xcode colors 插件 https://github.com/robbiehanson/XcodeColors
#define XCODE_COLORS_ESCAPE @"\033["
#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color
#define LogBlue(frmt, ...) PPLog((XCODE_COLORS_ESCAPE @"fg0,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogRed(frmt, ...) PPLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogBlack(frmt, ...) PPLog((XCODE_COLORS_ESCAPE @"fg0,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogBrown(frmt, ...) PPLog((XCODE_COLORS_ESCAPE @"fg153,102,51;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogCyan(frmt, ...) PPLog((XCODE_COLORS_ESCAPE @"fg0,255,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogGreen(frmt, ...) PPLog((XCODE_COLORS_ESCAPE @"fg0,255,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogMagenta(frmt, ...) PPLog((XCODE_COLORS_ESCAPE @"fg255,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogOrange(frmt, ...) PPLog((XCODE_COLORS_ESCAPE @"fg255,127,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogPurple(frmt, ...) PPLog((XCODE_COLORS_ESCAPE @"fg127,0,127;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogYellow(frmt, ...) PPLog((XCODE_COLORS_ESCAPE @"fg255,255,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogWhite(frmt, ...) PPLog((XCODE_COLORS_ESCAPE @"fg255,255,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)


