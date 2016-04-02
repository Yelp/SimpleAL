//
//  SimpleALViewPropertyArray.m
//  SimpleAL
//
//  Created by Alexander Haefner on 11/10/13.
//  Copyright (c) 2013 Alex Haefner. All rights reserved.
//

#import "SimpleALViewPropertyArray.h"
#import "SimpleALViewPropertyArrayPrivate.h"

#import "SimpleALViewProperty.h"

@implementation SimpleALViewPropertyArray

- (NSArray<NSLayoutConstraint *> *)equalToViewProperty:(SimpleALViewProperty *)viewProperty2 {
  return [self equalToViewProperty:viewProperty2 multiplier:1.0 constant:0.0];
}

- (NSArray<NSLayoutConstraint *> *)equalToViewProperty:(SimpleALViewProperty *)viewProperty2 constant:(CGFloat)constant {
  return [self equalToViewProperty:viewProperty2 multiplier:1.0 constant:constant];
}

- (NSArray<NSLayoutConstraint *> *)equalToViewProperty:(SimpleALViewProperty *)viewProperty2 multiplier:(CGFloat)multiplier constant:(CGFloat)constant {
  NSMutableArray *array = [NSMutableArray array];
  for (SimpleALViewProperty *viewProperty in self.simpleAlViewProperties) {
    [array addObject:[viewProperty equalToViewProperty:viewProperty2 multiplier:multiplier constant:constant]];
  }
  return array;
}

- (NSArray<NSLayoutConstraint *> *)lessThanOrEqualToViewProperty:(SimpleALViewProperty *)viewProperty2 {
  return [self lessThanOrEqualToViewProperty:viewProperty2 multiplier:1.0 constant:0.0];
}

- (NSArray<NSLayoutConstraint *> *)lessThanOrEqualToViewProperty:(SimpleALViewProperty *)viewProperty2 constant:(CGFloat)constant {
  return [self lessThanOrEqualToViewProperty:viewProperty2 multiplier:1.0 constant:constant];
}

- (NSArray<NSLayoutConstraint *> *)lessThanOrEqualToViewProperty:(SimpleALViewProperty *)viewProperty2 multiplier:(CGFloat)multiplier constant:(CGFloat)constant {
  NSMutableArray *array = [NSMutableArray array];
  for (SimpleALViewProperty *viewProperty in self.simpleAlViewProperties) {
    [array addObject:[viewProperty lessThanOrEqualToViewProperty:viewProperty2 multiplier:multiplier constant:constant]];
  }
  return array;
}

- (NSArray<NSLayoutConstraint *> *)greaterThanOrEqualToViewProperty:(SimpleALViewProperty *)viewProperty2 {
  return [self greaterThanOrEqualToViewProperty:viewProperty2 multiplier:1.0 constant:0.0];
}

- (NSArray<NSLayoutConstraint *> *)greaterThanOrEqualToViewProperty:(SimpleALViewProperty *)viewProperty2 constant:(CGFloat)constant {
  return [self greaterThanOrEqualToViewProperty:viewProperty2 multiplier:1.0 constant:constant];
}

- (NSArray<NSLayoutConstraint *> *)greaterThanOrEqualToViewProperty:(SimpleALViewProperty *)viewProperty2 multiplier:(CGFloat)multiplier constant:(CGFloat)constant {
  NSMutableArray *array = [NSMutableArray array];
  for (SimpleALViewProperty *viewProperty in self.simpleAlViewProperties) {
    [array addObject:[viewProperty greaterThanOrEqualToViewProperty:viewProperty2 multiplier:multiplier constant:constant]];
  }
  return array;
}

- (NSArray<NSLayoutConstraint *> *)equalToValue:(CGFloat)value {
  NSMutableArray *array = [NSMutableArray array];
  for (SimpleALViewProperty *viewProperty in self.simpleAlViewProperties) {
    [array addObject:[viewProperty equalToValue:value]];
  }
  return array;
}

- (NSArray<NSLayoutConstraint *> *)lessThanOrEqualToValue:(CGFloat)value {
  NSMutableArray *array = [NSMutableArray array];
  for (SimpleALViewProperty *viewProperty in self.simpleAlViewProperties) {
    [array addObject:[viewProperty lessThanOrEqualToValue:value]];
  }
  return array;
}

- (NSArray<NSLayoutConstraint *> *)greaterThanOrEqualToValue:(CGFloat)value {
  NSMutableArray *array = [NSMutableArray array];
  for (SimpleALViewProperty *viewProperty in self.simpleAlViewProperties) {
    [array addObject:[viewProperty greaterThanOrEqualToValue:value]];
  }
  return array;
}
@end
