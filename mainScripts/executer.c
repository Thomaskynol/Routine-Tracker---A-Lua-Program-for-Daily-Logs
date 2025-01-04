#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <direct.h>
#include <windows.h>

int main() {
    char caminhoAtual[FILENAME_MAX];
    char comando[1024];

    SetConsoleTitle("Thomas Logs");

    _getcwd(caminhoAtual, sizeof(caminhoAtual));
    strcat(caminhoAtual, "\\mainScripts");
    _chdir(caminhoAtual);

    snprintf(comando, sizeof(comando), "lua main.lua");

    int retorno = system(comando);

    return 0;
}
