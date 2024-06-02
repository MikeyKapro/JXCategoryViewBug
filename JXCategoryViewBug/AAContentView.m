//
//  AAContentView.m
//  JXCategoryViewBug
//
//  Created by Mikey on 2024/6/2.
//

#import "AAContentView.h"
#import <Masonry.h>

@interface AAContentView ()

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation AAContentView

#pragma mark - Life Cycle
+ (instancetype)bindWithIndex:(NSInteger)index {
    AAContentView *view = self.new;
    view.index = index;
    [view configBase];
    return view;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

#pragma mark - Config
- (void)configBase {
    [self addSubview:self.titleLabel];
}

#pragma mark - JXPagerViewListViewDelegate
- (UIView *)listView {
    return self;
}

- (void)listDidAppear {
    // 在实际业务中会调用接口获取数据数量后或在未登录时通知ViewController的categoryView刷新标题数量
    [NSNotificationCenter.defaultCenter postNotificationName:@"test" object:nil];
}

#pragma mark - Getter
- (UILabel *)titleLabel {
    if (_titleLabel) return _titleLabel;
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:60];
    label.text = [NSString stringWithFormat:@"%ld", self.index];
    _titleLabel = label;
    return label;
}

@end
