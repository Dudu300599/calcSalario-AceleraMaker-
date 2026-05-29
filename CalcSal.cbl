       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCSAL.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-FUNCIONARIO.
          05 WS-NOME             PIC X(30).
          05 WS-SALARIO-BASE     PIC 9(5)V99.
          05 WS-TEMPO-EMPRESA    PIC 99.

       01 WS-CALCULOS.
          05 WS-BONUS            PIC 9(5)V99.
          05 WS-SALARIO-FINAL    PIC 9(6)V99.

       01 WS-CONTROLE.
          05 WS-OPCAO-MENU       PIC 9 VALUE 1.

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           PERFORM MENU-SISTEMA UNTIL WS-OPCAO-MENU = 2.
           STOP RUN.

       MENU-SISTEMA.
           DISPLAY '--- SISTEMA DE CALCULO ---'
           DISPLAY '1 - Calcular'
           DISPLAY '2 - Sair'
           ACCEPT WS-OPCAO-MENU.

           IF WS-OPCAO-MENU = 1
               PERFORM ENTRADA-DADOS
               PERFORM CALCULA-BONUS
               PERFORM CALCULA-SALARIO
               PERFORM EXIBE-RESULTADO.

       ENTRADA-DADOS.
           DISPLAY 'Digite o Nome: '
           ACCEPT WS-NOME
           DISPLAY 'Digite o Salario Base: '
           ACCEPT WS-SALARIO-BASE
           DISPLAY 'Digite os Anos de Empresa: '
           ACCEPT WS-TEMPO-EMPRESA.

       CALCULA-BONUS.
           IF WS-TEMPO-EMPRESA NOT > 1
               COMPUTE WS-BONUS = WS-SALARIO-BASE * 0.05
           ELSE
               IF WS-TEMPO-EMPRESA NOT > 5
                   COMPUTE WS-BONUS = WS-SALARIO-BASE * 0.10
               ELSE
                   COMPUTE WS-BONUS = WS-SALARIO-BASE * 0.15.

       CALCULA-SALARIO.
           COMPUTE WS-SALARIO-FINAL = WS-SALARIO-BASE + WS-BONUS.

       EXIBE-RESULTADO.
           DISPLAY '--------------------------------'
           DISPLAY 'Nome: ' WS-NOME
           DISPLAY 'Salario Base: ' WS-SALARIO-BASE
           DISPLAY 'Bonus (R$): ' WS-BONUS
           DISPLAY 'Salario Final (R$): ' WS-SALARIO-FINAL
           DISPLAY '--------------------------------'.
           
