A=[-1 0;1 -1];
B=[1 0];
C=[1 1];
A1=A';
B1=C';
C1=B';
P=[-6-j -6+j];
K=acker(A1,B1,P);
G=K'