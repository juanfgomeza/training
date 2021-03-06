#!/bin/bash

if [ -z "${1+x}" ]; then
  echo "Login no especificado."
  echo "Uso: $0 login"
  exit -1
else
  login="$1"
fi

_challenges()
{
  local file="$1"
  local ext="$2"
  find challenges -iname "$file""$ext" | wc -l
}

_articles()
{

  local dir=articles/"$1"	
  if [ -d "$dir" ]; then
    find "$dir" | wc -l
  else
    echo 0
  fi
}

echo "$login ha enviado"
echo "$(_articles "$login") articulos"
echo "$(_challenges "$login" "*") retos"
echo "- $(_challenges "$login" ".asc") esta(n) en palabras"
echo "- $(_challenges "$login" ".py") esta(n) en Python"
echo "- $(_challenges "$login" ".rb") esta(n) en Ruby"
echo "- $(_challenges "$login" ".js") esta(n) en JavaScript"
echo "- $(_challenges "$login" ".java") esta(n) en Java"
echo "- $(_challenges "$login" ".cs") esta(n) en C#"
echo "- $(_challenges "$login" ".clj") esta(n) en Clojure"
