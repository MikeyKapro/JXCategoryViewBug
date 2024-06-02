//
//  ViewController.m
//  JXCategoryViewBug
//
//  Created by Mikey on 2024/6/2.
//

#import "ViewController.h"
#import <JXCategoryView.h>
#import <Masonry.h>
#import "AAContentView.h"

@interface ViewController () <JXCategoryListContainerViewDelegate>

@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.categoryView];
    [self.view addSubview:self.listContainerView];
    
    [NSNotificationCenter.defaultCenter addObserverForName:@"test"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification * _Nonnull notification) {
        [self.categoryView reloadDataWithoutListContainer];
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.inset(64);
        make.leading.trailing.inset(0);
        make.height.mas_equalTo(40);
    }];
    [self.listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.categoryView.mas_bottom);
        make.leading.trailing.bottom.inset(0);
    }];
}

#pragma mark - JXCategoryListContainerViewDelegate
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return 5;
}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    AAContentView *view = [AAContentView bindWithIndex:index];
    return view;
}

- (JXCategoryTitleView *)categoryView{
    if (_categoryView) return _categoryView;
    JXCategoryTitleView *categoryView = JXCategoryTitleView.new;
    categoryView.titles = @[@"A(0)", @"B(0)", @"C(0)", @"D(0)", @"E(0)"];
    categoryView.backgroundColor = UIColor.blueColor;
    categoryView.listContainer = self.listContainerView;
    _categoryView = categoryView;
    return categoryView;
}

- (JXCategoryListContainerView *)listContainerView{
    if (_listContainerView) return _listContainerView;
    JXCategoryListContainerView *listView =
    [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_CollectionView delegate:self];
    _listContainerView = listView;
    return listView;
}

@end
