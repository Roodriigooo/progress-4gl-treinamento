DEF VAR c-descricao AS CHAR NO-UNDO.



FOR EACH ext-emitente NO-LOCK:
    FIND FIRST ext-ped-item WHERE ext-ped-item.nome-abrev = ext-emitente.nome-abrev NO-ERROR.
    
    
    IF AVAIL ext-ped-item THEN DO:
        FIND FIRST ext-item WHERE ext-item.it-codigo = "item001" NO-ERROR.
        IF AVAIL ext-item THEN DO:
            
            DISP ext-emitente.nome-abrev
                 ext-ped-item.nr-pedcli
                 ext-item.desCricao-1 .           
        END.
        ELSE DISP ext-emitente.nome-abrev
                  ext-ped-item.nr-pedcli
                  "item do cliente nao encontrado"
                  "teste"
                  WITH WIDTH 300  . 
    
    
    
    END.
END.
