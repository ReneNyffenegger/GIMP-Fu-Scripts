(let* (
     (img (car (gimp-image-new     250 250 RGB                                              )))
     (lyr (car (gimp-layer-new img 250 250 RGB-IMAGE "my layer" 100 LAYER-MODE-NORMAL-LEGACY)))
   )

   (gimp-context-set-background '(250 230 240))
   (gimp-context-set-foreground '( 30  20  90))

   (gimp-drawable-fill lyr FILL-BACKGROUND)

   (gimp-image-insert-layer img lyr 0 0)

;  (gimp-context-set-antialias TRUE)

   (gimp-image-select-ellipse
          img                ;
          CHANNEL-OP-REPLACE ; operation (CHANNEL-OP-{ADD,SUBTRACT,REPLACE,INTERSECXT} )
           25  25            ; x and y coordinate of the upper-left  corner of the ellipse bounding box
          200 200            ; width and height of the ellipse
   )
;  (gimp-edit-stroke lyr)
   ;
   ; 2020-03-08
   ;    The following gimp-context-set-brush is apparently needed on Linux or
   ;    older/newer(?) versions for this example to run on David's
   ;    GIMP installation.
   :
   (gimp-context-set-brush (car (gimp-brush-new "non-existent brush")))

   (gimp-drawable-edit-stroke-selection lyr)

   (gimp-file-save RUN-NONINTERACTIVE img lyr "f:\\img\\circle.jpg" ""      )
;  (gimp-xcf-save RUN-NONINTERACTIVE  img lyr "f:\\img\\circle.xcf" "circle")

   (gimp-image-delete img)
)
(gimp-quit TRUE)
