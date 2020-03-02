(let* (
     (my_image   (car (gimp-image-new 250 100 RGB      )))
     (my_layer   (car (gimp-layer-new my_image 250 100 RGB-IMAGE "my layer" 0 LAYER-MODE-NORMAL-LEGACY)))
     (tq84-brush (car (gimp-brush-new "TQ84 Brush")))

     (lin-1 (make-vector 4))
     (lin-2 (make-vector 4))
     (lin-3 (make-vector 4))
     (lin-4 (make-vector 4))
     (lin-5 (make-vector 4))
   )

   (vector-set! lin-1 0  25) ; x1
   (vector-set! lin-1 1  10) ; y1
   (vector-set! lin-1 2 225) ; x2
   (vector-set! lin-1 3  10) ; y2

   (vector-set! lin-2 0  25) ; x1
   (vector-set! lin-2 1  30) ; y1
   (vector-set! lin-2 2 225) ; x2
   (vector-set! lin-2 3  30) ; y2

   (vector-set! lin-3 0  25) ; x1
   (vector-set! lin-3 1  50) ; y1
   (vector-set! lin-3 2 225) ; x2
   (vector-set! lin-3 3  50) ; y2

   (vector-set! lin-4 0  25) ; x1
   (vector-set! lin-4 1  70) ; y1
   (vector-set! lin-4 2 225) ; x2
   (vector-set! lin-4 3  70) ; y2

   (vector-set! lin-5 0  25) ; x1
   (vector-set! lin-5 1  90) ; y1
   (vector-set! lin-5 2 225) ; x2
   (vector-set! lin-5 3  90) ; y2

   (gimp-image-add-layer my_image my_layer 0)

   (gimp-context-set-background '(240 220 230))
   (gimp-context-set-foreground '(255 100  30))

   (gimp-drawable-fill my_layer FILL-BACKGROUND)

   (gimp-brush-set-shape           tq84-brush BRUSH-GENERATED-CIRCLE)
   (gimp-context-set-brush         tq84-brush)
   (gimp-context-set-brush-size       9.0 )
   (gimp-context-set-brush-spacing    3.5 )

   (gimp-paintbrush my_layer 0 4 lin-1 PAINT-CONSTANT 0)

   (gimp-context-set-brush-spacing    2.0 )
   (gimp-paintbrush my_layer 0 4 lin-2 PAINT-CONSTANT 0)

   (gimp-context-set-brush-spacing    1.5 )
   (gimp-paintbrush my_layer 0 4 lin-3 PAINT-CONSTANT 0)

   (gimp-context-set-brush-spacing    8.0 )
   (gimp-paintbrush my_layer 0 4 lin-4 PAINT-CONSTANT 0)

   (gimp-context-set-brush-spacing    1.0 )
   (gimp-paintbrush my_layer 0 4 lin-5 PAINT-CONSTANT 0)

   (gimp-file-save RUN-NONINTERACTIVE my_image my_layer "f:\\img\\brush-spacings.jpg" "")
   (gimp-brush-delete tq84-brush)
   (gimp-image-delete my_image)
)
(gimp-quit TRUE)
