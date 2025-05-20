#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h> // Para crear y verificar directorios

#ifdef _WIN32
    #include <direct.h>   // Para crear directorios en Windows
    #define MKDIR(path) _mkdir(path)
#else
    #include <unistd.h>
    #define MKDIR(path) mkdir(path, 0777)
#endif

// Definición de constantes
const char* CSV_EXTENSION = ".csv";
const char* PK_EXTENSION = "_pk.csv";
#define MAX_PATH 256
#define MAX_NOMBRE 50
#define MAX_ATRIBUTOS 10
#define MAX_VALOR 100
#define DELIMITADOR ","

// Función para obtener la ruta del escritorio
char* obtenerEscritorio() {
    char* escritorio = (char*)malloc(MAX_PATH * sizeof(char));
    if (escritorio == NULL) {
        perror("Error al asignar memoria");
        return NULL;
    }
    #ifdef _WIN32
        strcpy(escritorio, getenv("USERPROFILE"));
        strcat(escritorio, "\\Desktop\\");
    #else
        strcpy(escritorio, getenv("HOME"));
        strcat(escritorio, "/Escritorio/");
    #endif
    return escritorio;
}

// Función para crear una base de datos (carpeta en el escritorio)
int crearBaseDeDatos(const char* nombreDb) {
    char* rutaDb = obtenerEscritorio();
    if (rutaDb == NULL) return 0;
    char pathCompleto[MAX_PATH];
    snprintf(pathCompleto, MAX_PATH, "%s%s", rutaDb, nombreDb);
    free(rutaDb);

    struct stat st;
    if (stat(pathCompleto, &st) == 0 && S_ISDIR(st.st_mode)) {
        printf("La base de datos '%s' ya existe en el escritorio.\n", nombreDb);
        return 0; // Indica que ya existe
    }
    if (MKDIR(pathCompleto) == 0) {
        printf("Base de datos '%s' creada exitosamente en el escritorio.\n", nombreDb);
        return 1; // Indica éxito
    } else {
        perror("Error al crear la base de datos");
        return 0; // Indica error
    }
}

// Función para eliminar una base de datos (carpeta en el escritorio)
int eliminarBaseDeDatos(const char* nombreDb) {
    char* rutaDb = obtenerEscritorio();
    if (rutaDb == NULL) return 0;
    char pathCompleto[MAX_PATH];
    snprintf(pathCompleto, MAX_PATH, "%s%s", rutaDb, nombreDb);
    free(rutaDb);

    struct stat st;
    if (stat(pathCompleto, &st) != 0 || !S_ISDIR(st.st_mode)) {
        printf("La base de datos '%s' no existe en el escritorio.\n", nombreDb);
        return 0; // Indica que no existe
    }
    char comando[MAX_PATH + 20];
    #ifdef _WIN32
        snprintf(comando, sizeof(comando), "rmdir /s /q \"%s\"", pathCompleto);
    #else
        snprintf(comando, sizeof(comando), "rm -rf \"%s\"", pathCompleto);
    #endif
    if (system(comando) == 0) {
        printf("Base de datos '%s' eliminada exitosamente del escritorio.\n", nombreDb);
        return 1; // Indica éxito
    } else {
        perror("Error al eliminar la base de datos");
        return 0; // Indica error
    }
}

