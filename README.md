CC="gcc" CFLAGS="-DL=1024 -g -mavx2 -O3 -ffast-math -flto -march=native --save-temps" make --always-make

CC="icx" CFLAGS="-DL=1024 -O3 -march=znver3 -mtune=znver3 -mavx2 -mfma -ffast-math -fomit-frame-pointer -ipo -qopenmp" make --always-make
Con esta flag llego a 80 spines/ms en atom

Con el poco tiempo que tuve puedo ver que las flags en intel cambian mucho el resultado...

Quizas para mejorar se podria evitar el gather y hacer que los spines de w y e queden continuos de alguna forma






