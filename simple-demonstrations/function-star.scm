(define (draw-line layer x-from y-from x-to y-to)

  (let* (
        (points (make-vector 4 'double))
      )

      (vector-set! points 0 x-from)
      (vector-set! points 1 y-from)
      (vector-set! points 2 x-to  )
      (vector-set! points 3 y-to  )

      (gimp-paintbrush layer
            0              ; fade-out
            4              ; number of coordinates (not coordinate pairs)
            points         ; strokes
            PAINT-CONSTANT ; method (PAINT-CONSTANT / PAINT-INCREMENTAL
            0              ; gradient length
      )
  )
)

(let* (
         (img   (car (gimp-image-new 250 250 RGB)))
         (lyr   (car (gimp-layer-new img 250 250 RGB-IMAGE "my layer" 0 LAYER-MODE-NORMAL-LEGACY)))
         (tq84-brush (car (gimp-brush-new "TQ84 Brush")))
         (nof-points  10)
         (jump-points  3)
         (i nof-points)
      )

     (gimp-image-add-layer img lyr 0)

     (gimp-context-set-background '( 30  50 200))
     (gimp-context-set-foreground '(240 110  30))

     (gimp-context-set-brush         tq84-brush)
     (gimp-brush-set-shape           tq84-brush BRUSH-GENERATED-CIRCLE)
     (gimp-brush-set-hardness        tq84-brush 0.3)

     (gimp-drawable-fill lyr FILL-BACKGROUND)

     (gimp-context-set-brush-size       3.0 )
     (gimp-context-set-brush-spacing    2.0 )

     (while (> i 0)

       (draw-line
          lyr
        ;
        ;  Note π is represented by *pi* (with the stars):
        ;
          (+ 125 (* 100 (sin (* 2 *pi* jump-points    i    (/ 1 nof-points)))))
          (+ 125 (* 100 (cos (* 2 *pi* jump-points    i    (/ 1 nof-points)))))
          (+ 125 (* 100 (sin (* 2 *pi* jump-points (+ i 1) (/ 1 nof-points)))))
          (+ 125 (* 100 (cos (* 2 *pi* jump-points (+ i 1) (/ 1 nof-points)))))
       )

;      (gimp-message (number->string i))
       (set! i (- i 1))
     )

     (gimp-file-save RUN-NONINTERACTIVE img lyr "F:\\img\\function-star.jpg" "")

     (gimp-brush-delete tq84-brush)
     (gimp-image-delete img)

)
(gimp-quit TRUE)
