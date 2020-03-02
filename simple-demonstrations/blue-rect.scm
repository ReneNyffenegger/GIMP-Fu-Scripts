(let* (
   (tq84_img (car (
         gimp-image-new
         250                         ; width
         100                         ; height
         RGB                         ; Image type (RGB, GRAY or INDEXED)
    )))

   (tq84_lyr (car (
         gimp-layer-new
         tq84_img
         250                         ; width
         100                         ; height
         RGB-IMAGE                   ; Layer type (RGB-IMAGE, RGBA-IMAGE, GRAY-IMAGE, GRAYA-IMAGE, INDEXED-IMAGE or INDEXEDA-IMAGE)
        "tq84"                       ; Name of the layer
         0                           ; Opacity
         LAYER-MODE-NORMAL-LEGACY    ; Layer combination mode
    ))))

    (gimp-image-insert-layer
       tq84_img
       tq84_lyr
       0                             ; parent   (0 -> layer is added inside the main stack, outside of any group.)
       0                             ; position (location of the layer inside the stack, 0: top)
    )

    (gimp-context-set-background     ; Set background color
       '(000 000 255)                ; blue
    )

    (gimp-drawable-fill
         tq84_lyr
         FILL-BACKGROUND             ; Use current background color
    )

    (gimp-file-save                  ; Invoke correct save handler according to file extension
         RUN-NONINTERACTIVE
         tq84_img
         tq84_lyr
        "f:\\img\\blue-rect.jpg"     ; File name
        ""                           ; File name as entered by user, apparently useless in scripts
    )

    (gimp-image-delete tq84_img)     ; Prevent memory leak
)

(gimp-quit TRUE)
