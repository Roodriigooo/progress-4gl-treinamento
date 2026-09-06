FIND FIRST ext-item  WHERE ext-item.it-codigo = "item003"  EXCLUSIVE-LOCK NO-ERROR.

IF AVAIL ext-item THEN DO:
   DISP   ext-item.it-codigo
          ext-item.descricao-1 FORMAT "x(20)".    
   
   UPDATE ext-item.descricao-1.
   RELEASE ext-item.       
END.

    
    
    EXERCÍCIO 6 — ALTERAR UM ITEM
