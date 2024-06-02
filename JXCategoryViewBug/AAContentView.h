//
//  AAContentView.h
//  JXCategoryViewBug
//
//  Created by Mikey on 2024/6/2.
//

#import <UIKit/UIKit.h>
#import <JXCategoryView.h>

NS_ASSUME_NONNULL_BEGIN

@interface AAContentView : UIView <JXCategoryListContentViewDelegate>

+ (instancetype)bindWithIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
