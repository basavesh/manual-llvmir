#include <stdio.h>

typedef unsigned long count_t;

extern count_t wcount;
extern count_t total_wcount;

extern int getword(FILE *fp);
extern void report (char *, count_t);

/* Process file FILE. */
void
counter (char *file)
{
  FILE *fp = fopen (file, "r");
  
  if (!fp) {
    printf("cannot open file `%s'\n", file);
    return;
  }

  wcount = 0;
  while (getword (fp))
    ;
  fclose (fp);

  report (file, wcount);
  total_wcount += wcount;
}