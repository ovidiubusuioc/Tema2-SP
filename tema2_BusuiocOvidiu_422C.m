D=1;
m=1/7;
t=-80:0.1:80;
P=40;
c=1;
s=zeros(1,length(t));
w0=2*pi/P;

j=0;

for i=40:0.1:120
    j=j+1;
    c=floor(i/P);
    i=i-c*P;
    
    if(j==1)
        s(1,j+800)=m*(t(j+800));
    else if (i<=7)
            s(1,j+800)=1;
        else if (i>=7)
                s(1,j+800)=0;
            end
        end
    end
end

j=0;

for i=40:0.1:120
    j=j+1;
    c=floor(i/P);
    i=i-c*P;
    
    if(j==1)
        s(1,j)=m*(t(j+800));
    else if (i<=7)
            s(1,j)=1;
        else if (i>=7)
                s(1,j)=0;
            end
        end
    end
end


N=50;

p=-9:1:9;

Ak=zeros(length(2*p));
Ak(10)=0.5;

for k=1:2:9
       Ak(k+10)=2*abs(1/(k*pi)*sin(k*pi*7/40));
        Ak(10-k)=Ak(k+10);
end

r=linspace(-80,80,161);
f=0*r;

for k=-N:1:N
    
   if (k==0)
       continue;
   end
   
   C_k=1/(k*pi)*sin(k*pi*7/40);

   f_k=C_k*exp(1j*k*w0*r);
   f=f+f_k;
   
    
end





figure (1)

stem(p,Ak),grid;

figure (2SP)

plot(r,f),grid;


%%
%In conformitate cu cursul de SS un semnal se poate descompune intr-o suma
%de sinusuri si cosinusuri. Aces tfapt este realizat prin intermediul
%seriilor Fourier. Ecuatia ce decrie o ramura ascendenta sau descendenta a
%unui semnal triunghiular poate fi usor descris cu ajutorul functiilor
%sinus si cosinus pe cand varfurile semnalului triunghiular ( inclusiv
%colturile de la nivelul de semnal 0) necesita un numar mai mare de
%componente spectrale intrucat un sinus sau un cosinus devine atat de
%ascutit doar la frecvente foarte inalte, ce sunt corespunzatoare unor
%componente spectrale de ordin ridicat. Pentru un semnal dreptunghiular,
%datorita pantelor extrem de abrupte, semnalele sinusoidate ce definesc
%aceste pante nu au timp sa se redreseze pentru zona pe palier aparand
%astfel niste spik-uri.