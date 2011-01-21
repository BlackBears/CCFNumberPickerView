**CCFNumberPickerView**

2011-01-20
Copyright © 2011 Cocoa Factory, LLC and Alan Duncan

**INTRODUCTION**

iOS developers have three choices for allowing users to enter numerical data:

1.  UITextField + UIKeyboard
2.  UISlider control
3.  UIPickerView

Each has some weakness, depending on the need.  Keyboarding on the iPhone is not ergonomic and the UISlider control doesn't present scaling landmarks or "snap-to-grid" functionality.  Finally, the UIPickerView occupies a large area of the screen and may not be desirable if other controls or data need to be placed.

Enter CCFNumberPicker.

**INSTALLATION**

Download and launch the Xcode project.  Its single target builds a minimal application that demonstrates the control.

To adapt the CCFNumberPickerView to your application, you'll need to copy the following files to the new project:

*    bezel-shadow.png.h
*    CCFLimitedConveniences.h
*	CCFNumberPickerView.h/.m
*	CCFNumberPickerScrollView.h/.m
*	CCFNumberPickerContentView.h/.m
*	CCFNumberPickerData.h/.m
*	License.txt

**USAGE**

The header files should have sufficient documentation (formatted for Doxygen) to get you started.  You mainly need to be concerned about two classes:  CCFNumberPickerView and CCFNumberPickerData.  You may instantiate the former either programmatically or in a nib.  This is the superview of a hierarchy that draws the picker view.  CCFNumberPickerData is a model object that encapsulates data about the formatting of the picker view.  Lastly, take a look at the sample project's view controller. That shows you most of what you need to know to use the classes.

You are free to use and adapt CCFNumberPicker according to the terms of the included license which must be included in any distribution.  Further, we ask for attribution somewhere in your application, typically the credits.

Finally, if you have comments or bug fixes - let us know:
alan@cocoa-factory.com