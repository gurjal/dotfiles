#include <sys/stat.h>
#include <stdio.h>

int main(void)
{
    struct stat stats;

    if (!stat("/", &stats))
    {
        printf("%u\n", stats.st_blksize);
    }
}
