# 🚀 Workflow Completo - Exemplo Prático

## 📋 Cenário: Escrevendo uma seção do TCC

Vamos simular um dia típico escrevendo seu TCC sobre "Gerador de Modelos de Simulação".

### 🎯 **Workflow Automático vs Manual**

## 1️⃣ **PREPARAÇÃO (Manual - uma vez só)**

```bash
# Abrir terminal no diretório do projeto
cd /home/bregoli/Code/TCC

# Iniciar compilação automática (deixa rodando)
./auto_compile.sh &

# Abrir arquivo no editor (VS Code)
code tcc.tex
```

**✅ O que acontece automaticamente:**
- Compilação inicial do PDF
- Sistema fica monitorando mudanças no arquivo

---

## 2️⃣ **ESCREVENDO CONTEÚDO (Automático + Manual)**

### Você escreve (Manual):
```latex
\section{Algoritmos de Simulação}

Os algoritmos de simulação são fundamentais para...

\subsection{Método Monte Carlo}

O método Monte Carlo utiliza amostragem aleatória para...

\begin{citacao}
O método Monte Carlo é uma técnica computacional que utiliza 
números aleatórios para resolver problemas matemáticos e 
físicos complexos que seriam difíceis de resolver analiticamente.
\end{citacao}
```

### Sistema faz automaticamente:
- ✅ **Salva arquivo** → **PDF recompila sozinho** (2-3 segundos)
- ✅ **Formatação ABNT** aplicada automaticamente:
  - Margens corretas (3cm/2cm)
  - Times New Roman em tudo
  - Espaçamento 1,5 no texto
  - Citação com espaçamento 1,0 e recuo 4cm
  - Numeração automática das seções
- ✅ **Sumário atualizado** automaticamente
- ✅ **Hyperlinks** funcionando
- ✅ **Referências cruzadas** atualizadas

---

## 3️⃣ **FORMATAÇÃO DE TEXTO (Automático)**

### Você escreve assim (desorganizado):
```latex
\section{metodologia}
este   trabalho  utiliza    uma abordagem
\subsection{coleta de dados}
os dados foram coletados através de...
```

### Formatador arruma automaticamente:
```bash
# Pressionar Shift + Alt + F no VS Code
```

**✅ Resultado automático:**
```latex
\section{Metodologia}

Este trabalho utiliza uma abordagem

\subsection{Coleta de Dados}

Os dados foram coletados através de...
```

---

## 4️⃣ **ADICIONANDO FIGURAS (Semi-automático)**

### Você faz (Manual):
```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{imagens/arquitetura.png}
    \caption{Arquitetura do Sistema Proposto}
    \label{fig:arquitetura}
\end{figure}

Como mostra a Figura \ref{fig:arquitetura}, a arquitetura...
```

### Sistema faz automaticamente:
- ✅ **Numeração** da figura (Figura 1, 2, 3...)
- ✅ **Lista de figuras** atualizada no sumário
- ✅ **Referência cruzada** `\ref{fig:arquitetura}` vira "Figura 1"
- ✅ **PDF recompilado** com a nova figura

---

## 5️⃣ **BIBLIOGRAFIA (Semi-automático)**

### Você adiciona (Manual):
```latex
\begin{thebibliography}{99}

\bibitem{monte_carlo_2023}
SILVA, João. \textbf{Métodos Monte Carlo em Simulação}. 
São Paulo: Editora Tech, 2023.

\end{thebibliography}
```

### Você cita no texto (Manual):
```latex
Segundo \cite{monte_carlo_2023}, o método Monte Carlo...
```

### Sistema faz automaticamente:
- ✅ **Numeração** das referências [1], [2], [3]...
- ✅ **Links** entre citação e bibliografia
- ✅ **Formatação ABNT** das referências
- ✅ **Backlinks** (mostra onde foi citado)

---

## 6️⃣ **FINALIZANDO CAPÍTULO (Automático)**

### Resultado automático final:
- ✅ **Sumário** atualizado com nova seção
- ✅ **Numeração** de páginas correta
- ✅ **Lista de figuras/tabelas** atualizada
- ✅ **PDF** sempre atualizado (sem você fazer nada)
- ✅ **Formatação ABNT** em tudo
- ✅ **Hyperlinks** funcionando perfeitamente

---

## 🎯 **RESUMO: O que é Automático vs Manual**

### ✅ **TOTALMENTE AUTOMÁTICO:**
- Compilação do PDF a cada salvamento
- Formatação ABNT (margens, fonte, espaçamento)
- Numeração de seções, figuras, tabelas
- Sumário e listas automáticas
- Referências cruzadas
- Hyperlinks no PDF
- Detecção de erros de compilação

### 🔄 **SEMI-AUTOMÁTICO (você inicia, sistema completa):**
- Formatação de código LaTeX (`Shift + Alt + F`)
- Adição de figuras (você insere, sistema numera)
- Bibliografia (você escreve, sistema formata)
- Citações (você cita, sistema vincula)

### ✋ **MANUAL (você precisa fazer):**
- Escrever o conteúdo do trabalho
- Criar seções e estrutura
- Adicionar figuras/tabelas
- Escrever referências bibliográficas
- Revisar e corrigir o texto
- Salvar o arquivo (`Ctrl + S`)

---

## 💡 **DICAS DE PRODUTIVIDADE:**

### 🚀 **Início do dia:**
```bash
cd /home/bregoli/Code/TCC
./auto_compile.sh &    # Deixa rodando
code tcc.tex         # Abre editor
```

### ✍️ **Durante a escrita:**
- Escreva normalmente
- Salve frequentemente (`Ctrl + S`)
- PDF atualiza sozinho
- Use `Shift + Alt + F` para organizar código

### 🎯 **Final do dia:**
- Arquivo sempre salvo e compilado
- PDF sempre atualizado
- Backup automático via Git (se configurado)

**Seu foco fica 100% no conteúdo, não na formatação!** 🎓

