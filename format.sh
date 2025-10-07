#!/bin/bash
# Format LaTeX file with latexindent

if [ -z "$1" ]; then
    echo "📝 Formatting tcc.tex..."
    latexindent -m -l -s -w -g=/dev/null -c=/tmp/ tcc.tex
else
    echo "📝 Formatting $1..."
    latexindent -m -l -s -w -g=/dev/null -c=/tmp/ "$1"
fi

echo "✅ Formatting complete!"



