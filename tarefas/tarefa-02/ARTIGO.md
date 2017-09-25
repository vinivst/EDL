#
# SNOBOL4

## **Introdução**

A linguagem de programação SNOBOL 4 (StriNg Oriented symBOlic Language number 4), originalmente e não oficialmente chamada de  **SEXI**  e  **SCL7,** é a quarta e última encarnação de uma série de linguagens de programação específicas destinadas à manipulação de sequências de caracteres (strings). É baseada nos princípios de casamento de padrões (pattern matching) para solucionar problemas de manipulação de seqüencias. Foi desenvolvida entre 1962 e 1967 nos Laboratórios Bell, da AT&amp;T, por D. J. Farber, R. E. Griswold, e F. P. Polensky.

Seu principal diferencial com relação às outras linguagens de seu tempo foi um novo tipo de dado chamado modelo ou **_first-class data type_**, cujos valores podiam ser manipulados de todas as formas permitidas para todos os tipos diferentes de dados da linguagem, como se fosse um tipo de dado genérico, além disso disponibilizou operadores para concatenação e alteração de modelos. As sequências de caracteres geradas durante a execução podem ser tratadas como programas e executadas. Os modelos podem ser tão simples quanto uma sequência de texto do tipo **ABCD** ou tão complexos como uma nova gramática de uma nova linguagem de programação. Suas operações básicas são formação de uma string, busca de padrões e substituição de strings.

Foi popularmente utilizado nos anos 70 e 80 como linguagem de manipulação de textos, porém foi substituído por linguagens novas e mais eficientes como o Awk e o Perl.

## **Origens e Influências**

Foi desenvolvida entre 1962 e 1967 nos Laboratórios Bell, da AT&amp;T, por D. J. Farber, R. E. Griswold, e F. P. Polensky. Teve influências das seguintes linguagens:

- **COMIT** , que foi a primeira linguagem específica para processamento de cadeias de caracteres e de casamento de padrões, projetada para aplicações em tradução de linguagem natural, onde um programa era um conjunto de regras, cada uma com um padrão, uma substituição e outra regra.
- **MARKOV** , um algoritmo de Markov é um sistema de reescrita de seqüência de caracteres que usa regras semelhantes a gramática para operar em cadeias de símbolos. Tem poder equivalente ao de uma máquina de Turing e suas cadeias podem representar qualquer expressão matemática a partir da sua notação simples.
- **SCL(Symbolic Communication Language)**, que foi desenvolvida para manipulação de símbolos e inspirou o pattern matching do **SNOBOL4**.
- Além disso, pode ter tido influência também o compilador **SHADOW** que era dirigido por sintaxe. Este compilador antecipou parte da sistemática de padrões em SNOBOL e ICES. Foi utilizado por David J. Farber nos experimentos de padrões iniciais, então pode ter tido influência no SNOBOL.

Por sua vez, a **SNOBOL** influenciou as seguintes linguagens:

- **Awk** que foi criada em 1977 pelos cientistas Alfred Aho, Peter J. Weinberger e Brian Kernighan no laboratório Bell Labs. Ela é interpretada linha por linha e tem como principal objetivo deixar os scripts de Shell em sistemas POSIX mais poderosos e com muito mais recursos sem utilizar muitas linhas de comando, podendo resolver infinidades de problemas do dia-a-dia do desenvolvedor nesses sistemas operacionais. Baseada na linguagem C, é utilizada frequentemente por desenvolvedores para processar textos e manipular arquivos. Tem como os paradigmas linguagem de script, procedural e orientada a eventos. Esta linguagem é considerada por muitos um importante marco para história da programação, tendo tido bastante influência na criação de outras linguagens de programação, como Perl e Lua.
- **SL5**  que é uma linguagem de processamento de listas e strings com sintaxe orientada à expressão. Faz uso de corotinas.
- **Icon**  que é uma linguagem de programação de alto nível, com execução direcionada a objetivos e muitas facilidades para gerenciar strings e padrões de texto. Ela não é orientada a objetos, mas uma extensão orientada a objetos chamada Idol foi desenvolvida em 1996, que acabou se tornando Unicon.

## **Classificação**

- Imperativa:
  - Usa declarações que alteram o estado de um programa. Da mesma forma que em linguagens naturais, expressa comandos, um programa imperativo consiste em comandos para o computador executar. A programação imperativa enfoca a descrição de como um programa funciona através de comandos de atribuição baseados em transferência de dados e instruções. No SNOBOL4 temos por exemplo:
    - N1 = 43
    - D = 17
    - OUTPUT = N1 + D
    - 60

