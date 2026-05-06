# Cambiar el usuario Github

Es necesario tener los usuarios configurados en `~/.ssh/config`

```bash
#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <usuario_github>"
    exit 1
fi

USUARIO="$1"
REPO_DIR="${2:-.}"

if [ ! -d "$REPO_DIR/.git" ]; then
    echo "Error: $REPO_DIR no es un repositorio git"
    exit 1
fi

# Sin cd: especificamos el directorio en cada comando
CURRENT_URL=$(git -C "$REPO_DIR" config --get remote.origin.url)

if [ -z "$CURRENT_URL" ]; then
    echo "Error: No existe un remoto 'origin' configurado"
    exit 1
fi

if [[ ! "$CURRENT_URL" =~ github\.com ]]; then
    echo "Error: El remoto origin no es de GitHub"
    exit 1
fi

NEW_URL="${CURRENT_URL//git@github.com:/git@github.com-$USUARIO:}"

if [ "$CURRENT_URL" = "$NEW_URL" ]; then
    echo "Error: La URL no contiene 'git@github.com:' o no pudo procesarse"
    exit 1
fi

git -C "$REPO_DIR" remote set-url origin "$NEW_URL"

echo "✓ Remoto actualizado"
echo "  Anterior: $CURRENT_URL"
echo "  Nuevo:    $NEW_URL"
```