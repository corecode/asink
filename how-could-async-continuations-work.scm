(if (test-bit UART0 :rx-availale)
    ;; fast-path
    (read-byte UART0)

    ;; else interrupt
    (lang-add-state-callback
     ;; callback function name
     "UART0_Int"

     ;; code to set up the callback
     (lambda ()
       (set-bit UART0 :rx-irq))

     ;; code to transition into the new state
     (lambda ()
       (if (test-bit UART0 :rx-available)
           (progn
            (clear-bit UART0 :rx-irq)
            (lang-resume-state))))
     ;; code picking back up the control flow
     (lambda ()
       (read-byte UART0))))
