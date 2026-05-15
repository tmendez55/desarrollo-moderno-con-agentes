#!/usr/bin/env bash
# ==============================================================================
# bootstrap.sh — Inicializa un proyecto nuevo a partir del boilerplate.
#
# Pasos:
#   1. Pide el nombre del proyecto.
#   2. Reemplaza placeholders <<NOMBRE_PROYECTO>> en los archivos.
#   3. Decide qué hacer con memory/agent-memory/ (mover fuera o .gitignore).
#   4. Opcionalmente renombra AGENT_INSTRUCTIONS.md para herramientas
#      que esperan otro nombre.
#   5. Inicializa un git nuevo (si no existe ya un .git).
#
# Idempotente: correrlo dos veces no rompe nada.
# ==============================================================================

set -euo pipefail

# ----- Estilo de salida -------------------------------------------------------
if [ -t 1 ]; then
  CYAN=$'\033[36m'; YELLOW=$'\033[33m'; GREEN=$'\033[32m'
  RED=$'\033[31m'; BOLD=$'\033[1m'; RESET=$'\033[0m'
else
  CYAN=""; YELLOW=""; GREEN=""; RED=""; BOLD=""; RESET=""
fi

info()  { printf '%s[info]%s %s\n'  "$CYAN"   "$RESET" "$*"; }
warn()  { printf '%s[warn]%s %s\n'  "$YELLOW" "$RESET" "$*"; }
ok()    { printf '%s[ ok ]%s %s\n'  "$GREEN"  "$RESET" "$*"; }
fail()  { printf '%s[fail]%s %s\n'  "$RED"    "$RESET" "$*" 1>&2; exit 1; }

prompt() {
  local q="$1"; local default="${2:-}"
  local ans
  if [ -n "$default" ]; then
    printf '%s%s%s [%s]: ' "$BOLD" "$q" "$RESET" "$default" > /dev/tty
  else
    printf '%s%s%s: ' "$BOLD" "$q" "$RESET" > /dev/tty
  fi
  IFS= read -r ans < /dev/tty || ans=""
  if [ -z "$ans" ] && [ -n "$default" ]; then
    ans="$default"
  fi
  printf '%s' "$ans"
}

confirm() {
  local q="$1"
  local ans
  printf '%s%s%s [y/N]: ' "$BOLD" "$q" "$RESET" > /dev/tty
  IFS= read -r ans < /dev/tty || ans="n"
  case "${ans,,}" in
    y|yes|s|si|sí) return 0 ;;
    *)             return 1 ;;
  esac
}

# ----- Localizar la raíz del boilerplate --------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$ROOT_DIR"
info "Trabajando en: $ROOT_DIR"

# ----- Paso 1: nombre del proyecto --------------------------------------------
PROJECT_NAME="$(prompt "Nombre del proyecto (kebab-case)" "$(basename "$ROOT_DIR")")"
if [ -z "$PROJECT_NAME" ]; then
  fail "El nombre del proyecto no puede estar vacío."
fi
ok "Nombre del proyecto: $PROJECT_NAME"

# ----- Paso 2: reemplazar placeholders ----------------------------------------
info "Reemplazando placeholders <<NOMBRE_PROYECTO>> en archivos…"
files_to_patch=()
while IFS= read -r f; do
  files_to_patch+=("$f")
done < <(grep -rl --include='*.md' --include='*.json' --include='*.yml' --include='*.yaml' \
          -e '<<NOMBRE_PROYECTO>>' . 2>/dev/null || true)

if [ "${#files_to_patch[@]}" -eq 0 ]; then
  info "No quedan placeholders <<NOMBRE_PROYECTO>> (probablemente ya corriste bootstrap)."
else
  for f in "${files_to_patch[@]}"; do
    # macOS y GNU sed difieren en -i. Usamos un archivo tmp para ser portables.
    tmp="$(mktemp)"
    sed "s/<<NOMBRE_PROYECTO>>/${PROJECT_NAME}/g" "$f" > "$tmp"
    mv "$tmp" "$f"
    ok "Patched: $f"
  done
