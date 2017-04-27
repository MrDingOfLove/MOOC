//
//  MC_ServiceForHeaderView.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/22.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_ServiceForHeaderViewAndCell.h"
#import "MC_PushToViewControllerProtocol.h"
#import "MC_Header_Header.h"
#import "MC_HeaderCell.h"
#import "MC_SectionHeader.h"
#import "MC_CourseRecommendCell.h"
@interface MC_ServiceForHeaderViewAndCell()<MC_PushToViewControllerProtocol>
//填充的数据
@property (nonatomic,strong) NSObject * data;
@property (nonatomic,strong) UIView * v;
/**
 *  Header
 */
@property (nonatomic,strong) MC_Header_Header * header_HeaderView;
@property (nonatomic,strong) MC_HeaderCell * headerTableViewCell;
/**
 *  Scetion HeaderView
 */
@property (nonatomic,strong) MC_SectionHeader * sectionHeader;
/**
 *  Course Recommend
 */
@property (nonatomic,strong) MC_CourseRecommendCell * courseRecommendCell;

@property (nonatomic,strong) UITableView * tableView;
@end
@implementation MC_ServiceForHeaderViewAndCell
- (instancetype)initWithData:(NSObject *)data
{
    self = [super init];
    if (self) {
        self.data = data;
    }
    return self;
}
/**
 *  HeightForHeaderView
 */
-(CGFloat)heightOfSection:(NSInteger)section{
    switch (section) {
        case 0:
            return RESIZE_UI(160);
            break;
        case 1:
            return RESIZE_UI(60);
            break;
        case 2:
            return RESIZE_UI(60);
            break;
        default:
            return RESIZE_UI(0);
            break;
    }
}
/**
 *  ViewForHeader
 */
-(UIView *)viewOfSection:(NSInteger)section{
    MC_SectionHeader * sectionHeader = nil;
    switch (section) {
        case 0:
            return self.header_HeaderView;
            break;
        case 1:
            sectionHeader = self.sectionHeader;
            [sectionHeader configWithBackgroundColor:[UIColor clearColor] imageName:@"recommend"title:NSLocalizedStringFromTable(@"CourseRecommendedTitle", @"internationalization", nil) changeTitle:NSLocalizedStringFromTable(@"ChangeCourseRecommendedTitle", @"internationalization", nil)];
            return sectionHeader;
            break;
        case 2:
            sectionHeader = self.sectionHeader;
            [sectionHeader configWithBackgroundColor:[UIColor whiteColor] imageName:@"recommend"title:NSLocalizedStringFromTable(@"PathTitle", @"internationalization", nil) changeTitle:NSLocalizedStringFromTable(@"ChangeCourseRecommendedTitle", @"internationalization", nil)];
            return sectionHeader;
            break;
            
        default:
            return nil;
            break;
    }
}
/**
 *  numberOfRowsForSection
 */
-(NSInteger)numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 3;
            break;
        default:
            return 1;
            break;
    }
}
/**
 *  ForCell
 */
-(UITableViewCell *)cellForTableView:(UITableView *)tableView sectionAtIndexPath:(NSIndexPath *)indexPath{
    self.tableView = tableView;
    switch (indexPath.section) {
        case 0:
            return self.headerTableViewCell;
            break;
        case 1:
            return self.courseRecommendCell;
            break;
            
        default:
            return [[UITableViewCell alloc]init];
            break;
    }
}
/**
 *  ForCellHeight
 */
-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return RESIZE_UI(93);
            break;
        case 1:
            return RESIZE_UI(350);
            break;
        case 2:
            return RESIZE_UI(100);
            break;
        default:
            return RESIZE_UI(50);
            break;
    }
}
#pragma mark MC_PushToViewControllerProtocol
-(void)pushToViewController:(UIViewController *)viewController{
    self.pushBlock(viewController);
}
#pragma mark getter
/**
 *  Header
 */
-(MC_Header_Header *)header_HeaderView{
    if (!_header_HeaderView){
        _header_HeaderView = [[MC_Header_Header alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RESIZE_UI(160)) data:self.data];
    }
    return _header_HeaderView;
}
-(MC_HeaderCell *)headerTableViewCell{
    _headerTableViewCell = [[MC_HeaderCell alloc]initWithTableView:self.tableView];
    _headerTableViewCell.pushDeleagte = self;
    return _headerTableViewCell;
}
/**
 *  ScetionHeaderView
 */
-(MC_SectionHeader *)sectionHeader{
    _sectionHeader = [[MC_SectionHeader alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RESIZE_UI(60)) data:self.data];
    return _sectionHeader;
}
/**
 *  Course Recommend
 */
-(MC_CourseRecommendCell *)courseRecommendCell{
    _courseRecommendCell = [[MC_CourseRecommendCell alloc]initWithTableView:self.tableView];
    _courseRecommendCell.pushDeleagte = self;
    return _courseRecommendCell;
}
-(UIView *)v{
    _v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RESIZE_UI(60))];
    _v.backgroundColor = [UIColor redColor];
    return _v;
}
@end
