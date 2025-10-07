# TCC - LaTeX Project

Template LaTeX para TCC seguindo normas ABNT usando abnTeX2.

## 📁 Estrutura do Projeto

```
TCC/
├── tcc.tex              # Documento principal
├── referencias.bib      # Bibliografia (adicione suas referências aqui)
├── tcc.pdf             # PDF gerado (atualiza automaticamente)
├── compile.sh          # Script de compilação completa
├── format.sh           # Script de formatação do código
├── pdfs/               # PDFs de referência
└── .vscode/            # Configurações do editor
```

## 🚀 Como Usar

### Método 1: Auto-compilação (Recomendado)

Se você tem o **LaTeX Workshop** instalado no Cursor/VS Code:

1. Abra `tcc.tex`
2. Pressione `Ctrl+S` para salvar
3. ✨ **Pronto!** O arquivo será formatado E compilado automaticamente

### Método 2: Scripts manuais

```bash
# Formatar código LaTeX
./format.sh

# Compilar PDF
./compile.sh

# Ambos
./format.sh && ./compile.sh
```

### Método 3: Watch mode (auto-compila ao salvar)

```bash
latexmk -pdf -pvc tcc.tex
```

## ✅ Formatação ABNT Automática

- ✅ Margens: 3cm (esquerda/superior), 2cm (direita/inferior)
- ✅ Fonte: Times New Roman 12pt
- ✅ Espaçamento: 1,5 linhas
- ✅ Parágrafo: Recuo de 1,3cm
- ✅ Citações e referências: Padrão ABNT
- ✅ Sumário, listas e numeração: Automáticos

## 📝 Editando seu TCC

1. **Informações básicas** (linhas 44-56 de `tcc.tex`):
   - Título, autor, orientador, instituição, ano

2. **Resumo** (linhas 167-171):
   - Escreva seu resumo e palavras-chave

3. **Abstract** (linhas 174-183):
   - Versão em inglês do resumo

4. **Conteúdo** (linhas 214+):
   - Edite os capítulos: Introdução, Referencial Teórico, Metodologia, etc.

5. **Referências** (arquivo `referencias.bib`):
   - Adicione suas referências bibliográficas no formato BibTeX

## 🎯 Elementos do Template

### Pré-textuais
- Capa
- Folha de rosto
- Resumo (português)
- Abstract (inglês)
- Lista de figuras
- Lista de tabelas
- Sumário

### Textuais
- Introdução
- Referencial Teórico
- Metodologia
- Desenvolvimento
- Conclusão

### Pós-textuais
- Referências
- Apêndices
- Anexos

## 🔧 Ferramentas Instaladas

- **TeX Live** - Distribuição LaTeX completa
- **abnTeX2** - Formatação ABNT
- **latexindent** - Formatador de código
- **LaTeX Workshop** - Extensão VS Code (opcional mas recomendado)

## 💡 Dicas

- Use `Ctrl+S` para salvar, formatar e compilar automaticamente
- O formatador quebra linhas automaticamente (1 sentença por linha)
- Arquivos auxiliares (`.aux`, `.log`, etc.) são limpos automaticamente
- Para figuras, use formatos PDF, PNG ou JPG
- Mantenha backup do arquivo `.tex`

## 📚 Referências Bibliográficas

Adicione suas referências no arquivo `referencias.bib` usando formato BibTeX:

```bibtex
@article{exemplo2023,
  author = {Sobrenome, Nome},
  title = {Título do Artigo},
  journal = {Nome da Revista},
  year = {2023},
  volume = {1},
  pages = {1--10}
}

@book{exemplo2022,
  author = {Sobrenome, Nome},
  title = {Título do Livro},
  publisher = {Editora},
  year = {2022},
  address = {Cidade}
}
```

Cite no texto usando: `\cite{exemplo2023}`

## 🐛 Solução de Problemas

**PDF não atualiza:**
- Certifique-se que LaTeX Workshop está instalado
- Verifique a aba "Output" > "LaTeX Workshop" para erros
- Use `./compile.sh` como fallback

**Erros de compilação:**
- Verifique a sintaxe LaTeX
- Confira se todas as referências estão corretas
- Veja o arquivo `.log` para detalhes

**Formatação não funciona:**
- Execute `./format.sh` manualmente para testar
- Verifique se `latexindent` está instalado: `latexindent --version`

---

**Ambiente pronto! Bom trabalho! 📝🎓**