// Función para crear una tabla (archivo .csv) y un archivo para la llave primaria
int crearTabla(const char* nombreDb, const char* nombreTabla, char (*atributos)[MAX_NOMBRE], int* esPrimaryKey, int numAtributos) {
    char* rutaDb = obtenerEscritorio();
    if (rutaDb == NULL) return 0;
    char rutaTablaCompleta[MAX_PATH];
    char rutaPkCompleta[MAX_PATH];
    snprintf(rutaTablaCompleta, MAX_PATH, "%s%s/%s%s", rutaDb, nombreDb, nombreTabla, CSV_EXTENSION);
    snprintf(rutaPkCompleta, MAX_PATH, "%s%s/%s%s", rutaDb, nombreDb, nombreTabla, PK_EXTENSION);
    free(rutaDb);

    FILE* archivoTablaExistente = fopen(rutaTablaCompleta, "r");
    if (archivoTablaExistente != NULL) {
        printf("La tabla '%s' ya existe en la base de datos '%s'.\n", nombreTabla, nombreDb);
        fclose(archivoTablaExistente);
        return 0; // Indica que ya existe
    }

    FILE* archivoTabla = fopen(rutaTablaCompleta, "w");
    FILE* archivoPk = fopen(rutaPkCompleta, "w");

    if (archivoTabla != NULL) {
        int i;
        for (i = 0; i < numAtributos; ++i) {
            fprintf(archivoTabla, "%s", (*(atributos + i)));
            if (i < numAtributos - 1) {
                fprintf(archivoTabla, "%s", DELIMITADOR);
            }
            if (esPrimaryKey != NULL && esPrimaryKey[i] != 0) {
                fprintf(archivoPk, "%s\n", (*(atributos + i)));
            }
        }
        fprintf(archivoTabla, "\n");
        fclose(archivoTabla);
        fclose(archivoPk);
        printf("Tabla '%s' creada exitosamente en la base de datos '%s'.\n", nombreTabla, nombreDb);
        return 1; // Indica éxito
    } else {
        perror("Error al crear la tabla");
        if (archivoPk != NULL) fclose(archivoPk);
        return 0; // Indica error
    }
}

// Función para eliminar una tabla (elimina ambos archivos: datos y llave primaria)
int eliminarTabla(const char* nombreDb, const char* nombreTabla) {
    char* rutaDb = obtenerEscritorio();
    if (rutaDb == NULL) return 0;
    char rutaTablaCompleta[MAX_PATH];
    char rutaPkCompleta[MAX_PATH];
    snprintf(rutaTablaCompleta, MAX_PATH, "%s%s/%s%s", rutaDb, nombreDb, nombreTabla, CSV_EXTENSION);
    snprintf(rutaPkCompleta, MAX_PATH, "%s%s/%s%s", rutaDb, nombreDb, nombreTabla, PK_EXTENSION);
    free(rutaDb);

    int resultadoTabla = remove(rutaTablaCompleta);
    int resultadoPk = remove(rutaPkCompleta);

    if (resultadoTabla == 0 && resultadoPk == 0) {
        printf("Tabla '%s' eliminada exitosamente.\n", nombreTabla);
        return 1;
    } else {
        perror("Error al eliminar la tabla");
        return 0;
    }
}

// Función para insertar una fila en una tabla
int insertarFila(const char* nombreDb, const char* nombreTabla, char valores[MAX_ATRIBUTOS][MAX_VALOR], int numValores) {
    char* rutaDb = obtenerEscritorio();
    if (rutaDb == NULL) return 0;
    char rutaTablaCompleta[MAX_PATH];
    snprintf(rutaTablaCompleta, MAX_PATH, "%s%s/%s%s", rutaDb, nombreDb, nombreTabla, CSV_EXTENSION);
    free(rutaDb);

    FILE* archivo = fopen(rutaTablaCompleta, "a"); // Abre en modo de anexado
    if (archivo != NULL) {
        int i;
        for (i = 0; i < numValores; ++i) {
            fprintf(archivo, "%s", valores[i]);
            if (i < numValores - 1) {
                fprintf(archivo, "%s", DELIMITADOR);
            }
        }
        fprintf(archivo, "\n");
        fclose(archivo);
        printf("Fila insertada exitosamente en la tabla '%s'.\n", nombreTabla);
        return 1; // Indica éxito
    } else {
        perror("Error al abrir la tabla para inserción");
        return 0; // Indica error
    }
}

// Función para leer el contenido de una tabla
void leerTabla(const char* nombreDb, const char* nombreTabla) {
    char* rutaDb = obtenerEscritorio();
    if (rutaDb == NULL) return;
    char rutaTablaCompleta[MAX_PATH];
    snprintf(rutaTablaCompleta, MAX_PATH, "%s%s/%s%s", rutaDb, nombreDb, nombreTabla, CSV_EXTENSION);
    free(rutaDb);

    FILE* archivo = fopen(rutaTablaCompleta, "r");
    if (archivo != NULL) {
        printf("\nContenido de la tabla '%s':\n", nombreTabla);
        char linea[MAX_PATH * 2]; // Asumiendo una línea no muy larga
        while (fgets(linea, sizeof(linea), archivo) != NULL) {
            printf("%s", linea);
        }
        fclose(archivo);
    } else {
        perror("Error al abrir la tabla para lectura");
    }
}

