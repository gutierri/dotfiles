# Set colors
BLACK="\[$(tput setaf 0)\]"
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
PINK="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
WHITE="\[$(tput setaf 7)\]"
RESET="\[$(tput sgr0)\]"

PS1="${GREEN}\u "
PS1+="${RESET}at "
PS1+="${GREEN}\h "
PS1+="${RESET}in "
PS1+="${YELLOW}\W "

# Finally prompt
PS1+="\n${BLUE}→ ${WHITE}"

export PS1
