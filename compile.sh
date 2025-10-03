#!/bin/bash
# Script de compilação do TCC

echo "🔨 Compilando TCC..."

# Primeira passagem
pdflatex -interaction=nonstopmode tcc.tex

# BibTeX para referências
bibtex tcc

# Segunda e terceira passagens para resolver referências cruzadas
pdflatex -interaction=nonstopmode tcc.tex
pdflatex -interaction=nonstopmode tcc.tex

echo "✅ Compilação concluída! PDF gerado: tcc.pdf"

