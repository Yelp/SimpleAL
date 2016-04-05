//
//  NSLayoutConstraint+SimpleAL.m
//  SimpleAL
//
//  Created by Alex Haefner on 11/4/13.
//  Copyright (c) 2013 Alex Haefner. All rights reserved.
//

#import "NSLayoutConstraint+SimpleAL.h"

#import "SimpleALViewProperty.h"
#import "SimpleALViewPropertyPrivate.h"
#import "UIView+SimpleAL.h"

@implementation NSLayoutConstraint (SimpleAL)

#pragma mark - private methods

+ (instancetype)_al_constrainViewProperty:(SimpleALViewProperty *)viewProperty1 toViewProperty:(SimpleALViewProperty *)viewProperty2 relation:(NSLayoutRelation)relation multiplier:(CGFloat)multiplier constant:(CGFloat)constant{
    return [self constraintWithItem:viewProperty1.view attribute:viewProperty1.attribute relatedBy:relation toItem:viewProperty2.view attribute:viewProperty2.attribute multiplier:multiplier constant:constant];
}

#pragma mark - public methods

+ (instancetype)al_constrainViewProperty:(SimpleALViewProperty *)viewProperty1 equalToViewProperty:(SimpleALViewProperty *)viewProperty2 multiplier:(CGFloat)multiplier constant:(CGFloat)constant {
    return [self _al_constrainViewProperty:viewProperty1 toViewProperty:viewProperty2 relation:NSLayoutRelationEqual multiplier:multiplier constant:constant];
}

+ (instancetype)al_constrainViewProperty:(SimpleALViewProperty *)viewProperty1 greaterThanOrEqualToViewProperty:(SimpleALViewProperty *)viewProperty2 multiplier:(CGFloat)multiplier constant:(CGFloat)constant {
    return [self _al_constrainViewProperty:viewProperty1 toViewProperty:viewProperty2 relation:NSLayoutRelationGreaterThanOrEqual multiplier:multiplier constant:constant];
}
            
+ (instancetype)al_constrainViewProperty:(SimpleALViewProperty *)viewProperty1 lessThanOrEqualToViewProperty:(SimpleALViewProperty *)viewProperty2 multiplier:(CGFloat)multiplier constant:(CGFloat)constant {
    return [self _al_constrainViewProperty:viewProperty1 toViewProperty:viewProperty2 relation:NSLayoutRelationLessThanOrEqual multiplier:multiplier constant:constant];
}

+ (instancetype)al_constrainViewProperty:(SimpleALViewProperty *)viewProperty1 equalToValue:(CGFloat)value {
    return [self constraintWithItem:viewProperty1.view attribute:viewProperty1.attribute relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value];
}

+ (instancetype)al_constrainViewProperty:(SimpleALViewProperty *)viewProperty1 lessThanOrEqualToValue:(CGFloat)value {
    return [self constraintWithItem:viewProperty1.view attribute:viewProperty1.attribute relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value];
}

+ (instancetype)al_constrainViewProperty:(SimpleALViewProperty *)viewProperty1 greaterThanOrEqualToValue:(CGFloat)value {
    return [self constraintWithItem:viewProperty1.view attribute:viewProperty1.attribute relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value];
}

@end