fi

# ----- Paso 3: memoria privada -------------------------------------------------
MEMDIR="memory/agent-memory"
if [ -d "$MEMDIR" ]; then
  info "La carpeta $MEMDIR contiene memoria privada del agente. NO debe versionarse."
  printf '  1) Agregar al .gitignore (recomendado)\n' > /dev/tty
  printf '  2) Moverla fuera del repo (a ~/.agent-memory/$PROJECT_NAME)\n' > /dev/tty
  printf '  3) Dejarla como está (no recomendado)\n' > /dev/tty
  choice="$(prompt "Elegí 1, 2 o 3" "1")"
  case "$choice" in
    1)
      if ! grep -qxF "$MEMDIR/" .gitignore 2>/dev/null; then
        printf '\n# Memoria privada del agente (Capa 3) — no versionar\n%s/\n' "$MEMDIR" >> .gitignore
        ok "Agregado $MEMDIR/ al .gitignore"
      else
        info "$MEMDIR/ ya estaba en .gitignore."
      fi
      ;;
    2)
      dest="$HOME/.agent-memory/$PROJECT_NAME"
      if [ -e "$dest" ]; then
        warn "$dest ya existe. No se sobrescribe. Movelo manualmente si querés reemplazarlo."
      else
        mkdir -p "$(dirname "$dest")"
        mv "$MEMDIR" "$dest"
        ok "Movido a $dest"
        if ! grep -qxF "$MEMDIR/" .gitignore 2>/dev/null; then
          printf '\n# Memoria privada del agente — vive fuera del repo en %s\n%s/\n' "$dest" "$MEMDIR" >> .gitignore
        fi
      fi
      ;;
    3) warn "Dejando $MEMDIR como está. Recordá revisarlo antes del primer commit." ;;
    *) warn "Opción no reconocida ($choice). Dejando $MEMDIR como está." ;;
  esac
else
  info "No existe $MEMDIR/. Skipping."
fi

# ----- Paso 4: renombrar archivo de instrucciones del agente ------------------
INSTR_SRC="AGENT_INSTRUCTIONS.md"
if [ -f "$INSTR_SRC" ]; then
  if confirm "¿Tu agente requiere que el archivo de instrucciones tenga otro nombre? (ej. CLAUDE.md, AGENTS.md, .cursorrules)"; then
    new_name="$(prompt "Nombre objetivo")"
    if [ -z "$new_name" ]; then
      warn "Nombre vacío. Dejando $INSTR_SRC sin tocar."
    elif [ "$new_name" = "$INSTR_SRC" ]; then
      info "Mismo nombre. Sin cambios."
    elif [ -e "$new_name" ]; then
      warn "$new_name ya existe. No se sobrescribe."
    else
      cp "$INSTR_SRC" "$new_name"
      ok "Copiado a $new_name (se conserva $INSTR_SRC como referencia)."
      info "Si querés que solo exista uno, borrá manualmente el que no uses."
    fi
  fi
fi

# ----- Paso 5: git init -------------------------------------------------------
if [ -d .git ]; then
  info "Ya existe un .git en este directorio. Skipping git init."
else
  if confirm "¿Inicializar un repositorio git nuevo en $ROOT_DIR?"; then
    git init -b main >/dev/null
    ok "git init -b main"
    git add . >/dev/null
    if git -c user.name="bootstrap" -c user.email="bootstrap@local" commit -m "chore: bootstrap inicial de $PROJECT_NAME" >/dev/null 2>&1; then
      ok "Primer commit creado."
    else
      warn "No se pudo crear el primer commit (¿git user no configurado?). Hazlo manualmente con: git commit -m \"chore: bootstrap inicial\""
    fi
  else
    info "Saltando git init."
  fi
fi

ok "Bootstrap terminado. Próximo paso: editar AGENT_INSTRUCTIONS.md."
