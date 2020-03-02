(let* (
     (my-image (car (gimp-image-new          250 250 RGB                                            )))
     (my-layer (car (gimp-layer-new my-image 250 250 RGB-IMAGE "my layer" 0 LAYER-MODE-NORMAL-LEGACY)))
   )

   (gimp-image-add-layer my-image my-layer 0)

   (gimp-context-set-background '( 10  40  30))
   (gimp-context-set-foreground '(255 240 230))

   (gimp-drawable-fill my-layer FILL-BACKGROUND )

   (gimp-image-select-ellipse
          my-image           ;
          CHANNEL-OP-REPLACE ; operation (CHANNEL-OP-{ADD,SUBTRACT,REPLACE,INTERSECXT} )
           25  25            ; x and y coordinate of the upper-left  corner of the ellipse bounding box
          200 200            ; widht and height of the ellipse
   )

   (gimp-drawable-edit-fill my-layer FILL-FOREGROUND)

   (gimp-file-save RUN-NONINTERACTIVE my-image my-layer "f:\\img\\filled-circle.jpg" "")
   (gimp-image-delete my-image)
)
(gimp-quit TRUE)
