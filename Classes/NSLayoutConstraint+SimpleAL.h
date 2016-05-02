//
//  NSLayoutConstraint+SimpleAL.h
//  SimpleAL
//
//  Created by Alex Haefner on 11/4/13.
//  Copyright (c) 2013 Alex Haefner. All rights reserved.
//

@import Foundation;
@import UIKit.NSLayoutConstraint;

NS_ASSUME_NONNULL_BEGIN

@class SimpleALViewProperty;

@interface NSLayoutConstraint (SimpleAL)

+ (instancetype)al_constrainViewProperty:(SimpleALViewProperty *)viewProperty1 equalToViewProperty:(SimpleALViewProperty *)viewProperty2 multiplier:(CGFloat)multiplier constant:(CGFloat)constant;

+ (instancetype)al_constrainViewProperty:(SimpleALViewProperty *)viewProperty1 lessThanOrEqualToViewProperty:(SimpleALViewProperty *)viewProperty2 multiplier:(CGFloat)multiplier constant:(CGFloat)constant;

+ (instancetype)al_constrainViewProperty:(SimpleALViewProperty *)viewProperty1 greaterThanOrEqualToViewProperty:(SimpleALViewProperty *)viewProperty2 multiplier:(CGFloat)multiplier constant:(CGFloat)constant;

+ (instancetype)al_constrainViewProperty:(SimpleALViewProperty *)viewProperty1 equalToValue:(CGFloat)value;
+ (instancetype)al_constrainViewProperty:(SimpleALViewProperty *)viewProperty1 lessThanOrEqualToValue:(CGFloat)value;
+ (instancetype)al_constrainViewProperty:(SimpleALViewProperty *)viewProperty1 greaterThanOrEqualToValue:(CGFloat)value;

@end

NS_ASSUME_NONNULL_END