Algoritmo "SPORTS-ARENA-CHALLENGE"
//  
//  

Var
   numero : vetor[1..5] de inteiro
   nome : vetor[1..5] de caracter
   pontosFutebol : vetor[1..5] de inteiro
   pontosBasquete : vetor[1..5] de inteiro
   pontosCorrida : vetor[1..5] de inteiro
   indice : inteiro
   L : logico
   opcao : caracter


funcao pesquisa(XV: inteiro) : inteiro
Var
   II : inteiro
Inicio
   II := 1

   enquanto II < indice faca
      se Numero[II] = XV entao
         retorne II
      fimse
      II := II + 1
   fimenquanto

   retorne 0
fimfuncao


procedimento incluir
Var
   xnum : inteiro
   xnom : caracter
   tecla : caracter
Inicio
   limpaTela
   escreval(" INCLUSAO DE EQUIPES ")
   escreval(" ")

   se indice <= 5 entao
      escreva("Digite o nome da equipe: ")
      leia(xnom)

      escreva("Digite o numero da equipe: ")
      leia(xnum)

      enquanto pesquisa(xnum) <> 0 faca
         escreval("Numero ja cadastrado!")
         escreva("Digite outro numero: ")
         leia(xnum)
      fimenquanto

      Nome[indice] := xnom
      Numero[indice] := xnum

      // Toda equipe comeca com zero pontos nas tres modalidades.
      pontosFutebol[indice] := 0
      pontosBasquete[indice] := 0
      pontosCorrida[indice] := 0

      indice := indice + 1

      escreval(" ")
      escreval("Equipe cadastrada com sucesso!")
   senao
      escreval("Limite de 5 equipes atingido!")
   fimse

   escreval(" ")
   escreva("Pressione ENTER para voltar ao menu...")
   leia(tecla)
fimprocedimento


procedimento consultar
Var
   II : inteiro
   tecla : caracter
Inicio
   limpaTela
   escreval(" CONSULTA DE EQUIPES ")
   escreval(" ")

   se indice = 1 entao
      escreval("Nenhuma equipe cadastrada!")
   senao
      para II de 1 ate indice - 1 faca
         escreval("Numero: ", Numero[II], " - Equipe: ", Nome[II])
         escreval("   Futebol: ", pontosFutebol[II], " pontos")
         escreval("   Basquete: ", pontosBasquete[II], " pontos")
         escreval("   Corrida de carro: ", pontosCorrida[II], " pontos")
         escreval(" ")
      fimpara
   fimse

   escreval(" ")
   escreva("Pressione ENTER para voltar ao menu...")
   leia(tecla)
fimprocedimento


procedimento excluir
Var
   II : inteiro
   JJ : inteiro
   xnum : inteiro
   tecla : caracter
Inicio
   limpaTela
   escreval(" EXCLUSAO DE EQUIPES ")
   escreval(" ")

   se indice = 1 entao
      escreval("Nenhuma equipe cadastrada!")
   senao
      escreval("Equipes cadastradas:")
      para II de 1 ate indice - 1 faca
         escreval("[", Numero[II], "] - ", Nome[II])
      fimpara

      escreval(" ")
      escreva("Digite o numero da equipe que deseja excluir: ")
      leia(xnum)

      II := pesquisa(xnum)

      se II = 0 entao
         escreval("Equipe nao encontrada!")
      senao
         escreval(" ")
         escreval("Equipe encontrada: ", Nome[II])

         // Desloca os dados seguintes para ocupar a posicao excluida.
         JJ := II
         enquanto JJ < indice - 1 faca
            Numero[JJ] := Numero[JJ + 1]
            Nome[JJ] := Nome[JJ + 1]
            pontosFutebol[JJ] := pontosFutebol[JJ + 1]
            pontosBasquete[JJ] := pontosBasquete[JJ + 1]
            pontosCorrida[JJ] := pontosCorrida[JJ + 1]
            JJ := JJ + 1
         fimenquanto

         // Limpa a ultima posicao que ficou duplicada.
         Numero[indice - 1] := 0
         Nome[indice - 1] := ""
         pontosFutebol[indice - 1] := 0
         pontosBasquete[indice - 1] := 0
         pontosCorrida[indice - 1] := 0

         indice := indice - 1
         escreval("Equipe excluida com sucesso!")
      fimse
   fimse

   escreval(" ")
   escreva("Pressione ENTER para voltar ao menu...")
   leia(tecla)
fimprocedimento


procedimento competicao
Var
   II : inteiro
   achou : inteiro
   xnum : inteiro
   xpts : inteiro
   esporte : caracter
   tecla : caracter
