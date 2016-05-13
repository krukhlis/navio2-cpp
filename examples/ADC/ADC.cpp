#include <unistd.h>
#include <cstdio>
#include <stdlib.h>

#include "Util.h"
#include "ADC.h"


int main(int argc, char *argv[])
{
    ADC adc;
    adc.init();
    float *results;

    results = (float *) malloc(sizeof(float) * adc.get_channel_count());

    if (check_apm()) {
        return 1;
    }

    while (true) {
        for (int i = 0; i < ARRAY_SIZE(results); i++){
            results[i] = adc.read(i);
            printf("A%d: %.4fV ", i, results[i] / 1000);
        }
        printf("\n");

        usleep(500000);
    }

    return 0;
}
