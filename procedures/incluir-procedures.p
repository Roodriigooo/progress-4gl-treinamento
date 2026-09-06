//incluir emitente E LOCAL DE ENTREGA-

RUN pi-incluir-emitente (INPUT 100 , INPUT "ABC",   INPUT "Empresa ABC Ltda",  INPUT "12345678000100",INPUT "São Paulo",     INPUT "SP" , INPUT "Rua das Flores, 100" ).
RUN pi-incluir-emitente (INPUT 200 , INPUT "BETA",  INPUT "Empresa BETA Ltda", INPUT "23456789000100",INPUT "Rio de Janeiro",INPUT "RJ" , INPUT "Avenida Central, 20" ).
RUN pi-incluir-emitente (INPUT 300 , INPUT "GAMMA", INPUT "Empresa Gamma Ltda",INPUT "34567890000100",INPUT "Curitiba",      INPUT "PR" , INPUT "Rua Paraná, 300" ).
RUN pi-incluir-emitente (INPUT 400 , INPUT "DELTA", INPUT "Empresa DELTA Ltda",INPUT "45678901000100",INPUT "Belo Horizonte",INPUT "MG" , INPUT "Avenida Minas, 400" ).
RUN pi-incluir-emitente (INPUT 500 , INPUT "OMEGA", INPUT "Empresa OMEGA Ltda",INPUT "56789012000100",INPUT "Porto Alegre",  INPUT "RS" , INPUT "Rua Sul, 500" ).


//incluir item

RUN pi-incluir-item (INPUT "ITEM001" ,INPUT "Produto A" , INPUT "UN",INPUT 10, INPUT "fm" , INPUT "123456" , INPUT 10 , INPUT 20).
RUN pi-incluir-item (INPUT "ITEM002" ,INPUT "Produto B" , INPUT "UN",INPUT 10, INPUT "fm" , INPUT "123456" , INPUT 10 , INPUT 20).
RUN pi-incluir-item (INPUT "ITEM003" ,INPUT "Produto C" , INPUT "UN",INPUT 20, INPUT "fm" , INPUT "123456" , INPUT 10 , INPUT 20).
RUN pi-incluir-item (INPUT "ITEM004" ,INPUT "Produto D" , INPUT "UN",INPUT 20, INPUT "fm" , INPUT "123456" , INPUT 10 , INPUT 20).
RUN pi-incluir-item (INPUT "ITEM005" ,INPUT "Produto E" , INPUT "UN",INPUT 30, INPUT "fm" , INPUT "123456" , INPUT 10 , INPUT 20).

//INCLUIR incluir-pedido


RUN pi-incluir-pedido (INPUT 1001 , INPUT "ABC" ,   INPUT "PED001" , INPUT TODAY , INPUT TODAY , INPUT "001" , INPUT 100).
RUN pi-incluir-pedido (INPUT 1001 , INPUT "BETA" ,  INPUT "PED002" , INPUT TODAY , INPUT TODAY , INPUT "001" , INPUT 200).
RUN pi-incluir-pedido (INPUT 1001 , INPUT "GAMMA" , INPUT "PED003" , INPUT TODAY , INPUT TODAY , INPUT "001" , INPUT 300).
RUN pi-incluir-pedido (INPUT 1001 , INPUT "DELTA" , INPUT "PED004" , INPUT TODAY , INPUT TODAY , INPUT "001" , INPUT 400).
RUN pi-incluir-pedido (INPUT 1001 , INPUT "OMEGA" , INPUT "PED005" , INPUT TODAY , INPUT TODAY , INPUT "001" , INPUT 500).


//INCLUIR ITEM DO PÉDIDO


