//
//  CCFLimitedConveniences.h
//  CCFMeasureStrip
//
//  Created by Alan Duncan on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define SUPERINIT self = [super init]; \
if( !self ) return nil;

//
//  _ASSIGN and DELETE are used courtesy of Uli Kusterer
//
#ifndef _ASSIGN
#define _ASSIGN(targ,newval)		do {\
NSObject* __UKHELPERMACRO_OLDTARG = (NSObject*)(targ);\
(targ) = [(newval) retain];\
[__UKHELPERMACRO_OLDTARG release];\
} while(0)
#endif


#define DESTROY(targ)	do {\
NSObject* __UKHELPERMACRO_OLDTARG = (NSObject*)(targ);\
(targ) = nil;\
[__UKHELPERMACRO_OLDTARG release];\
} while(0)
