//
//  PAMVariableHightTableViewController.m
//  PAMTrainingWithAutolayout
//
//  Created by Takafumi Tamura on 2013/08/09.
//  Copyright (c) 2013年 田村 孝文. All rights reserved.
//

#import "PAMVariableHightTableViewController.h"
#import "PAMVariableHightCell.h"


@implementation PAMVariableHightTableViewController{
    NSMutableArray *_cells;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _cells= [[NSMutableArray alloc]init];
}

-(void)viewWillAppear:(BOOL)animated
{
    [_cells removeAllObjects];

    // Cellの高さ計算するのが面倒なら、Cellを作ってしまえば良いのよ。
    NSArray *neko = [self neko];
    for (NSString *cat in neko) {
        PAMVariableHightCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PAMVariableHightCell"];
        cell.multiLineTextView.text = cat;

        // 強引にcellのサイズをcell自身に調整させる
        [cell resizeBounds];
        // ↑の中で、cellそのもののboundsを書き換えて、サイズを押し広げている。

        [_cells addObject:cell];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [_cells objectAtIndex:indexPath.row];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Cell自身に自分の身長を自己申告させる。
    UITableViewCell *cell = [_cells objectAtIndex:indexPath.row];
    return cell.bounds.size.height;
}
-(NSArray *)neko
{
    return @[@" 吾輩は猫である。名前はまだ無い。",
             @" どこで生れたか頓（とん）と見當がつかぬ。何でも薄暗いじめじめした所でニヤーニヤー泣いて居た事丈は記憶して居る。吾輩はこゝで始めて人間といふものを見た。然（しか）もあとで聞くとそれは書生といふ人間中で一番獰悪（だうあく）な種族であつたさうだ。此書生といふのは時々我々を捕（つかま）へて煮て食ふといふ話である。然し其當時は何といふ考（かんがへ）もなかつたから別段恐しいとも思はなかつた。但（たゞ）彼の掌（てのひら）に載せられてスーと持ち上げられた時何だかフハフハした感じが有つた許（ばか）りである。掌の上で少し落ち付いて書生の顔を見たのが所謂（いはゆる）人間といふものゝ見始（みはじめ）であらう。此時妙なものだと思つた感じが今でも殘つて居る。第一毛を以て装飾されべき筈の顔がつるつるして丸で薬罐（やくわん）だ。其後猫にも大分逢つたがこんな片輪には一度も出會（でく）はした事がない。加之（のみならず）顔の眞中が餘りに突起して居る。そうして其穴の中から時々ぷうぷうと烟（けむり）を吹く。どうも咽（む）せぽくて實に弱つた。是が人間の飲む烟草（たばこ）といふものである事は漸く此頃（このごろ）知つた。",
             @"　此書生の掌の裏（うち）でしばらくはよい心持に坐つて居つたが、暫くすると非常な速力で運轉し始めた。書生が動くのか自分丈（だけ）が動くのか分らないが無暗に眼が廻る。胸が惡くなる。到底助からないと思つて居ると、どさりと音がして眼から火が出た。夫迄（それまで）は記憶して居るがあとは何の事やらいくら考へ出さうとしても分らない。",
             @"　ふと氣が付いて見ると書生は居ない。澤山居つた兄弟が一疋（ぴき）も見えぬ。肝心の母親さへ姿を隱して仕舞つた。其上今迄の所とは違つて無暗に明るい。眼を明いて居（ゐ）られぬ位だ。果てな何でも容子（ようす）が可笑（をかし）いと、のそのそ這ひ出して見ると非常に痛い。吾輩は藁（わら）の上から急に笹原の中へ棄てられたのである。"];
}
@end