Inicio
   limpaTela
   escreval(" SISTEMA DE COMPETICOES ")
   escreval(" ")

   se indice = 1 entao
      escreval("Nenhuma equipe cadastrada!")
   senao
      escreval("Escolha o esporte:")
      escreval("1 - Futebol")
      escreval("2 - Basquete")
      escreval("3 - Corrida de carro")
      escreval(" ")
      escreva("Digite sua opcao: ")
      leia(esporte)

      se (esporte <> "1") e (esporte <> "2") e (esporte <> "3") entao
         escreval("Opcao de esporte invalida!")
      senao
         limpaTela

         // Mostra as equipes cadastradas e a pontuacao da equipe no esporte escolhido.
         escolha esporte faca
            caso "1"
               escreval(" COMPETICAO - FUTEBOL ")
               escreval(" ")
               para II de 1 ate indice - 1 faca
                  escreval("[", Numero[II], "] ", Nome[II], " - ", pontosFutebol[II], " pontos")
               fimpara

            caso "2"
               escreval(" COMPETICAO - BASQUETE ")
               escreval(" ")
               para II de 1 ate indice - 1 faca
                  escreval("[", Numero[II], "] ", Nome[II], " - ", pontosBasquete[II], " pontos")
               fimpara

            caso "3"
               escreval(" COMPETICAO - CORRIDA DE CARRO ")
               escreval(" ")
               para II de 1 ate indice - 1 faca
                  escreval("[", Numero[II], "] ", Nome[II], " - ", pontosCorrida[II], " pontos")
               fimpara
         fimescolha

         escreval(" ")
         escreva("Digite o numero da equipe que recebera pontos: ")
         leia(xnum)

         // Procura diretamente o numero informado entre as equipes cadastradas.
         achou := 0
         para II de 1 ate indice - 1 faca
            se Numero[II] = xnum entao
               achou := II
            fimse
         fimpara

         se achou = 0 entao
            escreval("Equipe nao encontrada!")
         senao
            escreva("Digite a quantidade de pontos conquistados: ")
            leia(xpts)

            enquanto xpts < 0 faca
               escreval("A pontuacao nao pode ser negativa!")
               escreva("Digite uma quantidade de pontos igual ou maior que zero: ")
               leia(xpts)
            fimenquanto

            // Soma os novos pontos ao total da equipe no esporte escolhido.
            escolha esporte faca
               caso "1"
                  pontosFutebol[achou] := pontosFutebol[achou] + xpts
               caso "2"
                  pontosBasquete[achou] := pontosBasquete[achou] + xpts
               caso "3"
                  pontosCorrida[achou] := pontosCorrida[achou] + xpts
            fimescolha

            escreval(" ")
            escreval("Pontuacao atualizada com sucesso!")
         fimse

         // Exibe a pontuacao atualizada de todas as equipes nessa modalidade.
         escreval(" ")
         escreval("PONTUACAO ATUAL")
         escolha esporte faca
            caso "1"
               para II de 1 ate indice - 1 faca
                  escreval(Nome[II], " - ", pontosFutebol[II], " pontos")
               fimpara
            caso "2"
               para II de 1 ate indice - 1 faca
                  escreval(Nome[II], " - ", pontosBasquete[II], " pontos")
               fimpara
            caso "3"
               para II de 1 ate indice - 1 faca
                  escreval(Nome[II], " - ", pontosCorrida[II], " pontos")
               fimpara
         fimescolha
      fimse
   fimse

   escreval(" ")
   escreva("Pressione ENTER para voltar ao menu...")
   leia(tecla)
fimprocedimento


Inicio
   indice := 1
   L := verdadeiro
   opcao := ""

   enquanto L faca
      limpaTela
      escreval("       MENU PRINCIPAL       ")
      escreval("1 - INCLUSAO DE EQUIPES")
      escreval("2 - CONSULTA DE EQUIPES")
      escreval("3 - EXCLUSAO DE EQUIPES")
      escreval("4 - COMPETICOES")
      escreval("5 - FINALIZAR")
      escreval(" ")
      escreva("Digite a opcao: ")
      leia(opcao)

      escolha opcao faca
         caso "1"
            incluir
         caso "2"
            consultar
         caso "3"
            excluir
         caso "4"
            competicao
         caso "5"
            L := falso
         outrocaso
            escreval("OPCAO INVALIDA!")
            escreval("Pressione ENTER para continuar...")
            leia(opcao)
      fimescolha
   fimenquanto

Fimalgoritmo
