DEF VAR c-codigo-it  AS CHAR NO-UNDO.

RUN pi-excluir-item (INPUT "ITEM0011" ) .


PROCEDURE pi-excluir-item:

    DEFINE INPUT PARAM p-it-codigo AS CHAR NO-UNDO.


    FIND FIRST ext-item WHERE ext-item.it-codigo = p-it-codigo EXCLUSIVE-LOCK NO-ERROR.

    IF AVAIL ext-item THEN DO:

        FIND FIRST ext-ped-item WHERE ext-ped-item.it-codigo = p-it-codigo NO-LOCK NO-ERROR.

        IF AVAIL ext-ped-item THEN DO:
            MESSAGE "Item não pode ser excluído porque está sendo utilizado em um pedido." VIEW-AS ALERT-BOX .
        END.
        ELSE DO:
            DELETE ext-item.
            MESSAGE "Item excluido." VIEW-AS ALERT-BOX.
        END.
        
       
    END.
    ELSE DO:
        MESSAGE "Item  não encontrado." VIEW-AS ALERT-BOX.
    END.
       
        

END PROCEDURE .



/* FOR EACH ext-item: */
/*     DISP ext-item. */
/* END.               */
