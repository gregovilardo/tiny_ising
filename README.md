Lo raro es que en mi maquina mejora un 40% mientras que en atom un 20% 

Mejor flag para gcc
 CC="gcc" CFLAGS="-DL=1024 -g -mavx2 -O3 -ffast-math -flto -march=native --save-temps" make --always-make

Con el poco tiempo que tuve puedo ver que las flags en intel cambian mucho el
resultado... todavia no encuentro la mejor

Ya estoy muy quemado para probar la mejor combinacion de flags..
TODO: Usar AVX512




