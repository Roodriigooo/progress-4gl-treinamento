FIND FIRST ext-item WHERE ext-item.it-codigo = "ITEM005" NO-LOCK NO-ERROR.
IF AVAIL ext-item  THEN DO:

    FIND FIRST ext-ped-item WHERE ext-ped-item.it-codigo = ext-item.it-codigo  NO-LOCK NO-ERROR.
   
    IF AVAIL ext-ped-item THEN DO:
        
        FIND FIRST ext-emitente WHERE ext-emitente.nome-abrev = ext-ped-item.nome-abrev NO-LOCK NO-ERROR.
        IF AVAIL ext-emitente THEN DO:

            DISP ext-emitente.nome-abrev
                 ext-emitente.endereco FORMAT "x(20)" .

        END.


    END.

                             

END.

