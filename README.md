# Dependências

Este projeto utiliza Assembly x86-64 no Linux/WSL.

## Instalação

No Ubuntu ou WSL, execute:

```bash
sudo apt update
sudo apt install -y git nasm binutils gdb build-essential
```

Esse comando instala:

- `nasm`: assembler para arquivos `.asm`
- `binutils`: fornece `ld`, `as`, `objdump` e `readelf`
- `gdb`: debugger
- `build-essential`: GCC, G++, Make e ferramentas de compilação
- `git`: controle de versão

## Verificar a instalação

```bash
nasm --version
gcc --version
gdb --version
ld --version
make --version
```

## Clonar o projeto

```bash
git clone https://github.com/diasgarcia/programacao-em-baixo-nivel.git
cd programacao-em-baixo-nivel
```

## Compilar um arquivo NASM

```bash
nasm -f elf64 -g -F dwarf arquivo.asm -o arquivo.o
ld arquivo.o -o programa
./programa
```

## Depurar

```bash
gdb ./programa
```