// Función para realizar un JOIN básico (solo para demostración)
void realizarJoin(const char* nombreDb, const char* tabla1, const char* columna1, const char* tabla2, const char* columna2) {
    char* rutaDb = obtenerEscritorio();
    if (rutaDb == NULL) return;
    char rutaTabla1Completa[MAX_PATH];
    char rutaTabla2Completa[MAX_PATH];
    snprintf(rutaTabla1Completa, MAX_PATH, "%s%s/%s%s", rutaDb, nombreDb, tabla1, CSV_EXTENSION);
    snprintf(rutaTabla2Completa, MAX_PATH, "%s%s/%s%s", rutaDb, nombreDb, tabla2, CSV_EXTENSION);
    free(rutaDb);

    FILE* archivo1 = fopen(rutaTabla1Completa, "r");
    FILE* archivo2 = fopen(rutaTabla2Completa, "r");

    if (archivo1 == NULL || archivo2 == NULL) {
        perror("Error al abrir los archivos para el JOIN");
        if (archivo1) fclose(archivo1);
        if (archivo2) fclose(archivo2);
        return;
    }

    printf("\n--- Resultado del JOIN entre '%s' y '%s' ---:\n", tabla1, tabla2);

    char linea1[MAX_PATH * 2];
    char linea2[MAX_PATH * 2];
    char *token1, *token2;
    char *valores1[MAX_ATRIBUTOS];
    char *valores2[MAX_ATRIBUTOS];
    int indiceColumna1 = -1;
    int indiceColumna2 = -1;
    int numCols1 = 0;
    int numCols2 = 0;
    int i, j;

    // Leer encabezado de la tabla 1
    if (fgets(linea1, sizeof(linea1), archivo1) != NULL) {
        char *encabezado1 = strdup(linea1);
        token1 = strtok(encabezado1, DELIMITADOR);
        while (token1 != NULL && numCols1 < MAX_ATRIBUTOS) {
            if (strstr(token1, columna1) != NULL) {
                indiceColumna1 = numCols1;
            }
            printf("%s ", token1);
            valores1[numCols1++] = strdup(token1);
            token1 = strtok(NULL, DELIMITADOR);
        }
        printf(",");
        free(encabezado1);
    }

    // Leer encabezado de la tabla 2
    if (fgets(linea2, sizeof(linea2), archivo2) != NULL) {
        char *encabezado2 = strdup(linea2);
        token2 = strtok(encabezado2, DELIMITADOR);
        while (token2 != NULL && numCols2 < MAX_ATRIBUTOS) {
            if (strstr(token2, columna2) != NULL) {
                indiceColumna2 = numCols2;
            }
            // Evitar imprimir la columna de join de la segunda tabla nuevamente
            int imprimir = 1;
            for(i=0; i<numCols1; i++){
                if(strcmp(valores2[numCols2], valores1[i]) == 0){
                    imprimir = 0;
                    break;
                }
            }
            if(imprimir) printf("%s ", token2);
            valores2[numCols2++] = strdup(token2);
            token2 = strtok(NULL, DELIMITADOR);
        }
        printf("\n");
        free(encabezado2);
    }

    if (indiceColumna1 == -1 || indiceColumna2 == -1) {
        printf("Error: Una o ambas columnas de JOIN no encontradas.\n");
        fclose(archivo1);
        fclose(archivo2);
        return;
    }

    rewind(archivo1); // Volver al inicio para leer los datos
    rewind(archivo2); // Volver al inicio para leer los datos
    fgets(linea1, sizeof(linea1), archivo1); // Saltar encabezado tabla 1
    fgets(linea2, sizeof(linea2), archivo2); // Saltar encabezado tabla 2

    while (fgets(linea1, sizeof(linea1), archivo1) != NULL) {
        char *fila1 = strdup(linea1);
        char *valorJoin1 = NULL;
        token1 = strtok(fila1, DELIMITADOR);
        for (i = 0; i <= indiceColumna1 && token1 != NULL; i++) {
            if (i == indiceColumna1) {
                valorJoin1 = strdup(token1);
            }
            token1 = strtok(NULL, DELIMITADOR);
        }

        rewind(archivo2);
        fgets(linea2, sizeof(linea2), archivo2); // Saltar encabezado tabla 2

        while (fgets(linea2, sizeof(linea2), archivo2) != NULL) {
            char *fila2 = strdup(linea2);
            char *valorJoin2 = NULL;
            token2 = strtok(fila2, DELIMITADOR);
            for (j = 0; j <= indiceColumna2 && token2 != NULL; j++) {
                if (j == indiceColumna2) {
                    valorJoin2 = strdup(token2);
                }
                token2 = strtok(NULL, DELIMITADOR);
            }

            if (valorJoin1 != NULL && valorJoin2 != NULL && strcmp(valorJoin1, valorJoin2) == 0) {
                printf("%s", fila1);
                char *temp_linea2 = strdup(linea2);
                char *token_temp2 = strtok(temp_linea2, DELIMITADOR);
                int k = 0;
                while(token_temp2 != NULL){
                    if(k != indiceColumna2){
                        printf("%s%s", (k > 0 || numCols1 > 0) ? DELIMITADOR : "", token_temp2);
                    }
                    token_temp2 = strtok(NULL, DELIMITADOR);
                    k++;
                }
                printf("\n");
                free(valorJoin2);
            }
            if(valorJoin2) free(valorJoin2);
            free(fila2);
        }
        if(valorJoin1) free(valorJoin1);
        free(fila1);
    }

    fclose(archivo1);
    fclose(archivo2);
    for(i=0; i<numCols1; i++) if(valores1[i]) free(valores1[i]);
    for(i=0; i<numCols2; i++) if(valores2[i]) free(valores2[i]);
}

