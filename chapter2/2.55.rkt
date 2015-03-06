#lang scheme

(car ''abracadabra)
;(car 'abracadabra) error!
(car (quote (quote (abracadabra))))
