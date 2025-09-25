# Configuração LaTeX para TCC
## Template ABNT Completo (`tcc.tex`) 🎯

O template principal utiliza **abnTeX2** e segue rigorosamente as normas ABNT:

### ✅ Elementos Pré-textuais ABNT:
- **Capa** - Formatação automática com dados da instituição
- **Folha de rosto** - Com ficha técnica do trabalho
- **Resumo** - Em português com palavras-chave
- **Abstract** - Em inglês com keywords
- **Sumário** - Geração automática com hyperlinks
- **Lista de figuras/tabelas** - Automática

### 📖 Elementos Textuais ABNT:
- **Introdução** - Contexto, objetivos, justificativa
- **Referencial teórico** - Base conceitual
- **Metodologia** - Procedimentos metodológicos
- **Desenvolvimento** - Resultados e análises
- **Conclusão** - Considerações finais e trabalhos futuros

### 📚 Elementos Pós-textuais ABNT:
- **Referências** - Bibliografia conforme ABNT
- **Apêndices** - Material elaborado pelo autor
- **Anexos** - Material de terceiros

### 🎨 Formatação ABNT Automática:
- ✅ Margens: 3cm (esq), 2cm (dir), 3cm (sup/inf)
- ✅ Fonte: Times New Roman equivalente (Latin Modern)
- ✅ Tamanho: 12pt para texto normal
- ✅ Espaçamento: 1,5 entre linhas
- ✅ Parágrafo: Primeira linha com recuo de 1,3cm
- ✅ Citações: Formatação automática ABNT
- ✅ Referências: Estilo ABNT automático
- ✅ Numeração: Páginas conforme norma

## Estrutura do Template Básico

O arquivo `tcc_completo.tex` (alternativo) inclui:

1. **Elementos Pré-textuais**:
   - Capa
   - Folha de rosto
   - Resumo
   - Abstract
   - Sumário
   - Lista de figuras
   - Lista de tabelas

2. **Elementos Textuais**:
   - Introdução
   - Referencial teórico
   - Metodologia
   - Desenvolvimento
   - Conclusão

3. **Elementos Pós-textuais**:
   - Referências
   - Apêndices
   - Anexos

## Configurações Incluídas

- ✅ Margens ABNT (3cm esq, 2cm dir, 3cm sup/inf)
- ✅ Espaçamento 1.5
- ✅ Fonte 12pt
- ✅ Numeração de páginas
- ✅ Hyperlinks funcionais
- ✅ Formatação de seções

## Próximos Passos

1. **Edite seu TCC**: Abra o arquivo `tcc.tex`
2. **Personalize** os dados: Nome, universidade, título, orientador
3. **Substitua** o conteúdo exemplo pelo seu trabalho
4. **Adicione** suas referências na seção de bibliografia  
5. **Compile** regularmente com `./auto_compile.sh`

## Dicas

- Use sempre UTF-8 para caracteres especiais
- Compile duas vezes para atualizar referências cruzadas
- Para figuras, use formatos PDF, PNG ou JPG
- Mantenha backup dos arquivos `.tex`

## 🎉 Resumo Final

✅ **LaTeX instalado e funcionando**  
✅ **abnTeX2 configurado para normas ABNT**  
✅ **Template completo pronto para uso**  
✅ **Compilação automática configurada**  
✅ **Suporte completo ao português**  

**Seu ambiente está 100% pronto para escrever o TCC conforme normas ABNT!** 🎓

## 🚀 Workflow de Produtividade

### Para começar a escrever:
```bash
cd /home/bregoli/Code/TCC
./auto_compile.sh &  # Compilação automática em background
code tcc.tex        # Abrir no VS Code (ou seu editor preferido)
```

### ✅ O que funciona AUTOMATICAMENTE:
- **Compilação**: PDF atualiza sozinho a cada Ctrl+S
- **Formatação ABNT**: Margens, fonte, espaçamento aplicados
- **Numeração**: Seções, figuras, tabelas numeradas automaticamente
- **Sumário**: Atualizado automaticamente com hyperlinks
- **Referências cruzadas**: `\ref{fig:1}` vira "Figura 1" automaticamente
- **Bibliografia**: Links automáticos entre citações e referências
- **Detecção de erros**: Avisos em tempo real

### 🔄 O que é SEMI-AUTOMÁTICO:
- **Formatação de código**: `Shift + Alt + F` organiza o LaTeX
- **Figuras**: Você insere, sistema numera e lista automaticamente
- **Citações**: Você escreve `\cite{ref}`, sistema formata ABNT

### ✋ O que você faz MANUALMENTE:
- Escrever o conteúdo (óbvio! 😄)
- Criar estrutura de seções
- Adicionar figuras e tabelas
- Escrever referências bibliográficas
- Salvar arquivo (`Ctrl + S`)

**📖 Veja exemplo completo em:** [`WORKFLOW_EXEMPLO.md`](WORKFLOW_EXEMPLO.md)

## 🎯 Conclusões do Setup

### ✅ **Ambiente Profissional Completo:**
- **LaTeX + abnTeX2**: Formatação ABNT automática e precisa
- **Times New Roman**: Fonte unificada em todo documento (texto + títulos)
- **Compilação automática**: Produtividade máxima durante escrita
- **Formatador configurado**: Código sempre organizado
- **Template completo**: Estrutura profissional pronta

### 💪 **Vantagens Conquistadas:**
1. **Foco no conteúdo**: Zero preocupação com formatação
2. **Conformidade ABNT**: 100% automática e precisa
3. **Produtividade**: PDF sempre atualizado, sem esforço manual
4. **Profissionalismo**: Resultado final impecável
5. **Eficiência**: Workflow otimizado para escrita acadêmica

### 🎓 **Resultado Final:**
**Você tem um ambiente de escrita acadêmica profissional que rival qualquer editor pago, com formatação ABNT automática, compilação em tempo real e produtividade máxima. Seu foco fica 100% no que importa: o conteúdo do seu TCC!**
