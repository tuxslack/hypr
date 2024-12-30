# Interface Gráfica para Configurações no Hyprland 

Este programa, desenvolvido em Python com Qt5, oferece uma interface gráfica intuitiva para facilitar alterações nos arquivos de configuração do Hyprland, hyprpaper e Waybar.

<p align="center">
  <img src="https://github.com/SobDex/hypr/blob/main/config-py.png" alt="Interface Gráfica Hyprland" width="600">
  
</p>
  
Com ele, você pode:

- Alterar o papel de parede do sistema.
- Personalizar cores de destaque, espessura e cantos arredondados das bordas.
- Alternar rapidamente entre resoluções 720p e 1080p.
- Acessar facilmente as configurações de atalhos de teclado e regras de janela no editor de texto.
- Exibir informações detalhadas do sistema.

Existe um vídeo no Youtube sobre a aplicação: https://youtu.be/7O0chbY-NMk

  [![Interface Gráfica para configurações do Hyprland](https://img.youtube.com/vi/7O0chbY-NMk/0.jpg)](https://www.youtube.com/watch?v=7O0chbY-NMk)

**Aviso**: Este programa faz parte de uma série de vídeos no meu canal no YouTube sobre Arch Linux + Hyprland. Por isso, as instruções aqui fornecidas são baseadas no repositório oficial do Arch Linux e seus pacotes. Certifique-se de estar usando o Arch Linux ou uma de suas derivadas para garantir a compatibilidade. Isso não significa que o programa não funcionará em outras distribuições Linux. No entanto, pode ser necessário realizar alguns ajustes e ter conhecimento sobre os pacotes disponíveis nos repositórios específicos da distribuição que você está utilizando.

## Requerimentos para instalação

Caso seja necessário, **você pode visitar o repositório do projeto para acessar a configuração atual do meu sistema**, incluindo os arquivos de configuração tanto do Hyprland quanto da Waybar. Isso pode ser útil para entender a estrutura e as personalizações feitas, além de fornecer exemplos prontos para o seu uso.
https://github.com/SobDex/ArchLinux-Hyprland

### 1. Pacotes necessários

Antes de começar, instale os seguintes pacotes. Eles são essenciais para que o programa funcione corretamente:

```
sudo pacman -S --needed git imagemagick zenity
```
- git: Necessário para clonar o repositório do programa.
- imagemagick: Utilizado para manipulação de imagens, como a troca de papéis de parede.
- zenity: Exibe caixas de diálogos
  
### 2. Estrutura de arquivos do programa

Os arquivos do programa precisam ser organizados em uma estrutura específica para garantir que funcionem corretamente.

- Clone o repositório no diretório `~/.scripts`:
Este é o local recomendado para armazenar o programa e mantê-lo organizado. Execute os comandos abaixo:
```
cd ~
mkdir .scripts
cd ~/.scripts
git clone https://github.com/SobDex/hypr
```
- Dê permissão de execução para os shell scripts do programa:
```
cd ~/.scripts/hypr
chmod +x *.sh
```

### 3. Criar ambiente virtual Python

Para isolar as dependências do programa, é necessário criar um ambiente virtual Python:

- Navegue até o diretório `.scripts`:
```
cd ~/.scripts
```

Crie o ambiente virtual:
```
python -m venv venv
```
Isso cria uma pasta chamada `venv` dentro de `~/.scripts`, que conterá todas as dependências necessárias para o programa.

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

### 4. Estrutura dos arquivos do Hyprland

Para que o programa funcione corretamente, é necessário que o Hyprland use uma estrutura de arquivos de configuração separada.

Divida os arquivos de configuração do Hyprland:
No arquivo principal de configuração do Hyprland, é possível incluir arquivos externos. Isso facilita a organização e a edição.

- Crie o diretório para arquivos separados:
```
mkdir ~/.config/hypr/config.d
```

#### Crie os arquivos necessários:
Use o comando `touch` para criar os arquivos de configuração:

```
cd ~/.config/hypr/config.d
touch borders.conf colors.conf keybinds.conf rules.conf
```
- borders.conf: Para configurações de bordas.
- colors.conf: Para definições de cores.
- keybinds.conf: Para atalhos de teclado.
- rules.conf: Para regras de janela.

#### Edite os arquivos criados:

Use um editor de texto para adicionar o conteúdo necessário em cada arquivo:

#### colors.conf:

Defina as cores principais do sistema:
```
$COR1=33ccffee
$COR2=00ff99ee
```

#### borders.conf:

Configure o tamanho e o arredondamento das bordas:

```
$SIZE=3
$RADIUS=8
```

#### keybinds.conf:

Este arquivo é usado para configurar atalhos de teclado do Hyprland. Exemplo:

```
$mainMod=SUPER
# Adicione aqui seus atalhos de teclado
```

#### rules.conf:

Configure regras para as janelas do Hyprland. Exemplo:
```
windowrule = float, ^(psensor)$
```

#### Inclua os arquivos no arquivo principal de configuração do Hyprland:
Adicione as linhas abaixo no arquivo principal do Hyprland `~/.config/hypr/hyprland.conf`, para carregar os arquivos criados:
```
source = ~/.config/hypr/config.d/colors.conf
source = ~/.config/hypr/config.d/borders.conf
source = ~/.config/hypr/config.d/keybinds.conf
source = ~/.config/hypr/config.d/rules.conf
```
### 5. Estrutura de arquivos da Waybar

- crie um novo arquivo .css no diretório de configuração da Waybar:

```
touch ~/.config/waybar/accent-color.css
```
- Adicione na primeira linha do arquivo `~/.config/waybar/style.css` o código importará o estilo do arquivo criado:
```
@import url('accent-color.css');
```
- Recorte do arquivo `~/.config/waybar/style.css` o bloco de código: `#workspaces button` e cole no aquivo css `~/.config/waybar/accent-color.css`. Exemplo:
```
#workspaces button {
    color: #44CDEE;
    background-color: rgba(0, 0, 0, 0.5);
    padding: 1px 7px;
    border-radius: 20px;
    border: 1px solid #333;
    margin: 4px 4px;
}
```

## Como executar o programa?

Devido o programa depender do **pyqt5** é necessário usar o caminho do Python que foi instalado no ambiente virtual. Segue abaixo o comando baseado na estrutura de arquivos criada:
```
$HOME/.scripts/venv/bin/python $HOME/.scripts/hypr/config.py
```
Se desejar integrar o script a um módulo da Waybar, use o arquivo `launcher.sh` deste repositório:
https://github.com/SobDex/hypr/blob/main/launcher.sh

## Tema da Aplicação
O aplicativo foi desenvolvido no tema Arc-Dark do pacote `arc-gtk-theme`, caso deseje trocar de tema, por enquanto o uso do `sed` é a melhor opção. Veja abaixo um exemplo para mudar do tema Arc-Dark para o tema Adwaita-dark:

```
sed -i "s/#2f343f/#1e1e1e/g" ~/.scripts/hypr/config.ui \
&& sed -i "s/#383c4a/#242424/g" ~/.scripts/hypr/config.ui \
&& sed -i "s/#404552/#303030/g" ~/.scripts/hypr/config.ui \
&& sed -i "s/#505567/#383838/g" ~/.scripts/hypr/config.ui \
&& sed -i "s/#2d303b/#101010/g" ~/.scripts/hypr/config.ui \
&& sed -i "s/#383c4a/#303030/g" ~/.scripts/hypr/config.py \
&& sed -i "s/#556077/#505050/g" ~/.scripts/hypr/config.py
```
Se quiser usar um tema claro, mude a cor da fonte:
```
sed -i "s/#fff/#000/g" ~/.scripts/hypr/config.ui
```
Faça um backup dos arquivos `~/.scripts/hypr/config.py` e `~/.scripts/hypr/config.ui` antes de executar os comandos `sed` se preferir.