- Não-estruturada:
  - A programação não estruturada é o paradigma de programação historicamente mais antigo, capaz de criar algoritmos completos de Turing. Muitas vezes, é contrastado com paradigmas de programação estruturada, incluindo programação processual, funcional e orientada a objetos. No SNOBOL4 vemos como exemplo o conceito de GOTO que altera a ordem de execução do programa através de Labels, como no exemplo abaixo:
    - N = 0
    - COPY   OUTPUT = INPUT           :F(DONE)
    - N = N + 1                :(COPY)
    - DONE   OUTPUT = 'THERE WERE ' N ' LINES'
    - END
  - Nesse exemplo, começamos a contagem de linhas na variável N em 0. A próxima declaração tem um rótulo, COPY, um corpo de declaração e um campo GOTO. É uma declaração de atribuição, e começa a execução lendo uma linha de entrada. Se INPUT for obtido com sucesso uma linha, o resultado é armazenado em OUTPUT. O campo GOTO apenas está testando a falha, então SNOBOL4 prossegue para a próxima declaração, onde N é incrementado e o GOTO incondicional transfere para a declaração COPY.
Quando um fim de arquivo é lido, a variável INPUT emite um sinal de falha. A execução desta declaração termina imediatamente, sem executar a atribuição e transfere para a declaração rotulada como DONE. O número de linhas é exibido e o controle flui para a instrução END, interrompendo o programa.



- Interpretada:
  - A maioria de suas implementações executam instruções diretamente, sem antes compilar um programa em instruções de linguagem de máquina. O interpretador executa o programa diretamente, traduzindo cada declaração para uma sequência de uma ou mais sub-rotinas já compiladas em código de máquina. No SNOBOL4 enquanto seu programa está sendo executado, todo o compilador SNOBOL4 está apenas a uma chamada de função. Um programa SNOBOL4 não passa de uma série de caracteres.
- Dinâmica:
  - As variáveis não precisam ser pré-declaradas e seus valores podem mudar os tipos com facilidade. No exemplo abaixo, J começa como uma string, mas depois é alterado para que contenha um número inteiro; 42 é impresso.
    - J = ABC
    - A = 20
    - B = 22
    - J = A + B
    - OUTPUT = J

## **Pattern Matching (Casamento de Padrões)**

A casamento de padrões examina uma sequência de strings para alguma combinação de caracteres, chamado de padrão. O processo de casamento pode ser muito simples ou extremamente complexo. Por exemplo:

O assunto contém vários nomes de cores. O padrão é a string **BLUE**. A sequência do assunto contém a palavra **BLUE**?

Um padrão de casamento requer uma cadeia de strings e um padrão. A string é o primeiro elemento de declaração após o campo de label (se houver). O padrão aparece em seguida, separado da string por espaço em branco. Se STRING é a sequência de caracteres a ser examinada, e PATTERN é o padrão, parece assim:

        Label STRING PATTERN

A casamento de padrão ocorre se o padrão for encontrado na sequência da string; caso contrário, ele falha. Esse sucesso ou falha pode ser testado no campo GOTO:

        label STRING PATTERN :S(label1) F(label2)

## **Controle de fluxo**

A transferência de controle é realizada pelo comando GOTO. Ele interrompe a execução sequencial normal das instruções, informando qual declaração deve ser executada em seguida. O GOTO aparece no final da instrução, e por ser acompanhado por:

   - 1 - dois pontos (:), para desvio incondicional;

   - 2 - dois pontos + F (:F), para desvio somente se a condição avaliada retornar false (FAIL);

   - 3 - dois pontos + S (:S), para desvio somente se a condição avaliada retornar true (SUCCESS).

