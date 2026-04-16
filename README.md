Disciplina: Computação Gráfica
Alunos: Guilherme Machado e Douglas França

# Etapa 1 - Diagrama
<pre> 
```text
┌──────────────────────────────────────────────┐
│                  TELA                        │
│ Origem inicial: (0,0) no canto superior      │
└──────────────────────┬───────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────┐
│                    SOL                       │
│ - translate(width/2, height/2)              │
│ - Move a origem para o centro da tela       │
│ - Define o referencial global               │
└──────────────────────┬───────────────────────┘
                       │
                       │ (afeta todos os planetas)
                       │ rotate(theta_planeta)
                       │ → faz os planetas orbitarem o sol, usando o ângulo theta que muda com base na orbitspeed
                       │
                       │ translate(dist_planeta, 0)
                       │ → posiciona cada planeta com uma certa distância do sol
                       ▼
┌──────────────────────────────────────────────┐
│                 PLANETA i                    │
│ - Já está posicionado ao redor do Sol        │
│ - Agora vira referencial das luas            │
└──────────────────────┬───────────────────────┘
                       │
                       │ (afeta todas as luas vinculadas ao planeta)
                       │ rotate(theta_lua)
                       │ → faz as luas orbitarem o planeta com base no ângulo theta, que é alterado através da orbitspeed
                       │
                       │ translate(dist_lua, 0)
                       │ → posiciona cada lua a uma certa distância do planeta
                       ▼
┌──────────────────────────────────────────────┐
│              LUA j do planeta i              │
│ - Orbita o planeta (não o Sol diretamente)   │
└──────────────────────────────────────────────┘
```</pre>
# Etapa 2 - Explicação do fluxo de atualização

### Planetas
- Durante a criação dos planetas, cada planeta recebe uma orbitspeed aletaório e instancia suas próprias luas, que por sua vez também possuem um orbitspeed próprio
- Durante cada iteração, a propriedade theta é incrementada com o valor de orbitspeed e utilizada no método rotate para simular a orbitação do planeta
- É chamada o método de atualiação das luas do planeta
- O método translate é chamado com o valor de distância X do planeta em relação ao sol

### Luas
- Durante a criação das luas, cada lua recebe uma orbitspeed que será usada na atualização do ângulo theta de rotação
- o valor de theta é incrementado com a orbitspeed a cada interação
- o método translate é usado para definir uma distância fixa da lua em relação ao seu planeta

# Etapa 3 - Extensão do código
- A propriedade `moon` da classe Planeta foi substituída por um array de `Moons`
- foram criados 3 novos métodos: `instantiateMoons`, `updateMoons`, `displayMoons`, que iteram sobre todas as luas, instanciando, atualizando e apresentando cada lua
- Foram adicionadas mudanças nos construtores das classes, para que seja possível controlar melhor algumas propriedades do programa:
    - Planetas: adicionada propriedade `moons_` no construtor, para definir a quantidade de luas que cada planeta irá possuir
    - Luas: adiciona a propriedade `moonColor` co construtor, para definir uma cor aleatória para cada lua durante a instancialização

# Etapa 4 - Relatório

As órbitas, tanto dos planetas, quanto das luas, já são independentes uma das outras, visto que os métodos push e pop são chamados para cada objeto individualmente , e,
as propriedades de distância e velocidade são definidas via construtor ou de forma interna no objeto. Isso impede que um objeto interfira na órbita do outro. Dessa forma, 
a principal modificação para implementar e extensão proposta foi substituir a propriedade única de moon por uma array de luas. Assim é possível reaproveitar toda
a estrutura de atualização dos objetos sem precisar de muitas alterações. Portanto, não foi necessário adicionar novos métodos de `push` e `pop` da matriz, visto que os existentes já bastavam.

Atualmente, o programa chama primeiro o método rotate e depois o translate, o que permite simular um planeta orbitando ao redor do centro (Sol), porém se isso fosse invertido, 
os planetas seriam posicionados a uma distância relativa do sol, mas se manteriam parados em uma linha reta, como se estivessem orbitando ao redor do seu próprio eixo em vez do centro.

