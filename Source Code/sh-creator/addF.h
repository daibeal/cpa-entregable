 #ifndef ADDF
 #define ADDF
 
// C program to search and replace
// all occurrences of a word with
// other word.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *concatenate(char *a,  char *b,  char *c) {
    int size = strlen(a) + strlen(b) + strlen(c) + 1;
    char *str = malloc(size);
    strcpy (str, a);
    strcat (str, b);
    strcat (str, c); 

    return str;
}

int getIntFromUser(char *message)
{
    int number;
    printf("%s", message);
    scanf("%d", &number);
    return number;
}


// Function to replace a string with another
// string


char* replaceWord(const char* s, const char* oldW,
				const char* newW)
{
	char* result;
	int i, cnt = 0;
	int newWlen = strlen(newW);
	int oldWlen = strlen(oldW);

	// Counting the number of times old word
	// occur in the string
	for (i = 0; s[i] != '\0'; i++) {
		if (strstr(&s[i], oldW) == &s[i]) {
			cnt++;

			// Jumping to index after the old word.
			i += oldWlen - 1;
		}
	}

	// Making new string of enough length
	result = (char*)malloc(i + cnt * (newWlen - oldWlen) + 1);

	i = 0;
	while (*s) {
		// compare the substring with the result
		if (strstr(s, oldW) == s) {
			strcpy(&result[i], newW);
			i += newWlen;
			s += oldWlen;
		}
		else
			result[i++] = *s++;
	}

	result[i] = '\0';
	return result;
}

#endif 


