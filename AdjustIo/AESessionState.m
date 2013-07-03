//
//  AESessionState.m
//  AdjustIosApp
//
//  Created by Christian Wellenbrock on 02.07.13.
//  Copyright (c) 2013 adeven. All rights reserved.
//

#import "AESessionState.h"

@implementation AESessionState

- (id)init {
    self = [super init];
    if (self == nil) return nil;

    self.eventCount = 0;
    self.sessionCount = 0;
    self.subsessionCount = -1; // -1 means unknown
    self.sessionLength = -1;
    self.timeSpent = -1;
    self.createdAt = -1;
    self.lastActivity = -1;
    self.lastInterval = -1;

    return self;
}

- (void)startNextSession:(long)now {
    self.sessionCount++;
    self.subsessionCount = 1;
    self.sessionLength = 0;
    self.timeSpent = 0;
    self.createdAt = now;
    self.lastActivity = now;
    self.lastInterval = 0;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"ec:%d sc:%d ssc:%d sl:%f ts:%f ca:%f la:%f",
            self.eventCount, self.sessionCount, self.subsessionCount, self.sessionLength,
            self.timeSpent, self.createdAt, self.lastActivity];
}

#pragma mark NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self == nil) return nil;

    self.eventCount      = [decoder decodeIntForKey:@"eventCount"];
    self.sessionCount    = [decoder decodeIntForKey:@"sessionCount"];
    self.subsessionCount = [decoder decodeIntForKey:@"subsessionCount"];
    self.sessionLength   = [decoder decodeDoubleForKey:@"sessionLength"];
    self.timeSpent       = [decoder decodeDoubleForKey:@"timeSpent"];
    self.createdAt       = [decoder decodeDoubleForKey:@"createdAt"];
    self.lastActivity    = [decoder decodeDoubleForKey:@"lastActivity"];

    self.lastInterval = -1;

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeInt:self.eventCount       forKey:@"eventCount"];
    [encoder encodeInt:self.sessionCount     forKey:@"sessionCount"];
    [encoder encodeInt:self.subsessionCount  forKey:@"subsessionCount"];
    [encoder encodeDouble:self.sessionLength forKey:@"sessionLength"];
    [encoder encodeDouble:self.timeSpent     forKey:@"timeSpent"];
    [encoder encodeDouble:self.createdAt     forKey:@"createdAt"];
    [encoder encodeDouble:self.lastActivity  forKey:@"lastActivity"];
}

@end
