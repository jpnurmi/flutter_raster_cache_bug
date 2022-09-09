# Raster cache bug in Flutter 3.3.0

Related issues:
- Linux font rendering issue in dialogues flutter/flutter#109608
- The buttons in the text selection toolbar bounce on desktop flutter/flutter#107733
- [Windows] Overlay flickering when the cursor is hovered flutter/flutter#107921
- Whole app is jumping after update flutter/flutter#110957
- BoxShadow dy offset calculation, Windows flutter/flutter#110959
- Flutter 3.3.0 Fractional translation bugged my app. flutter/flutter#110648
- Text anti-aliasing broken in Flutter 3.3.0 flutter/flutter#110738
- Flutter 3.3.0 rendering error with Text And Divider (text jump / position error) flutter/flutter#110756
- Revert removal of pixel snapping from flutter engine flutter/flutter#111145

Abandoned PRs:
- [flow] fix RasterCache to round out device bounds flutter/engine#35538
- Partial revert of fractional translation changes to raster cache flutter/engine#35918
- round_out certain cache bounds flutter/engine#35930

Merged fixes:
- add pixel snapping conditional on presence of raster cache flutter/engine#35981
- [framework] revert removal of opacity flutter/flutter#111202

Cherry-pick requests:
- [CP] revert removal of opacity layers flutter/flutter#111208
- [CP] Add pixel snapping conditional on presence of raster cache flutter/flutter#111231

![](https://user-images.githubusercontent.com/140617/188180337-d07a4951-6d8c-47d3-9eca-3d5bc8e516c5.png)

https://user-images.githubusercontent.com/140617/185625854-4bfc8a30-a820-4e4c-bd44-3ab1533430ec.mp4
