;; ProofChain - Document certification
(define-constant ERR-ALREADY-CERTIFIED (err u100))
(define-constant ERR-NOT-FOUND (err u101))

(define-map certificates
    { hash: (buff 32) }
    { certifier: principal, timestamp: uint, metadata: (string-ascii 256) }
)

(define-public (certify (doc-hash (buff 32)) (metadata (string-ascii 256)))
    (begin
        (asserts! (is-none (map-get? certificates { hash: doc-hash })) ERR-ALREADY-CERTIFIED)
        (map-set certificates { hash: doc-hash } { certifier: tx-sender, timestamp: block-height, metadata: metadata })
        (ok true)
    )
)

(define-read-only (verify (doc-hash (buff 32)))
    (is-some (map-get? certificates { hash: doc-hash }))
)

(define-read-only (get-certificate (doc-hash (buff 32)))
    (map-get? certificates { hash: doc-hash })
)