RUN pi-incluir-item-pedido(INPUT "ABC",   INPUT "PED001" , INPUT 1 , INPUT "ITEM001" , INPUT 10 ,INPUT 10, INPUT 10 , INPUT (10 * 100), INPUT "001" ).
RUN pi-incluir-item-pedido(INPUT "BETA",  INPUT "PED002" , INPUT 1 , INPUT "ITEM002" , INPUT 10 ,INPUT 10, INPUT 10 , INPUT (20 * 100), INPUT "001" ).
RUN pi-incluir-item-pedido(INPUT "GAMMA", INPUT "PED003" , INPUT 1 , INPUT "ITEM003" , INPUT 10 ,INPUT 10, INPUT 10 , INPUT (30 * 100), INPUT "001" ).
RUN pi-incluir-item-pedido(INPUT "GAMMA", INPUT "PED003" , INPUT 2 , INPUT "ITEM001" , INPUT 10 ,INPUT 10, INPUT 10 , INPUT (30 * 100), INPUT "001" ).
RUN pi-incluir-item-pedido(INPUT "DELTA", INPUT "PED004" , INPUT 1 , INPUT "ITEM004" , INPUT 10 ,INPUT 10, INPUT 10 , INPUT (40 * 100), INPUT "001" ).
RUN pi-incluir-item-pedido(INPUT "OMEGA", INPUT "PED005" , INPUT 1 , INPUT "ITEM005" , INPUT 10 ,INPUT 10, INPUT 10 , INPUT (50 * 100), INPUT "001" ).


    
PROCEDURE pi-incluir-item-pedido:

    DEFINE INPUT PARAMETER pc-nome-abrev   AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-nr-pedcli    AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pi-nr-sequencia AS INTEGER   NO-UNDO.
    DEFINE INPUT PARAMETER pc-it-codigo    AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pd-qt-pedida    AS DECIMAL   NO-UNDO.
    DEFINE INPUT PARAMETER pd-qt-atendida  AS DECIMAL   NO-UNDO.
    DEFINE INPUT PARAMETER pd-vl-preuni    AS DECIMAL   NO-UNDO.
    DEFINE INPUT PARAMETER pd-vl-tot-it    AS DECIMAL   NO-UNDO.
    DEFINE INPUT PARAMETER pc-cod-entrega  AS CHARACTER NO-UNDO.

    /* Verifica se o item do pedido já existe. */
    IF CAN-FIND(
        FIRST ext-ped-item
        WHERE ext-ped-item.nome-abrev   = pc-nome-abrev
          AND ext-ped-item.nr-pedcli    = pc-nr-pedcli
          AND ext-ped-item.nr-sequencia = pi-nr-sequencia
          AND ext-ped-item.it-codigo    = pc-it-codigo
    ) THEN
        RETURN.

    /* Cria o registro. */
    CREATE ext-ped-item.

    ASSIGN
        ext-ped-item.nome-abrev   = pc-nome-abrev
        ext-ped-item.nr-pedcli    = pc-nr-pedcli
        ext-ped-item.nr-sequencia = pi-nr-sequencia
        ext-ped-item.it-codigo    = pc-it-codigo
        ext-ped-item.qt-pedida    = pd-qt-pedida
        ext-ped-item.qt-atendida  = pd-qt-atendida
        ext-ped-item.vl-preuni    = pd-vl-preuni
        ext-ped-item.vl-tot-it    = pd-vl-tot-it
        ext-ped-item.cod-entrega  = pc-cod-entrega.

END PROCEDURE.
    
 

PROCEDURE pi-incluir-local-entrega :

    DEFINE INPUT PARAMETER pc-nome-abrev  AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-cod-entrega AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-endereco    AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-cidade      AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-estado      AS CHARACTER NO-UNDO.

    /* Verifica se o local de entrega já existe. */
    IF CAN-FIND(
        FIRST ext-loc-entr
        WHERE ext-loc-entr.nome-abrev  = pc-nome-abrev
          AND ext-loc-entr.cod-entrega = pc-cod-entrega
    ) THEN
        RETURN.

    /* Cria o registro. */
    CREATE ext-loc-entr.

    ASSIGN
        ext-loc-entr.nome-abrev  = pc-nome-abrev
        ext-loc-entr.cod-entrega = pc-cod-entrega
        ext-loc-entr.endereco    = pc-endereco
        ext-loc-entr.cidade      = pc-cidade
        ext-loc-entr.estado      = pc-estado.

