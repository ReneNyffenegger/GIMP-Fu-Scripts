(let* (
     (img (car (gimp-image-new     250 250 RGB                                              )))
     (lyr (car (gimp-layer-new img 250 250 RGB-IMAGE "my layer" 100 LAYER-MODE-NORMAL-LEGACY)))
     (brs (car (gimp-brush-new "TQ84 Brush")))

     (coords (make-vector 4)) ; Array of 4 elements (to be set to doubles)
   )

   (gimp-context-set-background '(000 000 255))
   (gimp-context-set-foreground '(255 000 000))

   (gimp-drawable-fill          lyr FILL-BACKGROUND)
   (gimp-image-insert-layer img lyr 0 0)
 ;
 ;  Assign coordinates for first line to be drawn:
 ;
   (vector-set! coords 0  20.0) ; x1
   (vector-set! coords 1  20.0) ; y1
   (vector-set! coords 2 230.0) ; x2
   (vector-set! coords 3 230.0) ; y2

   (gimp-context-set-brush            brs   )
   (gimp-context-set-brush-size       19.0  )
   (gimp-context-set-brush-hardness    0.5  )
;  (gimp-context-set-brush-spacing    0.01  ) ; Is this sometimes necessary?

   (gimp-pencil lyr 4 coords)

 ;
 ;  Assign coordinates for second line to be drawn:
 ;
   (vector-set! coords 0 230.0) ; x1
   (vector-set! coords 1  20.0) ; y1
   (vector-set! coords 2  20.0) ; x2
   (vector-set! coords 3 230.0) ; y2

   (gimp-paintbrush lyr
         0              ; fade-out
         4              ; number of coordinates (not coordinate pairs)
         coords         ; strokes
         PAINT-CONSTANT ; method (PAINT-CONSTANT / PAINT-INCREMENTAL)
         0              ; gradient length
   )

   (gimp-file-save RUN-NONINTERACTIVE img lyr "f:\\img\\line.jpg" "")
   (gimp-brush-delete brs)
   (gimp-image-delete img)
)
(gimp-quit TRUE)
