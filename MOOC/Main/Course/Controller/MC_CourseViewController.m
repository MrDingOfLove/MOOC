//
//  MC_CourseViewController.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/17.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_CourseViewController.h"
#import "MC_CollectionViewCell.h"
#import "MC_MenuController.h"

@interface MC_CourseViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) NSArray * titleArray;
@property (nonatomic,strong) UICollectionView * collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout * collectionViewFlowLayout;
@end

@implementation MC_CourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = NSLocalizedStringFromTable(@"CourseTitle", @"internationalization", nil);
    [self initForCollectionView];
    
}
-(void)initForCollectionView{
    [self.view addSubview:self.collectionView];
    /*
     *注册cell
     */
    NSString * identifier = @"MC_CollectionViewCell";
    UINib *cellNib=[UINib nibWithNibName:identifier bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:identifier];
    /**
     *  注册头视图
     */
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UICollectionViewDelegateFlowLayout
//每一个分组的上左下右间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(RESIZE_UI(10),0,0,0);
}
//定义每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH)/3.0, 80);
}
//头部加载
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(RESIZE_UI(30), 0, header.width, RESIZE_UI(30))];
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:RESIZE_UI(13)];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        label.text=@"开发语言";
    }
    [header addSubview:label];
    return header;
}
#pragma mark UICollectionViewDataSource
//section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}
//section内cell个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MC_CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"MC_CollectionViewCell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",indexPath.row+1]];
    cell.titleLabel.text = self.titleArray[indexPath.row];
    return cell;
}
//cell的点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MC_MenuController * menuController = [[MC_MenuController alloc]initWithData:[[NSObject alloc]init]];
    menuController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:menuController animated:YES];
}
#pragma mark getter&setter
-(UICollectionView *)collectionView{
    if (!_collectionView){
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, RESIZE_UI(64), SCREEN_WIDTH, SCREEN_HEIGHT-RESIZE_UI(44)-RESIZE_UI(64)) collectionViewLayout:self.collectionViewFlowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
-(UICollectionViewLayout *)collectionViewFlowLayout{
    if (!_collectionViewFlowLayout){
        _collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc]init];
        //同一行相邻两个cell的最小间距
        _collectionViewFlowLayout.minimumInteritemSpacing = 0;
        //最小两行之间的间距
        _collectionViewFlowLayout.minimumLineSpacing = 0;
        _collectionViewFlowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH,RESIZE_UI(30));
    }
    return _collectionViewFlowLayout;
}
-(NSArray *)titleArray{
    if (!_titleArray){
        _titleArray = [[NSArray alloc]initWithObjects:@"HTML/CSS",@"JavaScript",@"jQuery",@"Node.js",@"HTML5",@"Augular Js",@"PHP",@"Java",@"Python",@"C", nil];
    }
    return _titleArray;
}
@end
