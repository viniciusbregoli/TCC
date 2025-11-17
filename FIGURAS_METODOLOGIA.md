# Instruções para Criação de Figuras do Capítulo Metodologia

Este documento contém instruções detalhadas para criar os 6 diagramas arquiteturais do capítulo de metodologia usando **draw.io** (app.diagrams.net) ou ferramenta similar.

---

## Figura 1: Arquitetura em Camadas (5 Layers)
**Arquivo**: `figuras/arquitetura_camadas.png`
**Label LaTeX**: `fig:arquitetura_camadas`
**Tipo**: Diagrama de arquitetura em camadas verticais

### Estrutura:
```
┌─────────────────────────────────────────┐
│  CAMADA 1: INTERFACE DE USUÁRIO         │
│  ┌────────────────────────────────────┐ │
│  │ Streamlit Web Dashboard (app.py)   │ │
│  │ - Upload arquivos XES              │ │
│  │ - Execução passo-a-passo           │ │
│  │ - Visualizações interativas        │ │
│  │ - Exportação de resultados         │ │
│  └────────────────────────────────────┘ │
└───────────────┬─────────────────────────┘
                │ (seta para baixo)
                ▼
┌─────────────────────────────────────────┐
│  CAMADA 2: FACHADA                      │
│  ┌────────────────────────────────────┐ │
│  │ ProcessMiningPipeline (pipeline.py)│ │
│  │ - Orquestra todos os componentes   │ │
│  │ - Fornece API de alto nível        │ │
│  │ - Gerencia fluxo de dados          │ │
│  │ - Método: run_full_pipeline()      │ │
│  └────────────────────────────────────┘ │
└─┬────┬────┬────┬────┬──────────────────┘
  │    │    │    │    │ (setas para baixo)
  ▼    ▼    ▼    ▼    ▼
┌─────────────────────────────────────────┐
│  CAMADA 3: COMPONENTES (Serviços)      │
├──────┬──────┬──────┬──────┬────────────┤
│LogAn │Proc  │LogSim│LogVal│ORECalc     │
│alyzer│Miner │ulator│idator│ulator      │
│396LOC│459LOC│334LOC│118LOC│451LOC      │
│      │      │      │      │            │
│Perfil│Desco │Gera  │Valida│Calcula     │
│amento│bre   │logs  │quali │métricas    │
│auto  │model │sinté │dade  │ORE         │
│      │os    │ticos │      │            │
└──────┴──────┴──────┴──────┴────────────┘
        │ (seta para baixo)
        ▼
┌─────────────────────────────────────────┐
│  CAMADA 4: MODELOS DE DADOS (models.py) │
│  - SimulationConfig  - ProcessModel     │
│  - ActivityStatistics - SimulationResult│
│  - ValidationResult  - OREMetrics       │
│  - LogProfile                           │
└────────────────┬────────────────────────┘
                 │ (seta para baixo)
                 ▼
┌─────────────────────────────────────────┐
│  CAMADA 5: INFRAESTRUTURA               │
│  PM4Py | SimPy | Pandas | SciPy | NumPy │
└─────────────────────────────────────────┘
```

