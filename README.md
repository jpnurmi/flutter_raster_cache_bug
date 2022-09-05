# flutter_raster_cache_bug

Related issues:
- Linux font rendering issue in dialogues flutter/flutter#109608
- The buttons in the text selection toolbar bounce on desktop flutter/flutter#107733
- [Windows] Overlay flickering when the cursor is hovered flutter/flutter#107921
- Whole app is jumping after update flutter/flutter#110957

Fix attempts:
- [flow] fix RasterCache to round out device bounds flutter/engine#35538
- Partial revert of fractional translation changes to raster cache flutter/engine#35918

![](https://user-images.githubusercontent.com/140617/188180337-d07a4951-6d8c-47d3-9eca-3d5bc8e516c5.png)

https://user-images.githubusercontent.com/140617/185625854-4bfc8a30-a820-4e4c-bd44-3ab1533430ec.mp4

Partial fix:
```diff
diff --git a/flow/layers/opacity_layer.cc b/flow/layers/opacity_layer.cc
index e970262905..7d60f86b28 100644
--- a/flow/layers/opacity_layer.cc
+++ b/flow/layers/opacity_layer.cc
@@ -98,6 +98,7 @@ void OpacityLayer::Paint(PaintContext& context) const {
 
   SkPaint paint;
   paint.setAlphaf(subtree_opacity);
+  paint.setAntiAlias(true);
 
   if (layer_raster_cache_item_->Draw(context, &paint)) {
     return;
diff --git a/flow/raster_cache.cc b/flow/raster_cache.cc
index 9b6e72d43c..f2ebc10f52 100644
--- a/flow/raster_cache.cc
+++ b/flow/raster_cache.cc
@@ -59,8 +59,8 @@ void RasterCacheResult::draw(SkCanvas& canvas, const SkPaint* paint) const {
     canvas.save();
     canvas.clipRect(SkRect::Make(bounds.roundOut()));
   }
-  canvas.drawImage(image_, bounds.fLeft, bounds.fTop, SkSamplingOptions(),
-                   paint);
+  canvas.drawImage(image_, bounds.fLeft, bounds.fTop,
+                   SkSamplingOptions(SkFilterMode::kLinear), paint);
   if (exceeds_bounds) {
     canvas.restore();
   }
```
