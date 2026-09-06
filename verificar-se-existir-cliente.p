/* CREATE ext-emitente.                                 */
/*                                                      */
/* ASSIGN                                               */
/*     ext-emitente.cod-emitente  = 600                 */
/*     ext-emitente.nome-abrev    = "ZETA"              */
/*     ext-emitente.nome-emit     = "Empresa Zeta Ltda" */
/*     ext-emitente.cgc           = "67890123000100"    */
/*     ext-emitente.cidade        = "São Paulo"         */
/*     ext-emitente.estado        = "SP".               */


FIND FIRST ext-emitente WHERE ext-emitente.cod-emitente = 600  NO-LOCK NO-ERROR.
IF AVAIL ext-emitente THEN DO:
    MESSAGE "cliente Encontrado" VIEW-AS ALERT-BOX.
    DISP  
       ext-emitente.cod-emitente  
       ext-emitente.nome-abrev    
       ext-emitente.nome-emit     
       ext-emitente.cgc           
       ext-emitente.cidade        
       ext-emitente.estado 
       WITH DOWN WIDTH 300 .
 END.
 ELSE MESSAGE "cliente não encontrado" VIEW-AS ALERT-BOX. 
     
