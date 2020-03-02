(let* (
        (img (car (gimp-image-new          250 100 RGB                                              )))
        (lyr (car (gimp-layer-new img 250 100 RGB-IMAGE "my layer" 100 LAYER-MODE-NORMAL-LEGACY)))
      )

   (gimp-image-insert-layer img lyr 0 0)

   (gimp-context-set-background '(  0 063 127))
   (gimp-context-set-foreground '( 63 127   0))
   (gimp-drawable-fill lyr FILL-BACKGROUND)

   (gimp-floating-sel-anchor (car ; Anchor specified floating selection to its associated drawable
      (gimp-text-fontname
          img
          lyr
          10           ; x-coordinate for left of bounding box
          10           ; y-coordinate for top  of bounding box
         "Hello World" ; Text (UTF-8)
          1            ; Border
          TRUE         ; Antialias (true / false)
          30  PIXELS   ; size and size type (PIXELS/POINTS)
         "Arial"       ; Font name
       )
    ))

   (gimp-file-save RUN-NONINTERACTIVE img lyr "f:\\img\\text.jpg" "")
   (gimp-image-delete img)
)

(gimp-quit TRUE)
