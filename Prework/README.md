# Pre-work - "Tip Calculator"

**Tip Calculator** is a tip calculator application for iOS.

Submitted by: **Laura Chang** 

Time spent: **3** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a bill percentage, and see the tip and total values.
* [x] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![](https://i.imgur.com/z36r9sS.gif)

GIF created with QuickTime Player and [ezGIF](https://www.ezgif.com)

## Notes

I noticed that the provided logic code for the calculateTip() function did not immediately calculate a 15% tip after filling in the bill amount within the simulator, despite the segmented control highlighting 15% by default. In addition, clicking the 15% in the simulator immediately after filling in the bill amount didn't do anything- you had to first select another tip percentage before being able to use the 15%. I'm not familiar with either swift nor xcode so I left the code as is, but I had two ideas to change this functionality. First, set 15% as the default in the code from startup. Secondly (and more preferably, so that the tip would immediately update with changes in bill amount without needing to click on the tip segmented control), continuously update the tip and total regions with the selected tip percentage and bill amount.

## License

    Copyright [2021] [Laura Chang]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
