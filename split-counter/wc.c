/* Sample implementation of wc utility. */

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <ctype.h>

extern void counter (char *);

typedef unsigned long count_t;  /* Counter type */

count_t wcount;

/* Totals counter: words */
count_t total_wcount = 0;

/* Output counters for given file */
void
report (char *file, count_t wcount)
{
  printf ("%6lu %s\n", wcount, file);
}

/* Return true if C is a valid word constituent */
static int
isword (unsigned char c)
{
  return isalpha (c);
}


/* Get next word from the input stream. Return 0 on end
   of file or error condition. Return 1 otherwise. */
int
getword (FILE *fp)
{
  int c;
  int word = 0;
  
  if (feof (fp))
    return 0;
      
  while ((c = getc (fp)) != EOF)
    {
      if (isword (c))
        {
          wcount++;
          break;
        }
    }

  for (; c != EOF; c = getc (fp))
    {
      if (!isword (c))
        break;
    }

  return c != EOF;
}
      

  
int
main (int argc, char **argv)
{
  int i;
  
  if (argc < 2) {
    printf ("usage: wc FILE [FILE...]");
    return -1;
  }
    
  for (i = 1; i < argc; i++)
    counter (argv[i]);
  
  if (argc > 2)
    report ("total", total_wcount);
  return 0;
}
