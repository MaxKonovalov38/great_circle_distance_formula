#lang racket
; Автор: MaxKonovalov38
; Поиск такси поблизости по географическим координатам используется вычисление расстояния между текущим
; местоположением пользователя и координатами такси.

; Широта клиента, которому нужно такси.
(define latitude 12.9611159)
; Долгота клиента, которому нужно такси.
(define longitude 77.6362214)
; Средний радиус Земли (километр)
(define EARTH-REDIUS 6371)
; Заданный радиус поиска
(define search-radius 50)
; Список координат такси
(define list-taxi
  (hash
    'taxi1 (vector 12.986375 77.043701 12)
    'taxi2 (vector 11.92893 728.27699 1)
    'taxi3 (vector 11.802 -9.442 21)
    'taxi4 (vector 13.1229599 77.2701202 6)
    )
)
(define mem null)

; Углы переводим в радианы
(define (conv-radiana number)
    (* number (/ pi 180))
)

; Формула расстояния по большому кругу
(define formula-distance-lc
    (for ([key (in-hash-keys list-taxi)])
        (define leingh-d
            (acos (+
            (* (sin (conv-radiana latitude)) (sin (conv-radiana (vector-ref (hash-ref list-taxi key) 0))))
            (* (cos (conv-radiana latitude)) (cos (conv-radiana (vector-ref (hash-ref list-taxi key) 0)))
                (cos (- (conv-radiana longitude) (conv-radiana (vector-ref (hash-ref list-taxi key) 1)))
            ))))
        )
        (define leingh-l
            (* leingh-d EARTH-REDIUS))
        (when (< leingh-l search-radius)
            (displayln (vector-ref (hash-ref list-taxi key) 2))
        )
    )
)

(formula-distance-lc)
;(arccos (+ (* (sin (conv-radiana latitude)) (sin (conv-radiana )))))