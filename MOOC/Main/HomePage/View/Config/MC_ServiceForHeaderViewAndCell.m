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
#import "MC_CareerPathCell.h"
#import "MC_AdvertisingCell.h"
@interface MC_ServiceForHeaderViewAndCell()<MC_PushToViewControllerProtocol>
@property (nonatomic,strong) UITableView * tableView;
//填充的数据
@property (nonatomic,strong) NSObject * data;
@property (nonatomic,strong) UIView * emptyHeaderView;
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
 *  Course Recommend(课程推荐)
 */
@property (nonatomic,strong) MC_CourseRecommendCell * courseRecommendCell;
/**
 *  CareerPath(职业路径)
 */
@property (nonatomic,strong) MC_CareerPathCell * careerPathCell;
/**
 *  Advertising(广告)
 */
@property (nonatomic,strong) MC_AdvertisingCell * advertisingCell;

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
        case 3:
            return RESIZE_UI(20);
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
            [sectionHeader configWithBackgroundColor:[UIColor colorWithHexString:@"f0f2f5"] imageName:@"recommend"title:NSLocalizedStringFromTable(@"CourseRecommendedTitle", @"internationalization", nil) changeTitle:NSLocalizedStringFromTable(@"ChangeCourseRecommendedTitle", @"internationalization", nil)];
            return sectionHeader;
            break;
        case 2:
            sectionHeader = self.sectionHeader;
            [sectionHeader configWithBackgroundColor:[UIColor whiteColor] imageName:@"recommend"title:NSLocalizedStringFromTable(@"PathTitle", @"internationalization", nil) changeTitle:NSLocalizedStringFromTable(@"ChangeCourseRecommendedTitle", @"internationalization", nil)];
            return sectionHeader;
            break;
        case 3:
            return self.emptyHeaderView;
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
        case 3:
            return 1;
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
        case 2:
            return self.careerPathCell;
            break;
        case 3:
            return self.advertisingCell;
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
        case 3:
            return RESIZE_UI(140);
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
/**
 *  CareerPath
 */
-(MC_CareerPathCell *)careerPathCell{
    _careerPathCell = [[MC_CareerPathCell alloc]initWithTableView:self.tableView];
    _careerPathCell.pushDeleagte = self;
    return _careerPathCell;
}
/**
 *  Advertising
 */
-(MC_AdvertisingCell *)advertisingCell{
    _advertisingCell = [[MC_AdvertisingCell alloc]initWithTableView:self.tableView];
    _advertisingCell.pushDeleagte = self;
    return _advertisingCell;
}
-(UIView *)emptyHeaderView{
    _emptyHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RESIZE_UI(60))];
    _emptyHeaderView.backgroundColor = [UIColor whiteColor];
    return _emptyHeaderView;
}
@end
