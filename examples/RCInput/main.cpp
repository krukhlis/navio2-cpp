#include <unistd.h>
#include <cstdio>

#include <navio2/RCInput.h>
#include "navio2/Util.h"

int main(int argc, char *argv[])
{
    RCInput rcin{};

    if (check_apm()) {
        return 1;
    }

    rcin.init();

    while (true)
    {
        int period = rcin.read(2);
        printf("%d\n", period);

        sleep(1);
    }

    return 0;
}
