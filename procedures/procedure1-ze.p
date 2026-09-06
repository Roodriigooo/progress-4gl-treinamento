run pi-incluir-emitente(input 2,
                        input "RDG",
                        input "Rodrigo",
                        input "1234567811",
                        input "São Paulo",
                        input "SP").

/*                                         */
/* run pi-incluir-item (input "1",         */
/*                      input "ola mundo", */
/*                      input "2"   ,      */
/*                      input 500  ,       */
/*                      input "22"  ,      */
/*                      input "2025",      */
/*                      input 1500 ,       */
/*                      input 1200).       */


/* def var c-message as char no-undo.                           */
/*                                                              */
/* run pi-incluir-local-entrega (input "RDG"             ,      */
/*                               input "1"               ,      */
/*                               input " Rua Das Goiaba" ,      */
/*                               input "São Paulo"       ,      */
/*                               input "SP"              ,      */
/*                               output c-message)       .      */
/*     message c-message.                                       */
/*                                                              */
/*                                                              */
/*                                                              */
/*                                                              */
/*                                                              */
/* run pi-incluir-local-entrega (input "silva"             ,    */
/*                               input "1"               ,      */
/*                               input " Rua Das Goiaba" ,      */
/*                               input "São Paulo"       ,      */
/*                               input "SP"              ,      */
/*                               output c-message)       .      */
/*                                                              */
/*                                                              */
/*                                                              */
/*                                                              */
/*                                                              */
/* run pi-incluir-local-entrega (input "ze"             ,       */
/*                               input "2"               ,      */
/*                               input "Rua Das batata" ,       */
/*                               input "rio de janeiro"       , */
/*                               input "RJ"              ,      */
/*                               output c-message)       .      */
/*                                                              */
                              
                              
                              
                              
                              
                           
PROCEDURE pi-incluir-emitente :

    DEFINE INPUT PARAMETER pi-cod-emitente AS INTEGER   NO-UNDO.
    DEFINE INPUT PARAMETER pc-nome-abrev   AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-nome-emit    AS CHARACTER NO-UNDO.                                                        //input receber   output retornar
    DEFINE INPUT PARAMETER pc-cgc          AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-cidade       AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-estado       AS CHARACTER NO-UNDO.
    
     message "passei 1".
    /* Verifica se o emitente já existe. */
    IF CAN-FIND(
        FIRST ext-emitente
        WHERE ext-emitente.cod-emitente = pi-cod-emitente
    ) then
        RETURN.
         message "passei 2".
    IF CAN-FIND(
        FIRST ext-emitente
        WHERE ext-emitente.nome-abrev = pc-nome-abrev
    ) then
        RETURN.
        
        message "passei 3 ".
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
        
    
    run pi-incluir-local-entrega (input pc-nome-abrev             ,
                                  input "2"               ,
                                  input "Rua Das batata" ,
                                  input pc-cidade       ,
                                  input pc-estado            ,                                  
                                  output c-message)       .      

END PROCEDURE.


/* ===================================================================
   PROCEDURE: pi-incluir-item
   Cria um único registro na tabela ext-item.
   =================================================================== */

PROCEDURE pi-incluir-item:

    DEFINE INPUT PARAMETER pc-it-codigo    AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-descricao    AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-un           AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pi-ge-codigo    AS INTEGER   NO-UNDO.
    DEFINE INPUT PARAMETER pc-fm-codigo    AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-class-fiscal AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pd-peso-liquido AS DECIMAL   NO-UNDO.
    DEFINE INPUT PARAMETER pd-peso-bruto   AS DECIMAL   NO-UNDO.
         message "passei 1".
    /* Verifica se o item já existe. */
    IF CAN-FIND(
        FIRST ext-item
        WHERE ext-item.it-codigo = pc-it-codigo
    ) THEN
        RETURN.
        message "passei 2"  .
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


/* ===================================================================
   PROCEDURE: pi-incluir-local-entrega
   Cria um único registro na tabela ext-loc-entr.
   =================================================================== */

PROCEDURE pi-incluir-local-entrega:

    DEFINE INPUT PARAMETER pc-nome-abrev  AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-cod-entrega AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-endereco    AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-cidade      AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-estado      AS CHARACTER NO-UNDO.
    define output param    pc-message      as char no-undo.
    
    pc-message = "teste".
    
    
     message "PAASSEI 1".
    /* Verifica se o local de entrega já existe. */
    IF CAN-FIND(
        FIRST ext-loc-entr
        WHERE ext-loc-entr.nome-abrev  = pc-nome-abrev
          AND ext-loc-entr.cod-entrega = pc-cod-entrega
    ) THEN
        RETURN.
        message "PASSEI 2" .
    /* Cria o registro. */
    CREATE ext-loc-entr.

    ASSIGN
        ext-loc-entr.nome-abrev  = pc-nome-abrev
        ext-loc-entr.cod-entrega = pc-cod-entrega
        ext-loc-entr.endereco    = pc-endereco
        ext-loc-entr.cidade      = pc-cidade
        ext-loc-entr.estado      = pc-estado
        .

END PROCEDURE.


/* ===================================================================
   PROCEDURE: pi-incluir-pedido
   Cria um único registro na tabela ext-ped-venda.
   =================================================================== */

PROCEDURE pi-incluir-pedido:

    DEFINE INPUT PARAMETER pi-nr-pedido   AS INTEGER   NO-UNDO.
    DEFINE INPUT PARAMETER pc-nome-abrev  AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pc-nr-pedcli   AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pd-dt-emissao  AS DATE      NO-UNDO.
    DEFINE INPUT PARAMETER pd-dt-entrega  AS DATE      NO-UNDO.
    DEFINE INPUT PARAMETER pc-cod-entrega AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pd-vl-tot-ped  AS DECIMAL   NO-UNDO.

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
                                                     
END PROCEDURE.


/* ===================================================================
   PROCEDURE: pi-incluir-item-pedido
   Cria um único registro na tabela ext-ped-item.
   =================================================================== */

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
