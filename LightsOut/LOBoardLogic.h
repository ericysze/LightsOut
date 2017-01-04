//
//  LOBoardLogic.h
//  LightsOut
//
//  Created by Eric Sze on 12/17/16.
//  Copyright © 2016 ES Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LightActionDelegate;

@interface LOBoardLogic : NSObject {
    id <LightActionDelegate> delegate;
}

@end
