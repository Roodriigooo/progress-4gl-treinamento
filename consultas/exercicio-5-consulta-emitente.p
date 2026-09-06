FIND FIRST ext-emitente WHERE ext-emitente.cod-emitente = 300 NO-LOCK NO-ERROR.

IF AVAIL ext-emitente THEN DO:
   MESSAGE ext-emitente.nome-abrev   SKIP
           ext-emitente.cod-emitente SKIP
           ext-emitente.nome-emit    SKIP
           ext-emitente.cidade       SKIP
           ext-emitente.estado       VIEW-AS ALERT-BOX. 
END.
ELSE MESSAGE "cliente não encontrado" VIEW-AS ALERT-BOX.
