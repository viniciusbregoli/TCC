# Instruções para Criação de Figuras do Capítulo Metodologia

Este documento contém instruções detalhadas para criar os 9 diagramas arquiteturais do capítulo de metodologia usando **draw.io** (app.diagrams.net) ou ferramenta similar.

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

## Figura 2: Visão Geral da Arquitetura de Classes (Overview)

**Arquivo**: `figuras/class_overview.png`
**Label LaTeX**: `fig:class_overview`
**Tipo**: Diagrama de classes simplificado (somente nomes e relacionamentos)

### Estrutura:

```
┌────────────────────────────────┐
│  ProcessMiningPipeline         │
│  (Facade - 402 LOC)            │
└─────────┬──────────────────────┘
          │ uses
    ┌─────┼─────┬─────┬─────┐
    ▼     ▼     ▼     ▼     ▼
┌────────┐ ┌────┐ ┌────┐ ┌────┐ ┌────┐
│LogAna  │ │Proc│ │Log │ │Log │ │ORE │
│lyzer   │ │Min │ │Sim │ │Val │ │Calc│
│(396)   │ │(459│ │(334│ │(118│ │(451│
│        │ │)   │ │)   │ │)   │ │)   │
└───┬────┘ └─┬──┘ └─┬──┘ └─┬──┘ └─┬──┘
    │ prod   │ prod │ prod │ prod  │ prod
    ▼        ▼      ▼      ▼       ▼
┌─────┐ ┌───────┐ ┌────┐ ┌─────┐ ┌────┐
│Log  │ │Process│ │Sim │ │Valid│ │ORE │
│Profi│ │Model  │ │Res │ │Res  │ │Metr│
│le   │ │       │ │    │ │     │ │ics │
└─────┘ └───┬───┘ └────┘ └─────┘ └────┘
            │
      ┌─────┴──────┬──────────┐
      ▼            ▼          ▼
┌──────────┐ ┌──────────┐ ┌──────────┐
│Activity  │ │Simulation│ │SimConfig │
│Statistics│ │Result    │ │          │
└──────────┘ └──────────┘ └──────────┘
```

### Instruções Draw.io:

