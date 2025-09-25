# 🎨 Formatador LaTeX Configurado

O formatador LaTeX está agora configurado e pronto para uso!

## ✅ O que foi configurado:

1. **latexindent** - Formatador LaTeX instalado e funcionando
2. **Configuração VS Code** - Settings personalizados em `.vscode/settings.json`
3. **Configuração personalizada** - Arquivo `.latexindent.yaml` otimizado para TCC

## 🚀 Como usar:

### No VS Code:
1. **Formatar documento inteiro:**
   - Pressione `Shift + Alt + F`
   - Ou: `Ctrl + Shift + P` → "Format Document"

2. **Formatar seleção:**
   - Selecione o texto
   - Pressione `Ctrl + K, Ctrl + F`
   - Ou: `Ctrl + Shift + P` → "Format Selection"

### Via linha de comando:
```bash
# Formatar arquivo (cria backup .bak)
latexindent -w tcc.tex

# Formatar sem backup
latexindent -w -s tcc.tex

# Formatar com configuração personalizada
latexindent -l .latexindent.yaml -w tcc.tex
```

## ⚙️ Configurações aplicadas:

- ✅ **Indentação**: 4 espaços
- ✅ **Seções**: Indentação automática
- ✅ **Ambientes**: itemize, enumerate, etc.
- ✅ **Preservação**: Linhas em branco mantidas
- ✅ **Ambientes verbatim**: Não formatados

## 🔧 Personalizar:

Edite o arquivo `.latexindent.yaml` para ajustar:
- Tamanho da indentação
- Regras específicas
- Ambientes especiais

## 💡 Dicas:

- **Formato automático desabilitado** por padrão (evita formatação indesejada)
- **Use manualmente** quando precisar organizar o código
- **Teste primeiro** em uma cópia se não tiver certeza
- **Backup automático** criado quando usar `-w`

**Agora você pode manter seu código LaTeX sempre organizado!** 🎉