![Exemplo de Controle de Fluxo Snobol4](https://github.com/vinivst/EDL/blob/master/images/exemplo_controle_de_fluxo_snobol4.png)


No exemplo, a transferência **1**. ocorre apenas se houver falha na atribuição da variável 'NUMERO', caso contrário, a execução prossegue até o desvio incondicional **2**. onde retorna a execução do programa para a linha referenciada **TOPO**.

## **Exemplos de Códigos Representativos vs Python**

#### **Caso 1: Pattern Matching**

#### **Objetivo: Procurar por casamento de padrões**

#### **Snobol4:**

        PATTERN = ('TRUTURAS DE LINGUA') . MATCH

        STRING = 'ESTRUTURAS DE LINGUAGENS'

        STRING PATTERN

        OUPUT = MATCH

        END

Primeiro declaramos o padrão a ser seguido em PATTERN e guardamos a ocorrência desse padrão em MATCH através de . MATCH. Depois entramos com uma string e a definimos como 'ESTRUTURAS DE LINGUAGENS'. Feito isso, checamos através da sintaxe da linguagem SNOBOL4 com STRING PADRÃO, no caso B PATTERN, se a string em questão tem casamento com o padrão definido. Por último apenas retornamos o valor de match na variável OUTPUT, que é especial do programa para retornar valores e exibi-los.

#### **Python:**

        pattern= 'TRUTURAS DE LINGUA'

        string = **ESTRUTURAS DE LINGUAGENS**

        if pattern in string:

        print(pattern)

##### **Output em ambos será:**

        'TRUTURAS DE LINGUA'

#### **Caso 2: Controle de Fluxo**

#### **Objetivo: Receber dados através do input até que a entrada seja 'exit'**

#### **Snobol4:**

      TOPO n = input()

      DIFFER(n,'exit')  :S(TOPO) F(FIM)

      FIM  END

O que for entrado como dado através do input é guardado na variável n, após isso, através do comando DIFFER, que recebe dois argumentos e retorna SUCCESS se eles forem diferentes ou FAIL caso sejam iguais. Enquanto eles forem diferentes através do controle de fluxo, nosso programa será redirecionado sempre para a linha que tem a label TOPO, voltando para o início para receber novas entradas. Quando a entrada for exatamente a palavra 'exit', nossa função DIFFER retorna FAIL e através do controle de fluxo envia o programa para a linha com a label FIM, que nada mais faz do que encerrar a execução do mesmo.

#### **Python:**

    while True:

    n = raw\_input()

    if n.strip() == 'exit':

        break

## **Avaliação em Comparação ao Python**

#### **Readability:**

Python possui uma melhor Readability pois fica mais transparente à quem estiver lendo o que está sendo feito, pois tanto no primeiro caso onde temos a chamada do método **in** (em) que é mais natural, como se fosse uma simples leitura tanto no segundo, pois a utilização do controle de fluxo e da função DIFFER não são tão naturais e óbvias de se entender quanto um loop com while true/break no python. Reforça-se esse argumento pois em Snobol4 o padrão de STRING PATTERN pode, em um primeiro momento, confundir quem está lendo sobre o que está acontecendo.

#### **Writability:**

Nas duas linguagens verificamos a mesma facilidade e simplicidade para atingir o mesmo objetivo, portanto acreditamos que nesse quesito o writability das duas linguagens é o mesmo.

#### **Expressividade:**

Se uma linguagem exige muito código para expressar uma abstração, ela é menos expressiva, portanto nesse contexto, por julgarmos que em ambas as linguagens a exigência de código para representar tanto a abstração do match pattern quanto a do controle de fluxo é a mesma, tendo em vista que por ser uma linguagem muito antiga e suas principais características já terem sido incorporadas pelas linguagens mais modernas, a expressividade de ambas é equivalente.

## **Conclusão**

Por ser uma linguagem muito antiga, carece de suporte apropriado, seja da própria linguagem ou da comunidade (???). Apesar disso, SNOBOL4 ainda possui vantagens quando o quesito é o tratamento de strings, como por exemplo tipagem dinâmica que fora abordada anteriormente. Foi uma linguagem tão revolucionária na época que influenciou várias linguagens em gerações posteriores e ainda hoje, as linguagens mais modernas possuem algum traço de seu principal diferencial, que foi o pattern matching (casamento de padrões).

## **Bibliografia**

- Slides: https://github.com/vinivst/EDL/blob/master/slides/edl-01.pdf
- Wikipedia:
  - [https://en.wikipedia.org/wiki/SNOBOL](https://en.wikipedia.org/wiki/SNOBOL)
  - [https://en.wikipedia.org/wiki/Icon\_(programming\_language)](https://en.wikipedia.org/wiki/Icon_(programming_language))
  - [https://pt.wikipedia.org/wiki/AWK](https://pt.wikipedia.org/wiki/AWK)
- Hopl:
  - [http://hopl.info/showlanguage.prx?exp=171](http://hopl.info/showlanguage.prx?exp=171)
  - [http://hopl.info/showlanguage.prx?exp=783](http://hopl.info/showlanguage.prx?exp=783)
- Site da linguagem:
  - [http://www.snobol4.org/](http://www.snobol4.org/)