1. **Objetivo**: Mostrar APENAS nomes de classes e relacionamentos (sem atributos/métodos)
2. **Layout**: Hierárquico de cima para baixo em 3 níveis
3. **Nível 1**: ProcessMiningPipeline (retângulo grande no topo)
4. **Nível 2**: 5 componentes em linha (retângulos médios)
5. **Nível 3**: 7 dataclasses em duas linhas (retângulos pequenos)
6. **Cores**:
   - ProcessMiningPipeline: Azul escuro (#1976D2)
   - Componentes: Azul médio (#42A5F5)
   - Data Models: Amarelo claro (#FFF59D)
7. **Conectores**:
   - "uses": setas tracejadas de Pipeline → Componentes
   - "produces": setas sólidas de Componentes → Data Models
8. **Texto**: Apenas nome da classe + LOC em parênteses
9. **Fontes**: Arial 11pt para nomes, 9pt para LOC
10. **Espaçamento**: Compacto, objetivo é overview
11. **Exportar como PNG**: Resolução mínima 1200px de largura

---

## Figura 3: Classe ProcessMiningPipeline Detalhada

**Arquivo**: `figuras/class_pipeline.png`
**Label LaTeX**: `fig:class_pipeline`
**Tipo**: Diagrama de classe UML detalhado (1 classe com todos atributos/métodos)

### Estrutura:

```
┌────────────────────────────────────────────────────┐
│         ProcessMiningPipeline (402 LOC)            │
├────────────────────────────────────────────────────┤
│ ATRIBUTOS:                                         │
│ - verbose: bool                                    │
│ - daily_hours: float                               │
│ - setup_time_minutes: float                        │
│ - analyzer: LogAnalyzer                            │
│ - miner: ProcessMiner                              │
│ - simulator: LogSimulator                          │
│ - validator: LogValidator                          │
│ - ore_calculator: ORECalculator                    │
├────────────────────────────────────────────────────┤
│ MÉTODOS PÚBLICOS:                                  │
│ + __init__(verbose, daily_hours, setup_time)      │
│ + analyze_log(log_path: str) -> LogProfile        │
│ + mine_process(log_path, variant_filter=0.8)      │
│     -> ProcessModel                                │
│ + simulate(model: ProcessModel, num_cases: int)   │
│     -> SimulationResult                            │
│ + validate(original_log, simulated_log)           │
│     -> ValidationResult                            │
│ + calculate_ore(log_path: str) -> OREMetrics      │
│ + run_full_pipeline(log_path: str,                │
│     variant_filter=0.8, num_cases=100) -> Dict    │
│ + quick_analysis(log_path: str) -> Dict           │
└────────────────────────────────────────────────────┘
```

### Instruções Draw.io:

1. **Tipo**: Diagrama de classe UML tradicional
2. **Formato**: Retângulo vertical dividido em 3 seções:
   - Header: Nome da classe (bold, 14pt) + LOC
   - Atributos: Lista com "- nome: tipo"
   - Métodos: Lista com "+ nome(params) -> retorno"
3. **Cores**:
   - Header: Azul escuro (#1565C0) com texto branco
   - Atributos: Azul claro (#E3F2FD)
   - Métodos: Azul muito claro (#F5F9FF)
4. **Fonte**:
   - Header: Arial 14pt bold
   - Seções "ATRIBUTOS" / "MÉTODOS": 11pt bold
   - Conteúdo: Courier New 9pt (monospace)
5. **Alinhamento**: Atributos e métodos alinhados à esquerda
6. **Bordas**: 2px para o retângulo principal, 1px para divisões
7. **Tamanho**: Altura suficiente para caber todos os métodos
8. **Exportar como PNG**: Resolução mínima 800px de largura

---

## Figura 4: Classes de Componentes Detalhadas

**Arquivo**: `figuras/class_components.png`
**Label LaTeX**: `fig:class_components`
**Tipo**: Diagrama com 5 classes de componentes lado a lado

### Estrutura:

```
┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐
│LogAnalyz │ │Process   │ │LogSimul  │ │LogValid  │ │ORECalc   │
│er        │ │Miner     │ │ator      │ │ator      │ │ulator    │
│(396 LOC) │ │(459 LOC) │ │(334 LOC) │ │(118 LOC) │ │(451 LOC) │
├──────────┤ ├──────────┤ ├──────────┤ ├──────────┤ ├──────────┤
│MÉTODOS:  │ │MÉTODOS:  │ │MÉTODOS:  │ │MÉTODOS:  │ │MÉTODOS:  │
│+ analyze │ │+ mine_   │ │+ __init_ │ │+ validat │ │+ __init_ │
│  (log_   │ │  process │ │  _(config│ │  e(orig, │ │  _(daily │
│  path)   │ │  (log,   │ │  )       │ │  sim)    │ │  _hrs,   │
│  ->Log   │ │  filter) │ │+ simulate│ │  ->Valid │ │  setup)  │
│  Profile │ │  ->Proc  │ │  (model) │ │  ation   │ │+ calcula │
│          │ │  Model   │ │  ->Sim   │ │  Result  │ │  te_from │
│          │ │          │ │  Result  │ │          │ │  _log()  │
│          │ │          │ │          │ │          │ │  ->ORE   │
│          │ │          │ │          │ │          │ │  Metrics │
├──────────┤ ├──────────┤ ├──────────┤ ├──────────┤ ├──────────┤
│RETORNA:  │ │RETORNA:  │ │RETORNA:  │ │RETORNA:  │ │RETORNA:  │
│LogProfile│ │Process   │ │Simulation│ │Validation│ │ORE       │
│          │ │Model     │ │Result    │ │Result    │ │Metrics   │
└──────────┘ └──────────┘ └──────────┘ └──────────┘ └──────────┘
```

### Instruções Draw.io:

1. **Layout**: 5 retângulos lado a lado (horizontal)
2. **Formato de cada classe**:
   - Header: Nome + LOC
   - Métodos principais (não todos, só os públicos principais)
   - Footer: Tipo de retorno principal
3. **Cores alternadas**:
   - LogAnalyzer: Verde claro (#C8E6C9)
   - ProcessMiner: Azul claro (#BBDEFB)
   - LogSimulator: Amarelo claro (#FFF9C4)
   - LogValidator: Laranja claro (#FFCCBC)
   - ORECalculator: Roxo claro (#E1BEE7)
4. **Tamanho**: Todos do mesmo tamanho (uniformidade)
5. **Fonte**: Arial 10pt para nomes, Courier 9pt para métodos
6. **Alinhamento**: Centralizar header e footer, alinhar à esquerda métodos
7. **Bordas**: 2px para cada retângulo
8. **Espaçamento**: 20px entre cada retângulo
9. **Exportar como PNG**: Resolução mínima 1400px de largura

---

## Figura 5: Classes de Modelos de Dados Detalhadas

**Arquivo**: `figuras/class_models.png`
**Label LaTeX**: `fig:class_models`
**Tipo**: Diagrama com 7 dataclasses organizadas em grid

### Estrutura:

```
Linha 1:
┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│LogProfile   │ │ProcessModel │ │Activity     │ │Simulation   │
│             │ │             │ │Statistics   │ │Config       │
├─────────────┤ ├─────────────┤ ├─────────────┤ ├─────────────┤
│-num_traces  │ │-petri_net   │ │-min_duration│ │-num_cases   │
│-num_events  │ │-initial_mark│ │-max_duration│ │-arrival_rate│
│-num_unique_ │ │-final_mark  │ │-mean_dur    │ │-activity_   │
│ activities  │ │-activities: │ │-std_dur     │ │ durations   │
│-activity_key│ │ Dict[Act]   │ │-distribution│ │-variant_    │
│-timestamp_  │ │-arrival_rate│ │ :Dict       │ │ filter_%    │
│ key         │ │-median_case │ │-frequency   │ │-random_seed │
│-case_id_key │ │ _duration   │ │-resources:  │ │-max_trace_  │
│-resource_key│ │-quality_    │ │ List        │ │ length      │
│-variants    │ │ metrics     │ │             │ │             │
│-has_        │ │             │ │             │ │             │
│ resources   │ │             │ │             │ │             │
└─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘

Linha 2:
┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│Simulation   │ │Validation   │ │OREMetrics   │
│Result       │ │Result       │ │             │
├─────────────┤ ├─────────────┤ ├─────────────┤
│-csv_path    │ │-fitness     │ │-ore: float  │
│-xes_path    │ │-cost        │ │-availability│
│-num_cases_  │ │-similarity_ │ │-performance │
│ generated   │ │ percentage  │ │-quality     │
│-num_events_ │ │-details:    │ │-total_time_ │
│ generated   │ │ Dict        │ │ available   │
│-simulation_ │ │             │ │-total_time_ │
│ time        │ │             │ │ scheduled   │
│-timestamp   │ │             │ │-total_time_ │
│             │ │             │ │ used        │
│             │ │             │ │-loss_       │
│             │ │             │ │ breakdown   │
└─────────────┘ └─────────────┘ └─────────────┘
```

### Instruções Draw.io:

1. **Layout**: Grid 2 linhas
   - Linha 1: 4 classes (LogProfile, ProcessModel, ActivityStatistics, SimulationConfig)
   - Linha 2: 3 classes (SimulationResult, ValidationResult, OREMetrics)
2. **Formato de cada dataclass**:
   - Header: Nome da classe (sem LOC para dataclasses)
   - Body: Lista de atributos principais (- nome: tipo)
3. **Cores** (todas suaves):
   - Amarelo claro (#FFF9C4) para todas as dataclasses
4. **Fonte**:
   - Header: Arial 11pt bold
   - Atributos: Courier 9pt
5. **Tamanho**: Todos do mesmo tamanho vertical para uniformidade
6. **Alinhamento**: Atributos alinhados à esquerda
7. **Bordas**: 1px (mais leve que classes de serviço)
8. **Espaçamento**: 15px entre classes, 30px entre linhas
9. **Nota**: Mostrar apenas atributos principais (não todos) para manter legibilidade
10. **Exportar como PNG**: Resolução mínima 1400px de largura

---

## Figura 6: Grafo de Dependências entre Módulos

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

## Figura 7: Fluxo de Dados entre Componentes

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

## Figura 8: Componente ORECalculator

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

## Figura 9: Interface Web Streamlit

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
