/*H**********************************************************************
* FILENAME : sh-creator.c       sh-creatpr.c             DESIGN REF: 00003
*
* DESCRIPTION :
*      Bash Script automator tester. 
*
* PUBLIC FUNCTIONS :
*       
*       
*
* NOTES :
*       These functions are a part of the CPA Deliverable suite;
*       See github for more documentation.
*       https://github.com/daibeal/CPAentregable
*       Copyright A.N.Other Co. 2021, 2022.  All rights reserved.
* 
* AUTHOR :    Dairon Andrés Benites Aldaz       START DATE :    Sat Nov 27 01:06:52 CET 2021
*                                               LAST UPDATE :   Sat Nov 27 13:25:26 CET 2021
* CHANGES :
*
* REF NO  VERSION DATE    WHO           DETAIL
* F21/01  A.1.0 27Nov21 @daibeal      Creation of file
* F21/02  A.1.1 27Nov21 @daibeal      Added comments
* F21/03  A.1.2 27Nov21 @daibeal      Kahan Integration
*
*   This program is free software you can redistribute it and/or modify
*	it under the terms of the GNU General Public License as published by
*	the Free Software Foundation either version 2 of the License, or
*	(at your option) any later version.
*
*	This program is distributed in the hope that it will be useful,
*	but WITHOUT ANY WARRANTY without even the implied warranty of
*	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*	GNU General Public License for more details.
*
*	You should have received a copy of the GNU General Public License
*	along with this program if not, write to the Free Software
*	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
*
*H*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "addF.h"
#include "headerFile.h"



void launch(char *result)
{
    FILE *fp;
    fp = fopen("load-work.sh", "w");
    int n = 2000;
    for (int i = 0; i < n + 1; i++)
    {
        fputc(result[i], fp);
    }
    fclose(fp);
    system("sbatch load-work.sh");
    printf("Work sent succesfully!\n");
    system("ls | grep '^slurm' ");
}

void getStringFromUser(char *msg, char *str, int size)
{
    printf("%s", msg);
    char *aux;
    aux = (char *)malloc(sizeof(char) * size);
    fgets(aux, size, stdin);
    aux[strlen(aux) - 1] = '\0';
    strcpy(str, aux);
    free(aux);
}




int main(int argc, char *argv[])
{
    printHeader();
    printf("Enter origin directory: ");
    char origin[100];
    scanf("%s", origin);
    // Copy files from Local Drive
    printf("\nCopying files from Local Drive...\n");

    //Origin directory
    char *str = concatenate("cp  -r ", origin, " .");
    printf("%s\n", str);
    //system(str);
    free(str);

    printf("Files copied successfully!\n");

    //Enter name of executable

    char executable_name[26];
    printf("\nEnter the name of the executable: ");
    scanf("%19s", executable_name);
    char *exect = concatenate("./", executable_name, " ");
    char *exect2 = concatenate(exect, "-i peque.ppm -o peque_out.ppm -b 8", " ");
    //Bash script
    char *bash_script_header = "#!/bin/sh\n#PBS -l nodes=1,walltime=00:05:00\n#PBS -q cpa\n#PBS -d .\n#PBS -o time-log.txt\n\nOMP_NUM_THREADS=1 ./object-executable \nOMP_NUM_THREADS=2 ./object-executable\nOMP_NUM_THREADS=4 ./object-executable\nOMP_NUM_THREADS=8 ./object-executable\nOMP_NUM_THREADS=16 ./object-executable\nOMP_NUM_THREADS=32 ./object-executable\n";
    char *result = replaceWord(bash_script_header, "./object-executable", exect2);

    printf("\nCreating bash script...\n");
    printf("\n%s", result);
    printf("Bash script created successfully!\n");
   
    printf("Do you want to launch to KAHAN? (Y/N)");
     char answer[100];
    scanf("%s", answer);
    if (answer[0] == 'Y' || answer[0] == 'y')
    {
        printf("\nLaunching to KAHAN...\n");
        launch(result);
    }
    else
    {
        printf("\nExiting...\n");
    }
    
    printf("\nDeleting used files...");
    system("rm load-work.sh");
    printf("\nFiles deleted successfully!\n");
    system("date");

    return 0;
}

