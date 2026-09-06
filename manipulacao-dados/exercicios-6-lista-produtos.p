DEF VAR i-contador AS INT NO-UNDO INIT 0  .


FOR EACH ext-item WHERE ext-item.ge-codigo = 10 NO-LOCK:

    ASSIGN i-contador = i-contador + 1.           
END.

MESSAGE "Encontrou "i-contador "Registro" VIEW-AS ALERT-BOX.
