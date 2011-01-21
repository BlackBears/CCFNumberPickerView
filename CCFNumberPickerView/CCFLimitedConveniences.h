/**
 *      @file       CCFNumberPickerContentView.h
 *      @author     Cocoa Factory, LLC and Alan Duncan (www.cocoafactory.com)
 *
 *      @date       2011-20-01
 *      @version    1.0
 *
 *
 *      @note       This file contains a limited number of convenience macros from a larger set
 *                  of macros that Cocoa Factory uses daily.  For clarity, only the macros actually
 *                  used in CCFNumberPicker source are included here.
 *
 *      @note       Copyright (c) 2011 Cocoa Factory, LLC
 *                  CCFNumberPicker may be used freely in accordance with the terms of our
 *                  MIT license which is included with this distribution.  Basicaly, we ask
 *                  only for attribution.
 *      
 */
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
