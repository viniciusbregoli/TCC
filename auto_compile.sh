#!/bin/bash

# Script de compilação automática para LaTeX
# Monitora o arquivo .tex e recompila automaticamente quando salvo

echo "🚀 Iniciando compilação automática do TCC..."
echo "📝 Monitorando: tcc.tex"
echo "📄 PDF será atualizado automaticamente a cada salvamento"
echo "⏹️  Para parar: Ctrl+C"
echo ""

# Compilação inicial
echo "🔄 Compilação inicial..."
pdflatex -interaction=nonstopmode tcc.tex > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Compilação inicial bem-sucedida!"
else
    echo "❌ Erro na compilação inicial. Verifique o arquivo .tex"
fi

echo ""
echo "👀 Aguardando mudanças no arquivo..."

# Monitoramento automático
echo "tcc.tex" | entr -c -n sh -c '
    echo "📝 Arquivo modificado! Recompilando..."
    if pdflatex -interaction=nonstopmode tcc.tex > /dev/null 2>&1; then
        echo "✅ PDF atualizado com sucesso! ($(date +"%H:%M:%S"))"
    else
        echo "❌ Erro na compilação! Verifique o arquivo .tex ($(date +"%H:%M:%S"))"
        echo "📋 Últimos erros:"
        tail -10 tcc.log | grep -E "(Error|error|!)"
    fi
    echo "👀 Aguardando próxima mudança..."
'