END PROCEDURE.

    
PROCEDURE pi-incluir-item:

    DEFINE INPUT PARAMETER pc-it-codigo    AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-descricao    AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-un           AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pi-ge-codigo    AS INTEGER   NO-UNDO.
    DEFINE INPUT PARAMETER pc-fm-codigo    AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-class-fiscal AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pd-peso-liquido AS DECIMAL   NO-UNDO.
    DEFINE INPUT PARAMETER pd-peso-bruto   AS DECIMAL   NO-UNDO.

    /* Verifica se o item já existe. */
    IF CAN-FIND(
        FIRST ext-item
        WHERE ext-item.it-codigo = pc-it-codigo
    ) THEN
        RETURN.

    /* Cria o registro. */
    CREATE ext-item.

    ASSIGN
        ext-item.it-codigo    = pc-it-codigo
        ext-item.descricao-1  = pc-descricao
        ext-item.un           = pc-un
        ext-item.ge-codigo    = pi-ge-codigo
        ext-item.fm-codigo    = pc-fm-codigo
        ext-item.class-fiscal = pc-class-fiscal
        ext-item.peso-liquido = pd-peso-liquido
        ext-item.peso-bruto   = pd-peso-bruto.

END PROCEDURE.




PROCEDURE pi-incluir-emitente:

    DEFINE INPUT PARAMETER pi-cod-emitente AS INTEGER   NO-UNDO.
    DEFINE INPUT PARAMETER pc-nome-abrev   AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-nome-emit    AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-cgc          AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-cidade       AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-estado       AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-endereco     AS CHARACTER NO-UNDO.
    DEF VAR c-endereco AS CHAR NO-UNDO .

    /* Verifica se o emitente já existe. */
    IF CAN-FIND(
        FIRST ext-emitente
        WHERE ext-emitente.cod-emitente = pi-cod-emitente
    ) THEN
        RETURN.


     /* Verifica se o emitente já existe. */
    FIND FIRST ext-emitente
        WHERE ext-emitente.cod-emitente = pi-cod-emitente NO-LOCK NO-ERROR.
    IF AVAIL ext-emitente THEN DO:
        RETURN.
    END.


    /* Cria o registro. */
    CREATE ext-emitente.

    /* Atribui os valores recebidos aos campos da tabela. */
    ASSIGN
        ext-emitente.cod-emitente = pi-cod-emitente
        ext-emitente.nome-abrev   = pc-nome-abrev
        ext-emitente.nome-emit    = pc-nome-emit
        ext-emitente.cgc          = pc-cgc
        ext-emitente.cidade       = pc-cidade
        ext-emitente.estado       = pc-estado.



    RUN pi-incluir-local-entrega (INPUT pc-nome-abrev,INPUT "001",INPUT pc-endereco, INPUT pc-cidade, INPUT pc-estado).

END PROCEDURE.


PROCEDURE pi-incluir-pedido:

    DEFINE INPUT PARAMETER pi-nr-pedido   AS INTEGER   NO-UNDO.
    DEFINE INPUT PARAMETER pc-nome-abrev  AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-nr-pedcli   AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pd-dt-emissao  AS DATE      NO-UNDO.
    DEFINE INPUT PARAMETER pd-dt-entrega  AS DATE      NO-UNDO.
    DEFINE INPUT PARAMETER pc-cod-entrega AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pd-vl-tot-ped  AS DECIMAL   NO-UNDO.



    DEF VAR d-valor-total  AS DECIMAL NO-UNDO.

    /* Verifica se o pedido já existe. */
    IF CAN-FIND(
        FIRST ext-ped-venda
        WHERE ext-ped-venda.nr-pedido = pi-nr-pedido
    ) THEN
        RETURN.

    /* Cria o registro. */
    CREATE ext-ped-venda.

    ASSIGN
        ext-ped-venda.nr-pedido   = pi-nr-pedido
        ext-ped-venda.nome-abrev  = pc-nome-abrev
        ext-ped-venda.nr-pedcli   = pc-nr-pedcli
        ext-ped-venda.dt-emissao  = pd-dt-emissao
        ext-ped-venda.dt-entrega  = pd-dt-entrega
        ext-ped-venda.cod-entrega = pc-cod-entrega
        ext-ped-venda.vl-tot-ped  = pd-vl-tot-ped.


    ASSIGN
        d-valor-total = 100 * 10.




END PROCEDURE.


