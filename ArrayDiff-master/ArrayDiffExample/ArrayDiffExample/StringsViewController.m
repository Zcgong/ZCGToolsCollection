//
//  StringsViewController.m
//  ArrayDiffExample
//
//  Created by Nick Tymchenko on 14/04/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

#import "StringsViewController.h"
#import "ArrayDiff.h"

static NSString * const kCellReuseIdentifier = @"StringCell";


@interface StringsViewController ()

@property (nonatomic, strong) NSMutableArray *strings;

@end


@implementation StringsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellReuseIdentifier];
    
    self.strings = [NSMutableArray array];
    for (NSUInteger i = 0; i < 3000; ++i) {
        [self.strings addObject:[@(i) stringValue]];
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Move" style:UIBarButtonItemStyleBordered target:self action:@selector(moveBarButtonPressed)];
}

- (void)moveBarButtonPressed {
    NSArray *strings = [self.strings copy];
    
    // Randomly move 100 rows.
    for (NSUInteger i = 0; i < 100; ++i) {
        NSUInteger randomFrom = arc4random_uniform((int32_t)[self.strings count]);
        NSUInteger randomTo = arc4random_uniform((int32_t)[self.strings count]);

        NSString *string = self.strings[randomFrom];
        [self.strings removeObjectAtIndex:randomFrom];
        [self.strings insertObject:string atIndex:randomTo];
    }

    // Naive implementation:
//    NSOrderedSet *before = [NSOrderedSet orderedSetWithArray:strings];
//    NSOrderedSet *after = [NSOrderedSet orderedSetWithArray:self.strings];
//    [self.tableView beginUpdates];
//    [before enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        NSUInteger afterIdx = [after indexOfObject:obj];
//        [self.tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0] toIndexPath:[NSIndexPath indexPathForRow:afterIdx inSection:0]];
//    }];
//    [self.tableView endUpdates];
    
    NNSectionsDiffCalculator *diffCalculator = [[NNSectionsDiffCalculator alloc] init];

    NNSectionsDiff *diff = [diffCalculator calculateDiffForSingleSectionObjectsBefore:strings andAfter:self.strings];
    
    NNDiffReloadOptions *options = [[NNDiffReloadOptions alloc] init];
    options.useMoveIfPossible = YES;
    
    [self.tableView reloadWithSectionsDiff:diff options:options animation:UITableViewRowAnimationFade completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.strings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.strings[indexPath.row];
    return cell;
}

@end
