(let* (
     (img (car (gimp-image-new     250 100 RGB                                            )))
     (lyr (car (gimp-layer-new img 250 100 RGB-IMAGE "my layer" 0 LAYER-MODE-NORMAL-LEGACY)))
     (brs (car (gimp-brush-new                       "TQ84 Brush"                         )))

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


   (gimp-context-set-background '(240 220 230))
   (gimp-context-set-foreground '(255 100  30))

   (gimp-drawable-fill lyr FILL-BACKGROUND)

   (gimp-image-insert-layer img lyr 0 0)

   (gimp-brush-set-shape           brs BRUSH-GENERATED-CIRCLE)
   (gimp-context-set-brush         brs)
   (gimp-context-set-brush-size       9.0 )
   (gimp-context-set-brush-spacing    3.5 )

   (gimp-paintbrush lyr 0 4 lin-1 PAINT-CONSTANT 0)

   (gimp-context-set-brush-spacing    2.0 )
   (gimp-paintbrush lyr 0 4 lin-2 PAINT-CONSTANT 0)

   (gimp-context-set-brush-spacing    1.5 )
   (gimp-paintbrush lyr 0 4 lin-3 PAINT-CONSTANT 0)

   (gimp-context-set-brush-spacing    8.0 )
   (gimp-paintbrush lyr 0 4 lin-4 PAINT-CONSTANT 0)

   (gimp-context-set-brush-spacing    1.0 )
   (gimp-paintbrush lyr 0 4 lin-5 PAINT-CONSTANT 0)

   (gimp-file-save RUN-NONINTERACTIVE img lyr "f:\\img\\brush-spacing.jpg" "")
   (gimp-brush-delete brs)
   (gimp-image-delete img)
)
(gimp-quit TRUE)
