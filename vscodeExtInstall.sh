#!/bin/bash

if command -v codium &> /dev/null
then 

echo INSTALLING VS CODIUM EXTENSIONS

codium --install-extension aaron-bond.better-comments
codium --install-extension abusaidm.html-snippets
codium --install-extension bradlc.vscode-tailwindcss
codium --install-extension CoenraadS.bracket-pair-colorizer-2
codium --install-extension dsznajder.es7-react-js-snippets
codium --install-extension ecmel.vscode-html-css
codium --install-extension esbenp.prettier-vscode
codium --install-extension Gruntfuggly.todo-tree
codium --install-extension llvm-vs-code-extensions.vscode-clangd
codium --install-extension mikestead.dotenv
codium --install-extension msjsdiag.vscode-react-native
codium --install-extension octref.vetur
codium --install-extension PKief.material-icon-theme
codium --install-extension RobbOwen.synthwave-vscode
codium --install-extension Tomi.xajssnippets
exit
elif command -v code &> /dev/null
then 

echo INSTALLING VS CODE EXTENSIONS
code --install-extension aaron-bond.better-comments
code --install-extension abusaidm.html-snippets
code --install-extension bradlc.vscode-tailwindcss
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension ecmel.vscode-html-css
code --install-extension esbenp.prettier-vscode
code --install-extension Gruntfuggly.todo-tree
code --install-extension llvm-vs-code-extensions.vscode-clangd
code --install-extension mikestead.dotenv
code --install-extension msjsdiag.vscode-react-native
code --install-extension octref.vetur
code --install-extension PKief.material-icon-theme
code --install-extension RobbOwen.synthwave-vscode
code --install-extension Tomi.xajssnippets

exit

else

echo VS CODE OR VS CODIUM NOT INSTALLED

fi