### Instruções Draw.io:
1. **Canvas**: Criar canvas vertical com 5 retângulos empilhados
2. **Cores sugeridas**:
   - Camada 1 (UI): Azul claro (#E3F2FD)
   - Camada 2 (Facade): Verde claro (#E8F5E9)
   - Camada 3 (Components): Amarelo claro (#FFF9C4)
   - Camada 4 (Data Models): Laranja claro (#FFE0B2)
   - Camada 5 (Infrastructure): Cinza claro (#F5F5F5)
3. **Fontes**: Arial ou Helvetica, tamanho 10-12pt para texto, 14-16pt para títulos de camada
4. **Setas**: Usar conectores com setas simples entre camadas
5. **Layout**: Da Camada 3, desenhar 5 setas saindo do retângulo para os 5 componentes
6. **Bordas**: Usar bordas de 2px para os retângulos principais
7. **Espaçamento**: 20-30px entre cada camada
8. **Exportar como PNG**: Resolução mínima 1200px de largura

---

## Figura 2: Arquitetura de Classes (Class Diagram)
**Arquivo**: `figuras/class_architecture.png`
**Label LaTeX**: `fig:class_architecture`
**Tipo**: Diagrama de classes estilo UML

### Estrutura:
```
┌──────────────────────────────────────┐
│  ProcessMiningPipeline (402 LOC)    │
├──────────────────────────────────────┤
│ Attributes:                          │
│ - verbose: bool                      │
│ - daily_hours: float                 │
│ - setup_time_minutes: float          │
│ - analyzer: LogAnalyzer              │
│ - miner: ProcessMiner                │
│ - simulator: LogSimulator            │
│ - validator: LogValidator            │
│ - ore_calculator: ORECalculator      │
├──────────────────────────────────────┤
│ Methods:                             │
│ + analyze_log(log_path) -> LogProfile│
│ + mine_process(...) -> ProcessModel  │
│ + simulate(...) -> SimulationResult  │
│ + validate(...) -> ValidationResult  │
│ + calculate_ore(...) -> OREMetrics   │
│ + run_full_pipeline(...) -> Dict     │
└──────────────────────────────────────┘
         │ "uses" (4 setas para baixo)
    ┌────┴─────┬─────┬─────┐
    ▼          ▼     ▼     ▼
┌─────────┐ ┌──────┐ ┌────┐ ┌──────┐
│LogAna   │ │Proc  │ │Log │ │LogVa │
│lyzer    │ │Miner │ │Sim │ │lidat │
│(396LOC) │ │(459) │ │(334│ │or    │
├─────────┤ ├──────┤ │)   │ │(118) │
│+analyze │ │+mine │ ├────┤ ├──────┤
│()->Log  │ │()->Pr│ │+sim│ │+vali │
│Profile  │ │ocess │ │()->S│ │date()│
│         │ │Model │ │imRes│ │->Val │
│         │ │      │ │ult  │ │idRes │
└─────────┘ └──────┘ └────┘ └──────┘
    │"produces"│     │     │
    └──────┬───┴─────┴─────┘
           ▼
┌────────────────────────────────────────┐
│     DATA MODELS (models.py - 131 LOC)  │
├──────────┬──────────┬──────────┬───────┤
│LogProfile│Process   │Simulation│Valida │
│          │Model     │Result    │tion   │
│          │          │          │Result │
├──────────┼──────────┼──────────┼───────┤
│-num_tra  │-petri_net│-csv_path │-fitness│
│ces       │-activit  │-xes_path │-cost   │
│-num_eve  │ies       │-num_cas  │-simila │
│nts       │-arrival_ │es_genera │rity_%  │
│-activity │rate      │ted       │-details│
│_frequen  │-quality_ │-timestamp│        │
│cies      │metrics   │          │        │
│-variants │          │          │        │
└──────────┴──────────┴──────────┴───────┘
           │ (2 setas para baixo)
     ┌─────┴─────┐
     ▼           ▼
┌──────────┐ ┌───────────┐
│Activity  │ │ORE        │
│Statistics│ │Metrics    │
├──────────┤ ├───────────┤
│-min_dur  │ │-ore:float │
│-max_dur  │ │-availab   │
│-mean_dur │ │-perform   │
│-std_dur  │ │-quality   │
│-distribu │ │-loss_     │
│tion:Dict │ │breakdown  │
│-frequency│ │-cancell   │
│-resources│ │ation_rate │
└──────────┘ └───────────┘
```

### Instruções Draw.io:
1. **Tipo**: Use o template "UML Class Diagram" do draw.io
2. **Layout**: Hierárquico de cima para baixo
3. **Classes**:
   - ProcessMiningPipeline no topo (caixa grande)
   - 4 componentes principais no meio (LogAnalyzer, ProcessMiner, LogSimulator, LogValidator)
   - Bloco DATA MODELS abaixo (4 classes lado a lado)
   - ActivityStatistics e OREMetrics na base
4. **Cores**:
   - ProcessMiningPipeline: Azul (#BBDEFB)
   - Componentes: Verde (#C8E6C9)
   - Data Models: Amarelo (#FFF9C4)
   - ActivityStatistics/OREMetrics: Laranja (#FFCCBC)
5. **Divisões**: Cada classe dividida em 3 seções (Nome | Atributos | Métodos)
6. **Conectores**:
   - "uses": setas tracejadas com label "uses"
   - "produces": setas sólidas com label "produces"
7. **Fontes**: Courier New ou Monaco para atributos/métodos (monospace), 9-10pt
8. **LOC**: Adicionar em parênteses no nome da classe
9. **Exportar como PNG**: Resolução mínima 1400px de largura

---

## Figura 3: Grafo de Dependências entre Módulos
**Arquivo**: `figuras/module_dependencies.png`
**Label LaTeX**: `fig:module_dependencies`
**Tipo**: Diagrama de árvore de dependências

### Estrutura:
```
pipeline.py (Orquestrador)
├──→ log_analyzer.py
├──→ process_mining.py
├──→ simulation.py
├──→ validation.py
├──→ ore_indicators.py
└──→ models.py

process_mining.py
├──→ models.py
├──→ utils.py
└──→ [PM4Py, SciPy]

simulation.py
├──→ models.py
├──→ utils.py
└──→ [SimPy, PM4Py, Pandas]

ore_indicators.py
├──→ models.py
├──→ utils.py
└──→ [Pandas, SciPy]

validation.py
├──→ models.py
└──→ [PM4Py, Pandas]

log_analyzer.py
├──→ models.py
└──→ [PM4Py, Pandas]

app/app.py (Interface Web)
└──→ pipeline.py
    └──→ (Todos os componentes)
```

### Instruções Draw.io:
1. **Layout**: Usar "Tree Layout" ou layout hierárquico à esquerda
2. **Nós**:
   - Retângulos arredondados para módulos Python (.py)
   - Retângulos com bordas tracejadas para bibliotecas externas [PM4Py, etc]
3. **Cores**:
   - pipeline.py: Azul escuro (#1976D2)
   - Componentes principais: Azul médio (#42A5F5)
   - models.py e utils.py: Verde (#66BB6A)
   - Bibliotecas externas: Cinza (#9E9E9E)
   - app/app.py: Roxo (#AB47BC)
4. **Setas**: Setas simples direcionais (→) de 2px
5. **Hierarquia**:
   - pipeline.py no topo esquerdo
   - Seus 6 dependentes abaixo
   - Cada dependente com suas próprias dependências à direita
6. **Agrupamento**: Agrupar bibliotecas externas em colchetes [ ]
7. **Fonte**: Arial 10pt para nomes de módulos
8. **Alinhamento**: Alinhar verticalmente módulos do mesmo nível
9. **Exportar como PNG**: Resolução mínima 1000px de largura

---

## Figura 4: Fluxo de Dados entre Componentes
**Arquivo**: `figuras/data_flow_components.png`
**Label LaTeX**: `fig:data_flow_components`
**Tipo**: Diagrama de fluxo de dados (Data Flow Diagram)

### Estrutura:
```
┌─────────────────┐
│ INPUT: log.xes  │
│ (arquivo XES)   │
└────────┬────────┘
         │
         ▼
┌─────────────────────┐
│   LogAnalyzer       │
│ analyze(log.xes)    │
└──────────┬──────────┘
           │ produz
           ▼
     ┌──────────┐
     │LogProfile│ ────┐
     └──────────┘     │ alimenta
           │          │
           ▼          │
┌─────────────────────┐│
│   ProcessMiner      ││
│ mine_process(...)   │◄┘
└──────────┬──────────┘
           │ produz
           ▼
     ┌─────────────┐
     │ProcessModel │
     │- petri_net  │
     │- activities │
     │- statistics │
     └──────┬──────┘
            │ alimenta
            ▼
┌──────────────────────┐
│   LogSimulator       │
│ simulate(model)      │
└──────────┬───────────┘
           │ produz
           ▼
     ┌──────────────┐
     │Simulation    │
     │Result        │
     │- csv_path    │
     │- xes_path    │
     └──────┬───────┘
            │ alimenta
            ▼
┌──────────────────────┐
│   LogValidator       │
│ validate(original,   │
│          synthetic)  │
└──────────┬───────────┘
           │ produz
           ▼
     ┌──────────────┐
     │Validation    │
     │Result        │
     │- fitness     │
     │- similarity  │
     └──────────────┘

(Paralelamente - branch lateral)
┌─────────────────┐
│ INPUT: log.xes  │
└────────┬────────┘
         │
         ▼
┌─────────────────────┐
│   ORECalculator     │
│ calculate_from_log()│
└──────────┬──────────┘
           │ produz
           ▼
     ┌──────────┐
     │ORE       │
     │Metrics   │
     │- ore     │
     │- losses  │
     └──────────┘
```

### Instruções Draw.io:
1. **Layout**: Vertical, fluxo de cima para baixo
2. **Elementos**:
   - **Processos** (componentes): Retângulos arredondados
   - **Dados** (dataclasses): Retângulos simples menores
   - **Input/Output**: Retângulos com bordas duplas
3. **Cores**:
   - INPUT: Verde claro (#C8E6C9)
   - Componentes (processos): Azul claro (#BBDEFB)
   - Dados (dataclasses): Amarelo claro (#FFF9C4)
4. **Setas**:
   - Setas grossas (3px) entre componentes
   - Labels nas setas: "produz", "alimenta"
   - Usar setas curvas para a seta que volta (LogProfile → ProcessMiner)
5. **Branch paralelo**: Desenhar à direita do fluxo principal
   - Mesmo INPUT (duplicar visualmente)
   - ORECalculator isolado
   - Linha tracejada vertical separando os dois fluxos
   - Label "(Paralelamente)" no topo do branch
6. **Espaçamento**: 40-50px entre elementos
7. **Fonte**: Arial 10pt para componentes, 9pt para labels de setas
8. **Exportar como PNG**: Resolução mínima 1000px de largura

---

## Figura 5: Componente ORECalculator
**Arquivo**: `figuras/ore_component.png`
**Label LaTeX**: `fig:ore_component`
**Tipo**: Diagrama de componente detalhado (Component Diagram)

### Estrutura:
```
┌────────────────────────────────────────┐
│    Componente ORECalculator            │
├────────────────────────────────────────┤
│ ENTRADA:                               │
│  • log.xes (arquivo XES)               │
│  • daily_hours: float (padrão: 11.5h)  │
│  • setup_time_minutes: float (15 min)  │
├────────────────────────────────────────┤
│ PROCESSAMENTO:                         │
│  1. Detecção de atributos enriquecidos│
│     - surgery:status                   │
│     - surgery:actual_duration          │
│     - surgery:cancellation_reason      │
│                                        │
│  2. Extração de componentes temporais  │
│     - TTA (Total Time Available)       │
│     - TTS (Total Time Scheduled)       │
│     - TTU (Total Time Used)            │
│     - TTAV (Total Time Added Value)    │
│                                        │
│  3. Cálculo de indicadores ORE         │
│     - A (Availability) = TTS / TTA     │
│     - P (Performance) = TTU / TTS      │
│     - Q (Quality) = TTAV / TTU         │
│     - ORE = A × P × Q                  │
│                                        │
│  4. Decomposição de perdas (7 categ.) │
│                                        │
│  5. Análise de cancelamentos           │
├────────────────────────────────────────┤
│ SAÍDA:                                 │
│  • OREMetrics (dataclass)              │
│    - ore: float                        │
│    - availability, performance, quality│
│    - loss_breakdown: Dict[str, float]  │
│    - cancellation_metrics: Dict        │
└────────────────────────────────────────┘
```

### Instruções Draw.io:
1. **Formato**: Retângulo grande dividido em 3 seções (ENTRADA | PROCESSAMENTO | SAÍDA)
2. **Cores**:
   - Header (nome do componente): Azul escuro (#1565C0)
   - ENTRADA: Verde claro (#A5D6A7)
   - PROCESSAMENTO: Amarelo claro (#FFF59D)
   - SAÍDA: Laranja claro (#FFCC80)
3. **Tamanho**: Retângulo alto (vertical) para acomodar todo o processamento
4. **Seção PROCESSAMENTO**:
   - Usar numeração (1, 2, 3, 4, 5)
   - Indentar sub-itens com "-"
   - Usar fonte monospace para atributos técnicos (surgery:status)
5. **Fórmulas**: Usar fonte monospace para as equações matemáticas
6. **Bullets**: Usar • para listas de itens
7. **Fonte**:
   - Header: 14pt bold
   - Seções: 12pt bold
   - Conteúdo: 10pt regular
8. **Bordas**: 3px para o retângulo principal, 1px para divisões internas
9. **Exportar como PNG**: Resolução mínima 800px de largura

---

## Figura 6: Interface Web Streamlit
**Arquivo**: `figuras/web_interface.png`
**Label LaTeX**: `fig:web_interface`
**Tipo**: Mockup de interface de usuário

### Estrutura:
```
┌────────────────────────────────────────┐
│  Streamlit Web Dashboard               │
│  (app/app.py)                          │
├────────────────────────────────────────┤
│                                        │
│  [Upload XES File]                     │
│  [Escolher arquivo...]                 │
│         │                              │
│         ▼                              │
│  ┌──────────────────────────────────┐ │
│  │  Modo de Execução:               │ │
│  │  ◉ Executar Tudo (completo)      │ │
│  │  ○ Passo-a-Passo (granular)      │ │
│  └──────────────────────────────────┘ │
│                                        │
│  ┌─ Etapa 1: Análise ──────────────┐  │
│  │ ✓ Detectados 1500 casos         │  │
│  │ ✓ Detectados 25 atividades      │  │
│  │ [Ver Estatísticas Detalhadas]   │  │
│  └─────────────────────────────────┘  │
│                                        │
│  ┌─ Etapa 2: Mineração ────────────┐  │
│  │ ✓ Modelo descoberto (Ind. Miner)│  │
│  │ ✓ Fitness: 0.92 | Precision: 0.88│ │
│  │ [Visualizar Rede de Petri]      │  │
│  │ [Download: model.pnml]          │  │
│  └─────────────────────────────────┘  │
│                                        │
│  ┌─ Etapa 3: Simulação ────────────┐  │
│  │ Número de casos: [100] ▼        │  │
│  │ Seed: [42]                      │  │
│  │ ✓ Gerados 100 casos sintéticos  │  │
│  │ [Download: synthetic.xes]       │  │
│  │ [Download: synthetic.csv]       │  │
│  └─────────────────────────────────┘  │
│                                        │
│  ┌─ Etapa 4: Validação ────────────┐  │
│  │ ✓ Similaridade: 91.2%           │  │
│  │ ✓ Fitness: 0.94                 │  │
│  │ ✓ KS-test p-value: 0.23         │  │
│  │ [Ver Comparação Detalhada]      │  │
│  └─────────────────────────────────┘  │
│                                        │
│  ┌─ ORE (Opcional) ────────────────┐  │
│  │ ✓ ORE: 68.7%                    │  │
│  │ ✓ Disponibilidade: 82%          │  │
│  │ ✓ Desempenho: 91%               │  │
│  │ [Ver Decomposição de Perdas]    │  │
│  └─────────────────────────────────┘  │
│                                        │
└────────────────────────────────────────┘
```

### Instruções Draw.io:
1. **Tipo**: Wireframe/Mockup de interface web
2. **Formato**: Retângulo principal simulando uma janela de navegador
3. **Header**:
   - Barra superior com título "Streamlit Web Dashboard"
   - Subtitle "(app/app.py)" em fonte menor
   - Cor de fundo: Gradiente azul (#1976D2 → #64B5F6)
4. **Área de Upload**:
   - Retângulo com borda tracejada
   - Ícone de upload ou documento
   - Botão "[Escolher arquivo...]"
5. **Radio buttons**: Usar círculos (◉ preenchido, ○ vazio)
6. **Cards de Etapas**:
   - 5 retângulos arredondados (Etapa 1, 2, 3, 4, ORE)
   - Cor de fundo suave (#F5F5F5)
   - Borda esquerda colorida (3px):
     - Etapa 1: Verde (#4CAF50)
     - Etapa 2: Azul (#2196F3)
     - Etapa 3: Laranja (#FF9800)
     - Etapa 4: Roxo (#9C27B0)
     - ORE: Vermelho (#F44336)
7. **Check marks**: Usar ✓ em verde (#4CAF50)
8. **Botões**: Retângulos com bordas arredondadas, sombra leve
   - Cor: Azul (#2196F3)
   - Texto branco
9. **Inputs**: Retângulos brancos com borda cinza
   - Dropdowns com ▼
10. **Fonte**:
    - Títulos: 14pt bold
    - Conteúdo: 11pt regular
    - Botões: 10pt medium
11. **Espaçamento**: 15-20px entre cards
12. **Exportar como PNG**: Resolução mínima 700px de largura

---

## Dicas Gerais para Todas as Figuras

### Padronização:
- **Paleta de cores consistente** entre as figuras
- **Fontes**: Arial ou Helvetica para texto geral, Courier/Monaco para código
- **Tamanhos de fonte**: Não usar tamanhos menores que 9pt (legibilidade)
- **Bordas**: Consistência em espessura (2-3px para elementos principais)

### Qualidade de Exportação:
- **Formato**: PNG com fundo transparente
- **Resolução**: Mínimo 1200px na dimensão maior (para impressão em alta qualidade)
- **DPI**: 300 DPI se exportar para impressão
- **Compressão**: PNG com compressão otimizada

### Checklist antes de exportar:
- [ ] Todos os textos estão legíveis?
- [ ] As cores estão consistentes com outras figuras?
- [ ] As setas estão claramente direcionadas?
- [ ] Há espaçamento adequado entre elementos?
- [ ] Labels estão bem posicionados?
- [ ] O diagrama cabe bem em 0.7-1.0 textwidth no LaTeX?

### Ferramentas Alternativas:
Se não quiser usar draw.io, também funcionam:
- **Lucidchart** (pago, mas templates prontos)
- **PlantUML** (para diagramas UML via código)
- **Mermaid.js** (diagramas via markdown)
- **Microsoft Visio** (se disponível)
- **Inkscape** (vetorial, gratuito)

---

## Como Inserir no LaTeX

Após criar cada PNG, colocar na pasta `figuras/` e o LaTeX já está configurado:

```latex
\includegraphics[width=0.9\textwidth]{figuras/arquitetura_camadas.png}
```

As figuras já estão referenciadas no texto com os labels corretos:
- `\ref{fig:arquitetura_camadas}`
- `\ref{fig:class_architecture}`
- `\ref{fig:module_dependencies}`
- `\ref{fig:data_flow_components}`
- `\ref{fig:ore_component}`
- `\ref{fig:web_interface}`

---

**Boa sorte criando as figuras! Se precisar de ajuda com alguma específica, consulte este documento.**
