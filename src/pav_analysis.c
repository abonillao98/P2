#include <math.h>
#include "pav_analysis.h"

float compute_power(const float *x, unsigned int N) {
    float resultado = 0;
    for(int i=0;i<N;i++){
        resultado += x[i]*x[i];
    }
    return 10*log10(resultado/N);
}

float compute_am(const float *x, unsigned int N) {
    float resultado = 0;
    for(int i=0;i<N;i++){
        resultado += fabs(x[i]);
        return resultado/N;
    }
}

float compute_zcr(const float *x, unsigned int N, float fm) {
    int count =0;
    for(unsigned int i=1;i<N;i++){
        if(x[i]*x[i-1]<0){
            count++;
        }
    }
    return (fm/2.0)*(1.0/(N-1.0))*count;
}
