(let* (
     (img (car (gimp-image-new     250 250 RGB                                              )))
     (lyr (car (gimp-layer-new img 250 250 RGB-IMAGE "my layer" 100 LAYER-MODE-NORMAL-LEGACY)))
   )

   (gimp-context-set-background '( 10  40  30))
   (gimp-context-set-foreground '(255 240 230))

   (gimp-drawable-fill lyr FILL-BACKGROUND)

;  (gimp-image-add-layer img lyr 100)
   (gimp-image-insert-layer img lyr 0 0)

   (gimp-image-select-ellipse
          img                ;
          CHANNEL-OP-REPLACE ; operation (CHANNEL-OP-{ADD,SUBTRACT,REPLACE,INTERSECXT} )
           25  25            ; x and y coordinate of the upper-left  corner of the ellipse bounding box
          200 200            ; width and height of the ellipse
   )

   (gimp-drawable-edit-fill lyr FILL-FOREGROUND)

   (gimp-file-save RUN-NONINTERACTIVE img lyr "f:\\img\\filled-circle.jpg" ""             )
;  (gimp-xcf-save RUN-NONINTERACTIVE  img lyr "f:\\img\\filled-circle.xcf" "filled-circle")

   (gimp-image-delete img)
)
(gimp-quit TRUE)
