# Interface Gráfica para Configurações no Hyprland

Este programa, desenvolvido em Python com Qt5, oferece uma interface gráfica intuitiva para facilitar alterações nos arquivos de configuração do Hyprland, hyprpaper e Waybar.

Com ele, você pode:

- Alterar o papel de parede do sistema.
- Personalizar cores de destaque, espessura e cantos arredondados das bordas.
- Alternar rapidamente entre resoluções 720p e 1080p.
- Acessar facilmente as configurações de atalhos de teclado e regras de janela no editor de texto.
- Exibir informações detalhadas do sistema.

Aviso: Este programa faz parte de uma série de vídeos no meu canal no YouTube sobre Arch Linux + Hyprland. Por isso, o README e as instruções aqui fornecidas são baseados no repositório oficial do Arch Linux e seus pacotes. Certifique-se de estar usando o Arch Linux ou uma de suas derivadas para garantir a compatibilidade.

## Requerimentos para instalação

### 1. Pacotes necessários

Antes de começar, instale os seguintes pacotes. Eles são essenciais para que o programa funcione corretamente:

```
sudo pacman -S --needed git imagemagick
```
- git: Necessário para clonar o repositório do programa.
- imagemagick: Utilizado para manipulação de imagens, como a troca de papéis de parede.

### Estrutura de arquivos do programa

Os arquivos do programa precisam ser organizados em uma estrutura específica para garantir que funcionem corretamente.

- Clone o repositório no diretório ~/.scripts:
Este é o local recomendado para armazenar o programa e mantê-lo organizado. Execute os comandos abaixo:
```
cd ~
mkdir .scripts
cd ~/.scripts
git clone https://github.com/SobDex/hypr ~/.scripts/hypr
```
- Dê permissão de execução para os shell scripts do programa:
```
cd ~/.scripts/hypr
chmod +x *.sh
```

### Criar ambiente virtual Python

Para isolar as dependências do programa, é necessário criar um ambiente virtual Python:

- Navegue até o diretório .scripts:
```
cd ~/.scripts
```

Crie o ambiente virtual:
```
python -m venv venv
```
Isso cria uma pasta chamada venv dentro de .scripts, que conterá todas as dependências necessárias para o programa.

- Instalar PyQt5 no ambiente virtual Python

Com o ambiente virtual criado, é hora de instalar o PyQt5, que é usado para a interface gráfica do programa:

Ative o ambiente virtual:
```
source ~/.scripts/venv/bin/activate
```
O prompt do terminal mudará, indicando que você está no ambiente virtual.

- Instale o PyQt5:
```
pip install pyqt5
```
Após a instalação, para sair do ambiente virtual, digite:
```
deactivate
```
Isso desativa o ambiente virtual e retorna ao sistema padrão.

### Estrutura dos arquivos do Hyprland

Para que o programa funcione corretamente, é necessário que o Hyprland use uma estrutura de arquivos de configuração separada.

Divida os arquivos de configuração do Hyprland:
No arquivo principal de configuração do Hyprland, é possível incluir arquivos externos. Isso facilita a organização e a edição.

- Crie o diretório para arquivos separados:
```
mkdir ~/.config/hypr/config.d
```

- Crie os arquivos necessários:
Use o comando touch para criar os arquivos de configuração:

cd ~/.config/hypr/config.d
touch borders.conf colors.conf keybinds.conf rules.conf

borders.conf: Para configurações de bordas.
colors.conf: Para definições de cores.
keybinds.conf: Para atalhos de teclado.
rules.conf: Para regras de janela.

Edite os arquivos criados:
Use um editor de texto para adicionar o conteúdo necessário em cada arquivo:

colors.conf:
Defina as cores principais do sistema:
```
$COR1=33ccffee
$COR2=00ff99ee
```

borders.conf:
Configure o tamanho e o arredondamento das bordas:

```
$SIZE=3
$RADIUS=8
```

keybinds.conf:
Este arquivo é usado para configurar atalhos de teclado do Hyprland. Exemplo:

```
$mainMod=SUPER
# Adicione aqui seus atalhos de teclado
```

rules.conf:
Configure regras para as janelas do Hyprland. Exemplo:
```
windowrule = float, ^(psensor)$
```

Inclua os arquivos no arquivo principal de configuração do Hyprland:
Adicione as linhas abaixo no arquivo principal do Hyprland para carregar os arquivos criados:
```
source = ~/.config/hypr/config.d/colors.conf
source = ~/.config/hypr/config.d/borders.conf
source = ~/.config/hypr/config.d/keybinds.conf
source = ~/.config/hypr/config.d/rules.conf
```
