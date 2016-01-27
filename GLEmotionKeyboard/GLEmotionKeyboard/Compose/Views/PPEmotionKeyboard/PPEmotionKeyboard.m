//
//  PPEmotionKeyboard.m
//  PPZone
//
//  Created by jiaguanglei on 16/1/18.
//  Copyright © 2016年 roseonly. All rights reserved.
//

#import "PPEmotionKeyboard.h"
#import "PPEmotionTabBar.h" // 工具条
#import "PPEmotionListView.h" // 表情列表

#import "PPEmotionModel.h" // 表情模型
#import "MJExtension.h"
#import "PPComposeDBUtils.h" // 存储表情

@interface PPEmotionKeyboard ()<PPEmotionTabBarDelegate>

PROPERTYWEAK(PPEmotionTabBar, tabbar)
// 表情view的 容器
PROPERTYWEAK(PPEmotionListView, contentView)

// 不显示的时候防止销毁, 采用强指针
PROPERTYSTRONG(PPEmotionListView, recentListview)
PROPERTYSTRONG(PPEmotionListView, defaultListview)
PROPERTYSTRONG(PPEmotionListView, emojListview)
PROPERTYSTRONG(PPEmotionListView, flowerListview)
@end
@implementation PPEmotionKeyboard
#pragma mark - 懒加载
- (PPEmotionListView *)recentListview
{
    if (!_recentListview) {
        _recentListview = [[PPEmotionListView alloc] init];
        // 加载沙盒中的数据
        _recentListview.emotions = [PPComposeDBUtils recentEmotions];
    }
    return _recentListview;
}

- (PPEmotionListView *)defaultListview
{
    if (!_defaultListview) {
        _defaultListview = [[PPEmotionListView alloc] init];

        // 模型数组 赋值
        _defaultListview.emotions = [self loadEmotionWithPath:@"EmotionIcons/default/info.plist"];
    }
    return _defaultListview;
}

- (PPEmotionListView *)emojListview
{
    if (!_emojListview) {
        _emojListview = [[PPEmotionListView alloc] init];
        
        // 模型数组 赋值
        _emojListview.emotions = [self loadEmotionWithPath:@"EmotionIcons/emoji/info.plist"];
    }
    return _emojListview;
}

- (PPEmotionListView *)flowerListview
{
    if (!_flowerListview) {
        _flowerListview = [[PPEmotionListView alloc] init];
        
        // 模型数组 赋值
        _flowerListview.emotions = [self loadEmotionWithPath:@"EmotionIcons/lxh/info.plist"];
    }
    return _flowerListview;

}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1. listView
        PPEmotionListView *contentView = [[PPEmotionListView alloc] init];
//        contentView.backgroundColor = PPCOLOR_RANDOM;
        [self addSubview:contentView];
        _contentView = contentView;
        
        // 2. tabbar
        PPEmotionTabBar *tabbar = [[PPEmotionTabBar alloc] init];
        tabbar.delegate = self;
        [self addSubview:tabbar];
        _tabbar = tabbar;
        
        // 3. 监听表情的选中 -- 添加到recent
        [PPNOTICEFICATION addObserver:self selector:@selector(listPageViewEmotionButtonDidClickedNoticefication:) name:PPEmotionBtnDidSelectedNoticefication object:nil];
    }
    return self;
}

#pragma mark - 监听表情键盘, 表情按钮点击, 实时更新最近的表情
- (void)listPageViewEmotionButtonDidClickedNoticefication:(NSNotification *)noticefication
{
    self.recentListview.emotions = [PPComposeDBUtils recentEmotions];
}

- (void)dealloc
{
    [PPNOTICEFICATION removeObserver:self];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.tabbar
    CGFloat tabbarH = 37;
    CGFloat tabbarW = self.width;
    CGFloat tabbarX = 0;
    CGFloat tabbarY = self.height - tabbarH;
    _tabbar.frame = CGRectMake(tabbarX, tabbarY, tabbarW, tabbarH);
    
    // 2.listview
    CGFloat contentViewX = 0;
    CGFloat contentViewY = 0;
    CGFloat contentViewW = self.width;
    CGFloat contentViewH = self.height - tabbarH;
    _contentView.frame = CGRectMake(contentViewX, contentViewY, contentViewW, contentViewH);
    
    // 3.
    // 设置尺寸
    UIView *child = [self.contentView.subviews lastObject];
    child.frame = self.contentView.bounds;
}


#pragma mark - PPEmotionTabBarDelegate 监听tabbar按钮点击
- (void)emotionToolbar:(PPEmotionTabBar *)toolbar didClickedToolbarButton:(PPEmotionTabBarBtnType)emotionToolbarButtonType
{
    // 先移除容器中的subView
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    switch (emotionToolbarButtonType) {
        case PPEmotionTabBarBtnTypeRecent: { // recent

//            self.recentListview.emotions = [PPComposeDBUtils recentEmotions];
            
            [self.contentView addSubview:self.recentListview];
            break;
        }
        case PPEmotionTabBarBtnTypeDefault: { // default
            [self.contentView addSubview:self.defaultListview];
            break;
        }
        case PPEmotionTabBarBtnTypeEmoj: { // emoj
            [self.contentView addSubview:self.emojListview];
            break;
        }
        case PPEmotionTabBarBtnTypeFlower: { // 浪小花
            [self.contentView addSubview:self.flowerListview];
            break;
        }
    }
    
    // *****  重新计算frame
    // [注意]: 不要主动调用layoutSubviews, drawInRect([self setNeedsDisplay])
    [self setNeedsLayout];
}

- (NSArray *)loadEmotionWithPath:(NSString *)path
{
    // 字典数组转换模型数组
    NSArray *emotionsArray = [PPEmotionModel mj_objectArrayWithFile:[[NSBundle mainBundle] pathForResource:path ofType:nil]];
    
    // 给listView赋值
//    self.listview.emotions = emotionsArray;
    return emotionsArray;
}
@end
