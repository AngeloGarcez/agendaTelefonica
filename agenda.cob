IDENTIFICATION DIVISION.
PROGRAM-ID. AGENDA-TELEFONICA.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 CONTATO.
   05 NOME PIC X(30).
   05 TELEFONE PIC X(15).

01 NOVO-CONTATO.
   05 NOME-NOVO PIC X(30).
   05 TELEFONE-NOVO PIC X(15).

01 AGENDA.
   05 AGENDA-ENTRADA OCCURS 100 TIMES.
      10 NOME-AGENDA PIC X(30).
      10 TELEFONE-AGENDA PIC X(15).

PROCEDURE DIVISION.
MAIN-PROGRAM.
   PERFORM EXIBIR-MENU UNTIL WS-OPCAO = '4'.
   STOP RUN.

EXIBIR-MENU.
   DISPLAY "=======================================".
   DISPLAY "AGENDA TELEFÔNICA".
   DISPLAY "=======================================".
   DISPLAY "1 - Inserir novo contato".
   DISPLAY "2 - Pesquisar contato".
   DISPLAY "3 - Listar todos os contatos".
   DISPLAY "4 - Sair".
   DISPLAY "=======================================".
   DISPLAY "Escolha uma opção (1-4): ".
   ACCEPT WS-OPCAO.

   IF WS-OPCAO = '1' THEN
       PERFORM INSERIR-CONTATO
   ELSE IF WS-OPCAO = '2' THEN
       PERFORM PESQUISAR-CONTATO
   ELSE IF WS-OPCAO = '3' THEN
       PERFORM LISTAR-CONTATOS.

INSERIR-CONTATO.
   DISPLAY "=======================================".
   DISPLAY "INSERIR NOVO CONTATO".
   DISPLAY "=======================================".
   DISPLAY "Nome: ".
   ACCEPT NOME-NOVO.
   DISPLAY "Telefone: ".
   ACCEPT TELEFONE-NOVO.
   MOVE NOME-NOVO TO NOME(AGENDA-INDEX).
   MOVE TELEFONE-NOVO TO TELEFONE(AGENDA-INDEX).
   ADD 1 TO AGENDA-INDEX.

PESQUISAR-CONTATO.
   DISPLAY "=======================================".
   DISPLAY "PESQUISAR CONTATO".
   DISPLAY "=======================================".
   DISPLAY "Digite o nome a ser pesquisado: ".
   ACCEPT WS-NOME-PESQUISA.
   SET AGENDA-INDEX TO 1.

   PERFORM UNTIL AGENDA-INDEX > 100 OR NOME(AGENDA-INDEX) = WS-NOME-PESQUISA
       ADD 1 TO AGENDA-INDEX
   END-PERFORM.

   IF AGENDA-INDEX <= 100 THEN
       DISPLAY "Contato encontrado:"
       DISPLAY "Nome: " NOME(AGENDA-INDEX)
       DISPLAY "Telefone: " TELEFONE(AGENDA-INDEX)
   ELSE
       DISPLAY "Contato não encontrado."

LISTAR-CONTATOS.
   DISPLAY "=======================================".
   DISPLAY "LISTA DE CONTATOS".
   DISPLAY "=======================================".
   SET AGENDA-INDEX TO 1.

   PERFORM UNTIL AGENDA-INDEX > 100 OR NOME(AGENDA-INDEX) = SPACES
       DISPLAY "Nome: " NOME(AGENDA-INDEX)
       DISPLAY "Telefone: " TELEFONE(AGENDA-INDEX)
       ADD 1 TO AGENDA-INDEX
   END-PERFORM.