int main() {
    int opcion;
    char nombreDb[MAX_NOMBRE];
    char nombreTabla[MAX_NOMBRE];
    char atributos[MAX_ATRIBUTOS][MAX_NOMBRE];
    int esPrimaryKey[MAX_ATRIBUTOS] = {0}; // Inicializar con ceros
    char valores[MAX_ATRIBUTOS][MAX_VALOR];
    int numAtributos, numValores, i;

    do {
        printf("\n----- Menu Gestor de Base de Datos -----");
        printf("\n1. Crear Base de Datos");
        printf("\n2. Eliminar Base de Datos");
        printf("\n3. Crear Tabla");
        printf("\n4. Eliminar Tabla");
        printf("\n5. Insertar Fila en Tabla");
        printf("\n6. Leer Contenido de Tabla");
        printf("\n7. Realizar JOIN");
        printf("\n0. Salir");
        printf("\nSeleccione una opcion: ");
        scanf("%d", &opcion);
        getchar(); // Limpiar el buffer del newline

        switch (opcion) {
            case 1: // Crear Base de Datos
                printf("Ingrese el nombre para la nueva base de datos: ");
                fgets(nombreDb, MAX_NOMBRE, stdin);
                nombreDb[strcspn(nombreDb, "\n")] = 0; // Eliminar newline
                crearBaseDeDatos(nombreDb);
                break;
            case 2: // Eliminar Base de Datos
                printf("Ingrese el nombre de la base de datos a eliminar: ");
                fgets(nombreDb, MAX_NOMBRE, stdin);
                nombreDb[strcspn(nombreDb, "\n")] = 0; // Eliminar newline
                eliminarBaseDeDatos(nombreDb);
                break;
            case 3: // Crear Tabla con archivo para llave primaria
                printf("Ingrese el nombre de la base de datos donde crear la tabla: ");
                fgets(nombreDb, MAX_NOMBRE, stdin);
                nombreDb[strcspn(nombreDb, "\n")] = 0; // Eliminar newline
                printf("Ingrese el nombre para la nueva tabla: ");
                fgets(nombreTabla, MAX_NOMBRE, stdin);
                nombreTabla[strcspn(nombreTabla, "\n")] = 0; // Eliminar newline
                printf("Ingrese el numero de atributos para la tabla: ");
                scanf("%d", &numAtributos);
                getchar(); // Limpiar el buffer del newline
                if (numAtributos > 0 && numAtributos <= MAX_ATRIBUTOS) {
                    printf("Ingrese la informacion de los atributos:\n");
                    for (i = 0; i < numAtributos; i++) {
                        printf("  Atributo %d:\n", i + 1);
                        printf("    Nombre: ");
                        fgets(atributos[i], MAX_NOMBRE, stdin);
                        atributos[i][strcspn(atributos[i], "\n")] = 0; // Eliminar newline
                        printf("    ¿Es llave primaria? (1: Sí, 0: No): ");
                        scanf("%d", &esPrimaryKey[i]);
                        getchar(); // Limpiar el buffer
                    }
                    crearTabla(nombreDb, nombreTabla, atributos, esPrimaryKey, numAtributos);
                } else {
                    printf("Numero de atributos invalido.\n");
                }
                break;
            case 4: // Eliminar Tabla
                printf("Ingrese el nombre de la base de datos donde se encuentra la tabla: ");
                fgets(nombreDb, MAX_NOMBRE, stdin);
                nombreDb[strcspn(nombreDb, "\n")] = 0; // Eliminar newline
                printf("Ingrese el nombre de la tabla a eliminar: ");
                fgets(nombreTabla, MAX_NOMBRE, stdin);
                nombreTabla[strcspn(nombreTabla, "\n")] = 0; // Eliminar newline
                eliminarTabla(nombreDb, nombreTabla);
                break;
            case 5: // Insertar Fila en Tabla
                printf("Ingrese el nombre de la base de datos donde se encuentra la tabla: ");
                fgets(nombreDb, MAX_NOMBRE, stdin);
                nombreDb[strcspn(nombreDb, "\n")] = 0; // Eliminar newline
                printf("Ingrese el nombre de la tabla donde insertar la fila: ");
                fgets(nombreTabla, MAX_NOMBRE, stdin);
                nombreTabla[strcspn(nombreTabla, "\n")] = 0; // Eliminar newline
                printf("Ingrese el numero de valores para la fila: ");
                scanf("%d", &numValores);
                getchar(); // Limpiar el buffer del newline
                if (numValores > 0 && numValores <= MAX_ATRIBUTOS) {
                    printf("Ingrese los valores para la fila:\n");
                    for (i = 0; i < numValores; i++) {
                        printf("  Valor %d: ", i + 1);
                        fgets(valores[i], MAX_VALOR, stdin);
                        valores[i][strcspn(valores[i], "\n")] = 0; // Eliminar newline
                    }
                    insertarFila(nombreDb, nombreTabla, valores, numValores);
                } else {
                    printf("Numero de valores invalido.\n");
                }
                break;
            case 6: // Leer Contenido de Tabla
                printf("Ingrese el nombre de la base de datos donde se encuentra la tabla: ");
                fgets(nombreDb, MAX_NOMBRE, stdin);
                nombreDb[strcspn(nombreDb, "\n")] = 0; // Eliminar newline
                printf("Ingrese el nombre de la tabla a leer: ");
                fgets(nombreTabla, MAX_NOMBRE, stdin);
                nombreTabla[strcspn(nombreTabla, "\n")] = 0; // Eliminar newline
                leerTabla(nombreDb, nombreTabla);
                break;
            case 7: // Realizar JOIN entre dos tablas
                {
                    char tabla1[MAX_NOMBRE], columna1[MAX_NOMBRE];
                    char tabla2[MAX_NOMBRE], columna2[MAX_NOMBRE];
                    printf("Ingrese el nombre de la base de datos donde se encuentran las tablas: ");
                    fgets(nombreDb, MAX_NOMBRE, stdin);
                    nombreDb[strcspn(nombreDb, "\n")] = 0; // Eliminar newline
                    printf("Ingrese el nombre de la primera tabla: ");
                    fgets(tabla1, MAX_NOMBRE, stdin);
                    tabla1[strcspn(tabla1, "\n")] = 0; // Eliminar newline
                    printf("Ingrese el nombre de la columna para realizar el JOIN en la primera tabla: ");
                    fgets(columna1, MAX_NOMBRE, stdin);
                    columna1[strcspn(columna1, "\n")] = 0; // Eliminar newline
                    printf("Ingrese el nombre de la segunda tabla: ");
                    fgets(tabla2, MAX_NOMBRE, stdin);
                    tabla2[strcspn(tabla2, "\n")] = 0; // Eliminar newline
                    printf("Ingrese el nombre de la columna para realizar el JOIN en la segunda tabla: ");
                    fgets(columna2, MAX_NOMBRE, stdin);
                    columna2[strcspn(columna2, "\n")] = 0; // Eliminar newline
                    realizarJoin(nombreDb, tabla1, columna1, tabla2, columna2);
                }
                break;
            case 0:
                printf("Saliendo del programa...\n");
                break;
            default:
                printf("Opción inválida. Intente nuevamente.\n");
        }
    } while (opcion != 0);

    return 0;
}

