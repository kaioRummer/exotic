
return(function(YI,Z8,i8,D8,QI,v8,P8,E8,V8,I8,r8,p8,R8,u8,X8,O8,n8,o8,b8,k8,f8,m8,sI,A8,L8,z8,w8,W8,a8,C8,x8,d8,zI,N8,GI,l8,aI,S8,JI,h8,FI,q8,J8,g8,e8,K8,M8,j8,U8,tI,c8,II,T8,ZI,y8,H8,B8,...)local g=(a8 or I8[J8]);local I,J,y=W8,h8[x8],(f8);local W=B8;local Q=(S8);local Z,a=E8,e8;local h,x,f,o,B=u8,N8,j8,T8,n8;local G=b8;local S=r8;local e=(C8);for XX=0,1 do if XX~=0 then else do e=(m8 and m8()or w8);end;end;end;local j,T,b=C8,C8,(C8);local N,Y8=1,0;local u=({});do repeat if not(Y8<=0)then if Y8~=1 then b=q8;do Y8=3;end;else Y8=2;end;else Y8=1;end;until Y8==3;end;local r,m,C=C8,C8,(C8);for g6=0,2 do if g6<=0 then b=y(Z(b,5),v8,function(MP)if a(MP,2)~=72 then local LH=I(Z8(MP,16));if not(r)then return LH;else local w7,M7=2,C8;while(L8)do if w7<=0 then return M7;else do if w7~=1 then M7=J(LH,r);w7=1;else r=C8;w7=0;end;end;end;end;end;else local k9=0;repeat if k9~=0 then return K8;else r=Z8(Z(MP,1,1));k9=1;end;until(d8);end;end);else if g6~=1 then C=function()local HP,sP,uP,WP,OP=2,C8,C8,C8,C8;repeat if not(HP<=0)then if HP~=1 then do sP,uP,WP,OP=a(b,N,N+3);end;HP=0;else return OP*P8+WP*65536+uP*c8+sP;end;else N=N+4;HP=1;end;until(d8);end;else m=function()local q2=(C8);local r2=(0);while(L8)do if not(r2<=0)then if r2~=1 then return q2;else N=N+1;r2=2;end;else do q2=a(b,N,N);end;r2=1;end;end;end;end;end;end;local w=(2147483648);Y8=1;local q,v,K,d,L=C8,C8,C8,C8,(C8);do while Y8<=5 do if not(Y8<=2)then if Y8<=3 then do v=2^52;end;do Y8=5;end;else if Y8~=4 then K=q-1;Y8=2;else do local md=(C8);local Ad=1;while Ad<=1 do if Ad~=0 then do md=2;end;Ad=0;else for EG=1,31 do for IE=0,1 do if IE~=0 then md=md*2;else d[EG]=md;end;end;end;Ad=2;end;end;end;Y8=0;end;end;else if not(Y8<=0)then if Y8~=1 then d={[0]=1};Y8=4;else q=4294967296;do Y8=3;end;end;else L=function(jl,Ll,bl)local Dl=0;local Xl=C8;while(L8)do do if not(Dl<=0)then do if Dl~=1 then Xl=Xl-Xl%1;Dl=1;else return Xl;end;end;else Xl=(bl/d[Ll])%d[jl];Dl=2;end;end;end;end;do Y8=6;end;end;end;end;end;local P=function()local qg,Ng,hg=0,C8,C8;repeat do if qg<=0 then Ng,hg=C(),C();qg=2;else do if qg~=1 then if not(hg>=w)then else hg=hg-q;end;qg=1;else return hg*q+Ng;end;end;end;end;until(d8);end;local c=(function()local rH,tH=C8,C8;local dH=(1);do while(L8)do if dH==0 then tH=C();break;else rH=C();dH=0;end;end;end;if not(rH==0 and tH==0)then else return 0;end;local hH=(-1)^L(1,31,tH);local sH=(L(11,20,tH));local bH=(L(20,0,tH)*q+rH);local AH=(1);if sH==0 then if bH~=0 then local ML=0;while(L8)do if ML~=0 then do AH=0;end;break;else sH=1;ML=1;end;end;else do return hH*0;end;end;elseif sH~=2047 then else if bH~=0 then do return hH*(1/0);end;else return hH*(0/0);end;end;return hH*(2^(sH-1023))*(bH/v+AH);end);local R,p={[0]={[0]=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},{[0]=1,0,3,2,5,4,7,6,9,8,11,10,13,12,15,14},{[0]=2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13},{[0]=3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12},{[0]=4,5,6,7,0,1,2,3,12,13,14,15,8,9,10,11},{[0]=5,4,7,6,1,0,3,2,13,12,15,14,9,8,11,10},{[0]=6,7,4,5,2,3,0,1,14,15,12,13,10,11,8,9},{[0]=7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8},{[0]=8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7},{[0]=9,8,11,10,13,12,15,14,1,0,3,2,5,4,7,6},{[0]=10,11,8,9,14,15,12,13,2,3,0,1,6,7,4,5},{[0]=11,10,9,8,15,14,13,12,3,2,1,0,7,6,5,4},{[0]=12,13,14,15,8,9,10,11,4,5,6,7,0,1,2,3},{[0]=13,12,15,14,9,8,11,10,5,4,7,6,1,0,3,2},{[0]=14,15,12,13,10,11,8,9,6,7,4,5,2,3,0,1},{[0]=15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0}},((R8 or p8));local D=p and p[D8]or function(yS,jS)local SS=(3);local DS,gS=C8,(C8);do while(L8)do if not(SS<=1)then do if SS~=2 then do yS=yS%q;end;SS=0;else gS=0;break;end;end;else if SS~=0 then do DS=1;end;do SS=2;end;else jS=jS%q;SS=1;end;end;end;end;SS=1;repeat if SS~=0 then while yS>0 and jS>0 do local uN,YN=C8,C8;local tN=(1);do while tN<=1 do if tN==0 then YN=jS%16;tN=2;else uN=yS%16;tN=0;end;end;end;do tN=2;end;repeat if not(tN<=1)then if tN~=2 then yS=(yS-uN)/16;tN=1;else gS=gS+R[uN][YN]*DS;tN=3;end;else if tN~=0 then do jS=(jS-YN)/16;end;tN=0;else DS=DS*16;tN=4;end;end;until tN==4;end;SS=0;else return gS+yS*DS+jS*DS;end;until(d8);end;local k=p and p[k8]or function(MQ,QQ)local mQ=(2);do repeat if not(mQ<=0)then if mQ~=1 then MQ=MQ%q;mQ=1;else do QQ=QQ%q;end;mQ=0;end;else return((MQ+QQ)-D(MQ,QQ))/2;end;until(d8);end;end;local O=p and p[O8]or function(Zj,Xj)local vj=(2);repeat do if not(vj<=0)then if vj==1 then return K-k(K-Zj,K-Xj);else Zj=Zj%q;vj=0;end;else Xj=Xj%q;vj=1;end;end;until(d8);end;local X,M=p and p[A8],(p and p[X8]);local A=p and p[M8]or function(Zf)return K-(Zf%q);end;X=X or function(Vg,Ug)if Ug>=32 then do return 0;end;end;if not(Ug<0)then else return M(Vg,-Ug);end;do return(Vg*d[Ug])%q;end;end;do M=M or function(Eo,Qo)local Fo=C8;local yo=2;do while(L8)do if not(yo<=1)then do if yo==2 then if not(Qo>=32)then else return 0;end;yo=0;else Fo=(Eo%q/d[Qo]);yo=1;end;end;else do if yo~=0 then do return Fo-Fo%1;end;else if not(Qo<0)then else return X(Eo,-Qo);end;yo=3;end;end;end;end;end;end;end;do Y8=0;end;local l,H=C8,C8;while Y8<=1 do if Y8~=0 then H=function(ke)local we,Be=C8,C8;for rq=0,4 do if not(rq<=1)then if not(rq<=2)then do if rq~=3 then do return Be;end;else do N=N+we;end;end;end;else for Fd=1,we,7997 do local ld=(Fd+7997-1);if not(ld>we)then else ld=we;end;local Kd,Td=2,(C8);while Kd<3 do do if not(Kd<=0)then if Kd~=1 then Td={a(b,N+Fd-1,N+ld-1)};Kd=1;else do for OH=1,#Td do local LH=(0);while LH<=1 do if LH~=0 then j=(ke*j+131)%256;do LH=2;end;else Td[OH]=D(Td[OH],j);LH=1;end;end;end;end;Kd=0;end;else do Be=Be..I(g(Td));end;Kd=3;end;end;end;end;end;else if rq==0 then we=C();else Be=K8;end;end;end;end;Y8=2;else l=function(L_)local f_,r_=C8,(C8);do for zC=0,1 do do if zC~=0 then do r_=D(f_[1],T);end;else f_={a(b,N,N+3)};end;end;end;end;local F_=D(f_[2],T);local m_=(D(f_[3],T));local B_=(D(f_[4],T));T=(49*T+L_)%256;N=N+4;return B_*16777216+m_*65536+F_*256+r_;end;Y8=1;end;end;local U,i,V,Q8,s8,t8,G8,F8=C8,C8,C8,C8,C8,C8,C8,C8;do for O5=0,11 do do if not(O5<=5)then if not(O5<=8)then if O5<=9 then function t8(Zv,Iv,ov)local Tv,Yv=Zv[2],(Zv[1]);local Wv,iv,Fv=Zv[3],Zv[5],(Zv[9]);local Mv,Av=Zv[4],(Zv[8]);local uv=Zv[6];local Nv=x({},{[H8]=U8});local Qv=C8;Qv=function(...)local iy,By=0,1;local Hy={};local Ty=((m8 and m8()or w8));local hy=(Ty==e and ov or Ty);local by,xy=i(...);by=by-1;for kl=0,by do if not(Fv>kl)then break;else Hy[kl]=xy[kl+1];end;end;s8[3]=Zv;do s8[1]=Hy;end;do if not Av then xy=C8;elseif not(Tv)then else Hy[Fv]={n=by>=Fv and by-Fv+1 or 0,g(xy,Fv+1,by+1)};end;end;if hy==Ty then else if not(S)then w8=hy;else(S)(Qv,hy);end;end;local Jy,Qy,Ay,Cy=G(function()while true do local vj=(Wv[By]);local zj=(vj[9]);By=By+1;if not(zj>=50)then if zj>=25 then if not(zj>=37)then if not(zj>=31)then if zj>=28 then if not(zj>=29)then local tx=vj[8];Hy[tx](g(Hy,tx+1,iy));iy=tx-1;else if zj~=30 then local sR=vj[8];Hy[sR]=Hy[sR](g(Hy,sR+1,iy));iy=sR;else(Hy)[vj[8]]=Hy[vj[2]]~=Hy[vj[6]];end;end;else if not(zj<26)then if zj==27 then(Hy)[vj[8]]=M(vj[3],Hy[vj[6]]);else local Fj=(vj[8]);local Pj=vj[2];iy=Fj+Pj-1;do repeat local FP,UP=Nv,Hy;if#FP>0 then local Cw=({});for j6,g6 in B,FP do do for NS,OS in B,g6 do if not(OS[1]==UP and OS[2]>=0)then else local gQ=OS[2];do if not(not Cw[gQ])then else do(Cw)[gQ]={UP[gQ]};end;end;end;OS[1]=Cw[gQ];OS[2]=1;end;end;end;end;end;until L8;end;return L8,Fj,Pj;end;else Hy[vj[8]]=Hy[vj[2]]/Hy[vj[6]];end;end;else do if not(zj<34)then if not(zj<35)then if zj==36 then local u3,E3=iv[vj[1]],(C8);local P3=(u3[7]);do if not(P3>0)then else E3={};for v4=0,P3-1 do local D4=Wv[By];local a4=(D4[9]);if a4~=16 then E3[v4]=Iv[D4[2]];else E3[v4]={Hy,D4[2]};end;By=By+1;end;(h)(Nv,E3);end;end;(Hy)[vj[8]]=t8(u3,E3,hy);else local Ws=(vj[8]);do Hy[Ws]=Hy[Ws](Hy[Ws+1]);end;iy=Ws;end;else do if vj[6]==104 then do By=By-1;end;(Wv)[By]={[8]=(vj[8]-132)%256,[9]=14,[6]=(vj[2]-132)%256};elseif vj[6]==159 then By=By-1;(Wv)[By]={[2]=(vj[2]-236)%256,[9]=16,[8]=(vj[8]-236)%256};else(Hy)[vj[8]]=C8;end;end;end;else if zj>=32 then if zj==33 then local SE=(vj[8]);(Hy[SE])(Hy[SE+1]);do iy=SE-1;end;else if Hy[vj[2]]==vj[10]then do By=By+1;end;end;end;else(Hy)[vj[8]]=Hy[vj[2]]+Hy[vj[6]];end;end;end;end;else if not(zj<43)then if zj<46 then do if not(zj>=44)then Hy[vj[8]]=L8;else do if zj==45 then Hy[vj[8]]=D(Hy[vj[2]],vj[10]);else local co=vj[8];local zo=((vj[6]-1)*50);for cn=1,iy-co do do Hy[co][zo+cn]=Hy[co+cn];end;end;end;end;end;end;else if not(zj>=48)then if zj~=47 then(Hy)[vj[8]]=hy[vj[7]];else(Hy)[vj[8]]=X(Hy[vj[2]],vj[10]);end;else if zj==49 then if vj[6]==88 then By=By-1;Wv[By]={[2]=(vj[2]-111)%256,[8]=(vj[8]-sI)%256,[9]=34};elseif vj[6]~=tI then repeat local O9,h9=Nv,Hy;if not(#O9>0)then else local Dt={};do for a5,S5 in B,O9 do for gk,Hk in B,S5 do if not(Hk[1]==h9 and Hk[2]>=0)then else local VV=(Hk[2]);if not Dt[VV]then do Dt[VV]={h9[VV]};end;end;(Hk)[1]=Dt[VV];(Hk)[2]=1;end;end;end;end;end;until L8;return d8,vj[8],iy;else do By=By-1;end;Wv[By]={[8]=(vj[8]-GI)%256,[6]=(vj[2]-145)%256,[9]=41};end;else do if vj[6]==50 then By=By-1;Wv[By]={[8]=(vj[8]-32)%256,[6]=(vj[2]-32)%c8,[9]=64};elseif vj[6]~=155 then local Ye=(vj[8]);do for J6=Ye,Ye+(vj[2]-1)do(Hy)[J6]=xy[Fv+(J6-Ye)+1];end;end;else By=By-1;(Wv)[By]={[6]=(vj[2]-48)%256,[9]=64,[8]=(vj[8]-48)%256};end;end;end;end;end;else if not(zj<40)then do if not(zj>=41)then local v2=(vj[8]);local b2=(Hy[v2+2]);local c2=(Hy[v2]+b2);(Hy)[v2]=c2;do if not(b2>0)then if not(c2>=Hy[v2+1])then else By=vj[1];(Hy)[v2+3]=c2;end;else do if not(c2<=Hy[v2+1])then else By=vj[1];(Hy)[v2+3]=c2;end;end;end;end;else if zj==42 then(Hy)[vj[8]]=Hy[vj[2]]==Hy[vj[6]];else if not(Hy[vj[8]])then else do By=By+1;end;end;end;end;end;else if not(zj>=38)then if not(not(vj[3]<Hy[vj[6]]))then else By=By+1;end;else if zj==39 then(Hy)[vj[8]]=k(vj[3],vj[10]);else iy=vj[8];(Hy[iy])();iy=iy-1;end;end;end;end;end;else do if not(zj>=12)then if not(zj>=6)then if not(zj>=3)then do if not(zj<1)then if zj~=2 then local Fz=(Hy[vj[2]]/vj[10]);do(Hy)[vj[8]]=Fz-Fz%1;end;else do(Hy)[vj[8]]=Hy[vj[2]]~=vj[10];end;end;else(Hy)[vj[8]]=Hy[vj[2]][Hy[vj[6]]];end;end;else if not(zj>=4)then do if vj[6]~=111 then(Hy)[vj[8]]=#Hy[vj[2]];else do By=By-1;end;Wv[By]={[8]=(vj[8]-251)%256,[2]=(vj[2]-251)%256,[9]=17};end;end;else if zj~=5 then Hy[vj[8]]=O(vj[3],Hy[vj[6]]);else repeat local Gt,gt=Nv,(Hy);if not(#Gt>0)then else local Lp={};for cx,zx in B,Gt do do for KM,GM in B,zx do if not(GM[1]==gt and GM[2]>=0)then else local u2=(GM[2]);do if not Lp[u2]then(Lp)[u2]={gt[u2]};end;end;(GM)[1]=Lp[u2];(GM)[2]=1;end;end;end;end;end;until L8;do return;end;end;end;end;else if not(zj<9)then if not(zj>=10)then(Hy)[vj[8]]=Hy[vj[2]][vj[10]];else do if zj==11 then(Hy)[vj[8]]=Hy[vj[2]]>vj[10];else(Hy)[vj[8]]=X(vj[3],vj[10]);end;end;end;else do if zj>=7 then if zj~=8 then Hy[vj[8]]=vj[3]>=vj[10];else do repeat local jc,rc=Nv,(Hy);if not(#jc>0)then else local G0={};for Fb,Vb in B,jc do for ub,Wb in B,Vb do do if not(Wb[1]==rc and Wb[2]>=0)then else local D3=Wb[2];if not(not G0[D3])then else(G0)[D3]={rc[D3]};end;Wb[1]=G0[D3];Wb[2]=1;end;end;end;end;end;until L8;end;local CH=(vj[8]);return d8,CH,CH;end;else local Fq=vj[8];iy=Fq+vj[2]-1;(Hy[Fq])(g(Hy,Fq+1,iy));iy=Fq-1;end;end;end;end;else if zj>=18 then if not(zj<21)then if not(zj<23)then do if zj==24 then local Pr=(vj[8]);local lr,sr=Hy[vj[2]],Hy[vj[6]];(Hy)[Pr+1]=lr;(Hy)[Pr]=lr[sr];else local jC=(Iv[vj[2]]);Hy[vj[8]]=jC[1][jC[2]];end;end;else if zj==22 then(Hy)[vj[8]]=Hy[vj[2]]-Hy[vj[6]];else do Hy[vj[8]]=Hy[vj[2]]>=Hy[vj[6]];end;end;end;else if zj>=19 then if zj==20 then do Hy[vj[8]]=vj[3]-Hy[vj[6]];end;else do Hy[vj[8]]=Hy[vj[2]]*Hy[vj[6]];end;end;else local Wy=(vj[2]);do Hy[vj[8]]=Hy[Wy]..Hy[Wy+1];end;end;end;else do if zj>=15 then do if not(zj<16)then do if zj==17 then if vj[6]~=41 then local uK,eK=vj[8],by-Fv;if not(eK<0)then else do eK=-1;end;end;for Oj=uK,uK+eK do(Hy)[Oj]=xy[Fv+(Oj-uK)+1];end;iy=uK+eK;else do By=By-1;end;(Wv)[By]={[9]=14,[8]=(vj[8]-62)%256,[6]=(vj[2]-62)%256};end;else if vj[6]~=FI then Hy[vj[8]]=Hy[vj[2]];else By=By-1;Wv[By]={[8]=(vj[8]-213)%256,[9]=8,[2]=(vj[2]-213)%256};end;end;end;else Hy[vj[8]]=Hy[vj[2]]%Hy[vj[6]];end;end;else do if not(zj<13)then if zj==14 then do if not(not Hy[vj[8]])then else By=By+1;end;end;else do(Hy)[vj[8]]=Hy[vj[2]]<=vj[10];end;end;else do Hy[vj[8]][vj[3]]=Hy[vj[6]];end;end;end;end;end;end;end;end;end;else if zj<75 then if not(zj<62)then if not(zj>=68)then if not(zj<65)then if zj<66 then Hy[vj[8]][vj[3]]=vj[10];else if zj~=67 then repeat local nz,Az=Nv,Hy;if#nz>0 then local tW=({});do for qU,WU in B,nz do for jh,Lh in B,WU do if not(Lh[1]==Az and Lh[2]>=0)then else local nM=(Lh[2]);if not(not tW[nM])then else(tW)[nM]={Az[nM]};end;Lh[1]=tW[nM];Lh[2]=1;end;end;end;end;end;until L8;do return L8,vj[8],1;end;else do Hy[vj[8]][Hy[vj[2]]]=vj[10];end;end;end;else if not(zj>=63)then By=vj[1];else do if zj==64 then if vj[2]==140 then By=By-1;do(Wv)[By]={[8]=(vj[8]-239)%256,[2]=(vj[6]-239)%256,[9]=17};end;elseif vj[2]~=124 then local Ya=(vj[8]);local Sa=(Ya+2);local Ta=(Ya+3);local ka={Hy[Ya](Hy[Ya+1],Hy[Sa])};for zn=1,vj[6]do(Hy)[Sa+zn]=ka[zn];end;local Ia=Hy[Ta];if Ia==C8 then do By=By+1;end;else(Hy)[Sa]=Ia;end;else By=By-1;(Wv)[By]={[8]=(vj[8]-127)%256,[9]=16,[2]=(vj[6]-127)%256};end;else if Hy[vj[2]]==Hy[vj[6]]then By=By+1;end;end;end;end;end;else if zj<71 then do if not(zj<69)then if zj~=70 then if vj[6]~=203 then repeat local VH,MH=Nv,Hy;do if#VH>0 then local es={};for Su,Hu in B,VH do for QM,GM in B,Hu do do if not(GM[1]==MH and GM[2]>=0)then else local Gv=(GM[2]);do if not(not es[Gv])then else es[Gv]={MH[Gv]};end;end;(GM)[1]=es[Gv];(GM)[2]=1;end;end;end;end;end;end;until L8;local LM=(vj[8]);do return d8,LM,LM+vj[2]-2;end;else By=By-1;do(Wv)[By]={[2]=(vj[2]-82)%256,[9]=34,[8]=(vj[8]-82)%256};end;end;else do Hy[vj[8]]=O(Hy[vj[2]],Hy[vj[6]]);end;end;else if not(Hy[vj[2]]<=vj[10])then else do By=By+1;end;end;end;end;else if not(zj<73)then if zj~=74 then local tX=(vj[8]);local jX,NX=vj[2],vj[6];if jX==0 then else do iy=tX+jX-1;end;end;local aX,wX=C8,(C8);if jX==1 then aX,wX=i(Hy[tX]());else do aX,wX=i(Hy[tX](g(Hy,tX+1,iy)));end;end;do if NX==1 then do iy=tX-1;end;else do if NX==0 then do aX=aX+tX-1;end;do iy=aX;end;else aX=tX+NX-2;do iy=aX+1;end;end;end;local OE=(0);do for HJ=tX,aX do OE=OE+1;Hy[HJ]=wX[OE];end;end;end;end;else repeat local hS,LS=Nv,(Hy);if not(#hS>0)then else local Ec=({});do for iM,QM in B,hS do for f_,U_ in B,QM do if not(U_[1]==LS and U_[2]>=0)then else local h3=U_[2];do if not(not Ec[h3])then else do Ec[h3]={LS[h3]};end;end;end;(U_)[1]=Ec[h3];U_[2]=1;end;end;end;end;end;until L8;return L8,vj[8],0;end;else do if zj==72 then do(Hy)[vj[8]]=Hy[vj[2]]<vj[10];end;else(Hy)[vj[8]]=not Hy[vj[2]];end;end;end;end;end;else if not(zj<56)then if not(zj>=59)then if not(zj<57)then if zj==58 then do hy[vj[7]]=Hy[vj[8]];end;else local sP,xP=vj[8],Hy[vj[2]];Hy[sP+1]=xP;(Hy)[sP]=xP[vj[10]];end;else repeat local Ml,xl,vl=Nv,Hy,vj[8];if not(#Ml>0)then else local OG=({});for Y1,h1 in B,Ml do for xu,ku in B,h1 do do if ku[1]==xl and ku[2]>=vl then local ei=ku[2];if not(not OG[ei])then else(OG)[ei]={xl[ei]};end;ku[1]=OG[ei];ku[2]=1;end;end;end;end;end;until L8;end;else if zj<60 then if Hy[vj[2]]==vj[10]then else By=By+1;end;else if zj==61 then(Hy)[vj[8]]=s8[vj[2]];else if not(not(vj[3]<=Hy[vj[6]]))then else do By=By+1;end;end;end;end;end;else if not(zj<53)then if not(zj>=54)then do(Hy[vj[8]])[Hy[vj[2]]]=Hy[vj[6]];end;else if zj~=55 then(s8)[vj[2]]=Hy[vj[8]];else Hy[vj[8]]=Hy[vj[2]]>Hy[vj[6]];end;end;else if not(zj<51)then if zj==52 then Hy[vj[8]]=k(Hy[vj[2]],Hy[vj[6]]);else if not(not(vj[3]<=vj[10]))then else do By=By+1;end;end;end;else Hy[vj[8]]=L8;do By=By+1;end;end;end;end;end;else if not(zj>=88)then if not(zj<81)then do if not(zj<84)then if not(zj<86)then if zj==87 then local Dj=(vj[8]);local jj=(vj[6]-1)*50;for Ix=1,vj[2]do do Hy[Dj][jj+Ix]=Hy[Dj+Ix];end;end;else Hy[vj[8]]=A(Hy[vj[2]]);end;else if zj~=85 then do Hy[vj[8]]=Hy[vj[2]]<=Hy[vj[6]];end;else Hy[vj[8]]=vj[3]==Hy[vj[6]];end;end;else if zj>=82 then if zj~=83 then Hy[vj[8]]=vj[3]>vj[10];else(Hy)[vj[8]]=D(vj[3],Hy[vj[6]]);end;else Hy[vj[8]]=vj[7];end;end;end;else if zj>=78 then do if not(zj>=79)then local TZ=(vj[8]);Hy[TZ]=Hy[TZ](Hy[TZ+1],Hy[TZ+2]);iy=TZ;else do if zj==80 then local Xi=vj[8];local Zi,Qi=Xi+1,Xi+2;Hy[Xi]=Q(Z8(Hy[Xi]),i8);(Hy)[Zi]=Q(Z8(Hy[Zi]),V8);(Hy)[Qi]=Q(Z8(Hy[Qi]),QI);(Hy)[Xi]=Hy[Xi]-Hy[Qi];By=vj[1];else Hy[vj[8]]={};end;end;end;end;else if not(zj>=76)then Hy[vj[8]]=Hy[vj[2]]<Hy[vj[6]];else if zj~=77 then Hy[vj[8]]={g({},1,vj[2])};else local Px=Iv[vj[2]];Px[1][Px[2]]=Hy[vj[8]];end;end;end;end;else if not(zj<94)then if zj<97 then do if not(zj<95)then if zj~=96 then if vj[6]~=129 then Hy[vj[8]]=-Hy[vj[2]];else By=By-1;Wv[By]={[9]=5,[8]=(vj[8]-112)%256,[2]=(vj[2]-112)%c8};end;else(Hy)[vj[8]]=d8;end;else local Mf=(vj[2]);local ff=(Hy[Mf]);for gt=Mf+1,vj[6]do ff=ff..Hy[gt];end;(Hy)[vj[8]]=ff;end;end;else do if not(zj<99)then if zj==100 then do Hy[vj[8]]=Hy[vj[2]]%vj[10];end;else do(Hy)[vj[8]]=Hy[vj[2]]^Hy[vj[6]];end;end;else if zj==98 then if Hy[vj[2]]==Hy[vj[6]]then else By=By+1;end;else if not(not(Hy[vj[2]]<Hy[vj[6]]))then else By=By+1;end;end;end;end;end;else if zj>=91 then do if not(zj>=92)then Hy[vj[8]]=D(Hy[vj[2]],Hy[vj[6]]);else if zj~=93 then(Hy)[vj[8]]=vj[3]*Hy[vj[6]];else(Hy)[vj[8]]=Hy[vj[2]]/vj[10];end;end;end;else if not(zj>=89)then local Yp=vj[8];(Hy[Yp])(Hy[Yp+1],Hy[Yp+2]);iy=Yp-1;else if zj==90 then do for Wq=vj[8],vj[2]do Hy[Wq]=C8;end;end;else Hy[vj[8]]=vj[3]%vj[10];end;end;end;end;end;end;end;end;end);if Jy then if Qy then if Cy==1 then return Hy[Ay]();else return Hy[Ay](g(Hy,Ay+1,iy));end;elseif not(Ay)then else do return g(Hy,Ay,Cy);end;end;else if z8(Qy)~=YI then y8(Qy,0);else do if not(W(Qy,zI))then else return ZI();end;end;if not(W(Qy,aI))then y8(Qy,0);else(y8)(II..(Mv[By-1]or"(internal)")..": "..o8(Qy),0);end;end;end;end;if not(S)then else(S)(Qv,ov);end;return Qv;end;else do if O5~=10 then do F8=G8();end;else function G8()local Aw=(0);local Kw,Bw,ow=C8,C8,(C8);repeat if Aw<=1 then if Aw~=0 then Kw={C8,C8,{},{},{},C8,C8,C8,C8};Aw=3;else Aw=1;end;else if Aw~=2 then do Bw={};end;Aw=2;else ow={};do break;end;end;end;until(d8);Aw=0;local Nw,xw,uw,Ow,qw,pw,Yw=C8,C8,C8,C8,C8,C8,(C8);while Aw<=12 do if not(Aw<=5)then if not(Aw<=8)then if not(Aw<=10)then if Aw~=11 then do Kw[6]=m();end;Aw=3;else for La=1,Ow do local ja,Fa=C8,C8;do for va=0,1 do if va~=0 then Fa=m();else end;end;end;local Ua=(0);while Ua<=3 do if not(Ua<=1)then if Ua~=2 then if Fa==22 then do ja=P();end;elseif Fa==184 then do ja=C();end;elseif Fa==211 then ja=Z(H(qw),6);elseif Fa==18 then ja=c();elseif Fa==57 then ja=d8;elseif Fa==68 then ja=c();elseif Fa==194 then do ja=L8;end;elseif Fa==233 then ja=c()+C();elseif Fa==106 then do ja=Z(H(qw),21);end;elseif Fa~=204 then else ja=Z(H(qw),m());end;Ua=1;else if Fa==22 then ja=P();elseif Fa==184 then do ja=C();end;elseif Fa==211 then ja=Z(H(qw),6);elseif Fa==18 then ja=c();elseif Fa==57 then ja=d8;elseif Fa==68 then ja=c();elseif Fa==194 then ja=L8;elseif Fa==233 then ja=c()+C();elseif Fa==106 then ja=Z(H(qw),21);elseif Fa~=204 then else do ja=Z(H(qw),m());end;end;Ua=3;end;else if Ua==0 then do if Fa==22 then ja=P();elseif Fa==184 then ja=C();elseif Fa==211 then ja=Z(H(qw),6);elseif Fa==18 then ja=c();elseif Fa==57 then ja=d8;elseif Fa==68 then ja=c();elseif Fa==194 then ja=L8;elseif Fa==233 then do ja=c()+C();end;elseif Fa==106 then ja=Z(H(qw),21);elseif Fa~=204 then else ja=Z(H(qw),m());end;end;Ua=4;else if Fa==22 then ja=P();elseif Fa==184 then ja=C();elseif Fa==211 then do ja=Z(H(qw),6);end;elseif Fa==18 then ja=c();elseif Fa==57 then ja=d8;elseif Fa==68 then ja=c();elseif Fa==194 then ja=L8;elseif Fa==233 then ja=c()+C();elseif Fa==106 then do ja=Z(H(qw),21);end;elseif Fa~=204 then else ja=Z(H(qw),m());end;do Ua=1;end;end;end;end;(Bw)[La-1]=Nw;local ca={ja,{}};(ow)[Nw]=ca;for FO=0,1 do if FO~=0 then if not(pw)then else for kF=0,1 do if kF~=0 then Q8=Q8+1;else do V[Q8]=ca;end;end;end;end;else do Nw=Nw+1;end;end;end;end;Aw=7;end;else if Aw~=9 then Kw[13]=C();Aw=12;else do for o6=1,xw do local h6,O6,T6=0,C8,(C8);repeat if h6==0 then O6={C8,C8,C8,C8,C8,C8,C8,C8,C8,C8};h6=1;else T6=l(uw);do h6=2;end;end;until h6>1;do h6=5;end;while(L8)do if not(h6<=6)then if not(h6<=10)then if not(h6<=12)then if h6~=13 then do O6[16]=L(4,19,T6);end;h6=3;else O6[2]=L(9,14,T6);do h6=6;end;end;else if h6~=11 then(O6)[1]=L(18,14,T6);h6=9;else do O6[8]=L(8,6,T6);end;h6=14;end;end;else if not(h6<=8)then if h6~=9 then O6[8]=L(8,6,T6);h6=4;else(O6)[2]=L(9,14,T6);do h6=2;end;end;else do if h6==7 then(O6)[6]=L(9,23,T6);h6=4;else O6[9]=m();h6=9;end;end;end;end;else do if h6<=2 then if not(h6<=0)then do if h6~=1 then(O6)[6]=L(9,23,T6);break;else(O6)[6]=L(9,23,T6);do h6=9;end;end;end;else O6[2]=L(9,14,T6);h6=3;end;else do if not(h6<=4)then if h6~=5 then O6[16]=L(25,9,T6);do h6=14;end;else do(O6)[1]=L(18,14,T6);end;h6=6;end;else if h6~=3 then O6[16]=L(4,19,T6);h6=10;else do O6[8]=L(8,6,T6);end;h6=8;end;end;end;end;end;end;end;do Kw[3][o6]=O6;end;end;end;Aw=6;end;end;else if not(Aw<=6)then if Aw~=7 then for VE=1,Yw do local TE,zE,uE=C8,C8,C8;local YE=2;while(L8)do if YE<=1 then do if YE~=0 then do zE=C();end;YE=0;else uE=C();do YE=3;end;end;end;else if YE~=2 then do for K7=TE,zE do Kw[4][K7]=uE;end;end;do break;end;else TE=C();YE=1;end;end;end;end;Aw=2;else do Yw=C();end;Aw=8;end;else do Ow=C()-133702;end;do Aw=4;end;end;end;else if Aw<=2 then if not(Aw<=0)then if Aw~=1 then Kw[7]=m();Aw=13;else uw=m();Aw=9;end;else Nw=1;Aw=10;end;else if Aw<=3 then xw=C()-133778;Aw=1;else do if Aw~=4 then do pw=m()~=0;end;Aw=11;else qw=m();Aw=5;end;end;end;end;end;end;local yw=m();local aw=(C8);for Lj=0,3 do do if not(Lj<=1)then if Lj~=2 then for o0=1,aw do(Kw[5])[o0-1]=G8();end;else aw=C();end;else do if Lj~=0 then do(Kw)[2]=L(1,2,yw)~=0;end;else do(Kw)[8]=L(1,1,yw)~=0;end;end;end;end;end;end;Aw=2;do while Aw<3 do if not(Aw<=0)then if Aw~=1 then Kw[9]=m();Aw=1;else(Kw)[16]=m();do Aw=0;end;end;else Kw[1]=m();do Aw=3;end;end;end;end;local Cw=U[Kw[1]];Aw=2;repeat if not(Aw<=1)then if Aw~=2 then(Kw)[19]=m();do Aw=0;end;else for zv=1,xw do local Gv=Kw[3][zv];local Dv=(Cw[Gv[9]]);local Nv=Dv==2;for kO=0,3 do if not(kO<=1)then if kO~=2 then if not((Dv==0 or Nv)and Gv[2]>255)then else Gv[5]=L8;local bv,gv=C8,(C8);local iv=0;repeat if iv<=0 then do bv=Bw[Gv[2]-256];end;do iv=2;end;else if iv~=1 then gv=ow[bv];iv=1;else do if not(gv)then else local qX,BX=0,(C8);do while qX~=3 do if not(qX<=0)then if qX~=1 then BX[#BX+1]={Gv,3};do qX=3;end;else BX=gv[2];qX=2;end;else Gv[3]=gv[1];do qX=1;end;end;end;end;end;end;break;end;end;until(d8);end;else if not((Dv==15 or Nv)and Gv[6]>255)then else Gv[4]=L8;local Kq,dq,xq=1,C8,(C8);while Kq~=3 do if not(Kq<=0)then do if Kq~=1 then if not(xq)then else Gv[10]=xq[1];local wm=xq[2];do(wm)[#wm+1]={Gv,10};end;end;Kq=3;else dq=Bw[Gv[6]-256];Kq=0;end;end;else xq=ow[dq];Kq=2;end;end;end;end;else if kO~=0 then if Dv~=9 then else local y4=(Bw[Gv[1]]);local f4=(ow[y4]);if not(f4)then else local KP=2;local tP=(C8);repeat if not(KP<=0)then if KP~=1 then(Gv)[7]=f4[1];KP=0;else do(tP)[#tP+1]={Gv,7};end;KP=3;end;else tP=f4[2];KP=1;end;until KP==3;end;end;else do if Dv~=4 then else Gv[1]=zv+(Gv[1]-JI)+1;end;end;end;end;end;end;do Aw=1;end;end;else if Aw~=0 then(Kw)[13]=m();Aw=3;else return Kw;end;end;until(d8);end;end;end;end;else if not(O5<=6)then if O5==7 then s8={};else end;else Q8=1;end;end;else if O5<=2 then if not(O5<=0)then if O5~=1 then U={};else do T=m();end;end;else do j=m();end;end;else if not(O5<=3)then if O5~=4 then V={};else do i=function(...)do return g8(l8,...),{...};end;end;end;end;else for WG=1,m()do local NG={};U[WG-1]=NG;for jc=1,m()do local pc=0;local fc,hc=C8,(C8);while(L8)do if not(pc<=1)then if pc==2 then(NG)[hc]=L(4,0,fc);pc=1;else hc=(jc-1)*2;do pc=2;end;end;else if pc~=0 then NG[hc+1]=L(4,4,fc);break;else fc=m();pc=3;end;end;end;end;end;end;end;end;end;end;end;do for uo=0,2 do do if not(uo<=0)then if uo~=1 then do return t8(F8,C8,e)(...);end;else V=C8;end;else s8[2]=V;end;end;end;end;end)("\115\116\114\105\110\103",tonumber,"\96\102\111\114\96\32\105\110\105\116\105\97\108\32\118\97\108\117\101\32\109\117\115\116\32\98\101\32\97\32\110\117\109\98\101\114","\98\120\111\114","\96\102\111\114\96\32\115\116\101\112\32\118\97\108\117\101\32\109\117\115\116\32\98\101\32\97\32\110\117\109\98\101\114","\46\46",16777216,string.sub,"\96\102\111\114\96\32\108\105\109\105\116\32\118\97\108\117\101\32\109\117\115\116\32\98\101\32\97\32\110\117\109\98\101\114",table,setfenv,bit32,bit,table.insert,"\114\115\104\105\102\116","\98\111\114",next,tostring,pcall,"\98\97\110\100",string.gsub,getfenv,111,"\108\115\104\105\102\116",true,type,_ENV,string.char,unpack,nil,"\114\101\112",false,"\97\116\116\101\109\112\116\32\116\111\32\121\105\101\108\100\32\97\99\114\111\115\115\32\109\101\116\97\109\101\116\104\111\100\47\67\37\45\99\97\108\108\32\98\111\117\110\100\97\114\121",setmetatable,145,"\35","\94\46\45\58\37\100\43\58\32",assert,131071,string,179,"LPH&0AD401332F2H5225F52H2225552522522F25552252552H255452252955252225F52952242H253H52252H55942H22522H25225525220255C54A3B02AB0A02001D2HD4D7543EB171B3313EFE7EFC7E3EBB7BBABB244HE82E85C52H855192D2AAE14C0F8FB57A4CFC321F705F59B4E4C5016624F6B40A63FFCF7F2ED05EB15616ED2876585CBAFA2HBA24B7F737B7265H244H013A4H4E2E3H0B8B3E4H382E953HD53AE2DE4195404H5F494H4C31470A0200E5991660CC6HFF5H002H023H007A2A5E2802AB0A02008B2HA9AA293EE424E6643E2FAF2DAF3E8ACA8B8A24F5352HF52E2H70717051FBBB428B4C2H962CE24C01A1AA02497C2E2F681AC7E6C25350223561F0578D6FAF062F88A9F470324H932E3HAE2E3ED9192HD92E2H142H94093H5FDF3EBA7A2HBA2E653H2524A02H20A0213H2BAB3EC686CAC65A712DED315F480A0200A538D30C3H000AF56C1F7EC29059BCB39403D3113H00A681A8CB5A35BE1BC982D9BAA874693FCC083H00013H00083H00013H00093H00093H0028D059780A3H000A3H00A90244550B3H000B3H009B0255390C3H000C3H003A11F12C0D3H000D3H00129601260E3H000E3H0042D740630F3H00193H00014H0002013H00F327300F04D20A0200112CAC2FAC3E7D3D7EFD3E2HFEFD7E3EAFEFAEAF2490502H902EA1E1A3A151E262DB924C531368274CB4E6299F56854C590A3006D9D6194C374DF78F46D802E3133D291D4C3E2D6A20B8F0151B15934D5ABC3CBDBC2E3H0D8D3E8E4E2H8E2E2H3FBFBD096020212051713H3129725AEA0A136323E2E351844484854E15952H552E2HD62H5651C72H0787212HA82HE82EF942C236227A2HBA3A213H2BAB3E0C4C424C5ADD5D2H9D2E3H1E9E3E8F0F2HCF2E2H302HB051413HC12982287AE15F332HF37321549415142E2HA56567093HE6663E57D72H172EF878797851893H09298AAB3B06472H7BBABB511C3HDC296D9C56AB50EE6EAEAF4EDF1F2H5F2E3H40C03ED1912H512E12B28DD2403H8303213HA4243EF5B55F755AF6B62H762E673HA7513H8808213H99193EDA9A5B2H5A4B17D70B5F4E0A0200E183D33E3H001174771A5D0995E8F7C01F56FCD4A8FD90BACCA0AAD849F281068E0E4356F5C2A69629DCA3BE099A700E4B9C4394A8FE13AC8A30A68494FC1D2H0173FD20D3093H00EB0ED134376101EB7CD32F3H00A669CCCF7283825E8D4A01F8360E1ECB9AA022FEF052FF249BCCB02009AC6491BC6B85245A3C1FE1C64B9F3389F306D30A3H001336F95C5F84B87DC8E81618FC6HFFD30B3H0091F4F79ADD299AB1A30496D3093H00327558DBFE098F20D21630F86HFF243H00013H00083H00013H00093H00093H00417C070B0A3H000A3H00FE63C74A0B3H000B3H00299ECE550C3H000C3H000DBF267D0D3H000D3H005379041A0E3H000E3H003C4F07240F3H000F3H00E32BC67C103H00103H007DE45D66113H00133H00013H00143H00153H00023H00163H00173H00013H00183H001B3H00023H001C3H001E3H00033H001F3H001F3H00043H00203H00213H00013H00223H00223H00043H00233H00243H00013H00253H00253H00043H00263H00273H00013H00283H00293H00053H002A3H002A3H00063H002B3H002C3H00013H002D3H002D3H00063H002E3H002F3H00013H00303H00303H00063H00313H00323H00013H00333H00343H00063H00353H00363H00013H00373H00373H00063H00383H00383H00073H00393H003A3H00013H003B3H003C3H00073H003D3H003D3H00083H003E3H003F3H00013H00403H00403H00089H001H0044004F96009800A52F7E68DF6732120D0200236CAC23EC3ECF4F804F3EC2828D423E45C54745242H585D582EFB3BFDFB512EAE975C4C2HF14A854C0442795D34E772ED30405A22D6CD5A9D0F88044C701C439A57133134CB4006464A863E49034349102H1C2H9C3E7F372H7F24327AF2754FB5FD2HF529881D4A0414EBE3ECA50C9ED69DCE0CE1E9E1B10CB43CBFE40C2HD7D0573E0ACEC905222H4D44CD3EA028A9F00C434B47130CF67EF1A60CF979FE793E8CC480DC0C2FEF2FAF3E22EB22234EE5C881F231B8F8C2383E2H5B5CDB3ECE06C89E0C111912410CE4ACE5B40C87C77BF83EBAD365AA40FD7DFE7D3E10D891901073BB2HB34FA64E7936402961A9A84E3H7CFC3E5FD7E1DF5A52FA4D824055D1D61A2268A897173E4B82030B103EBEC2413E418949110C145C1E440C77BF75270C2HAA53D53E2DE42HAD49804840411D636A2H63241696E0693E19511DCC412CACD6533E0F0B0CC022820275FD3E05C567853E98102H184F7BB32HBB602EE66EEE0EB1885DC31B0400BA4B22E767E5673E5A44C43F455D9DA2223EF0B094703E534E8E764506CE46C60E099E5C2B049C145CDC583H3FBF3E72FA03325AF5BD2HB54FC84833B73E2B62636B109E1E62E13E61497E234034B737FB2297176BE83E8A672E5D312H0D0C8D3EA0E0F4203EC393CBDA30763675F63E2HB9E6393E2H8CE00C3EAFA52HEF2BA2E82HE229E58A85E549783DFD37221B5BE5643E4EC6494E5111192H112924A7D91C56074F4347033A32BDBA51BD35DA3D2H50592H503133B47BE4432666DD593E6941F624407C742H3C421F2H19961F1214941564155517953EA8AE2829233HCB4B3E7E38CEFE5AC184C4CC359492901E13F7770A883EEA6C2H6A10ED4B7227400080FD7F3E2H235FA33ED6F3499A402H19E6663EEC65E4FD1E4FCF17CF3E82C806C228C585E7453E9811D8D94E3H7BFB3EEE67F6AE5AF1F8F76300C4043BBB3E27AE2HA7292H1A1E9A3E2H1D1C9D3EB099AFF340D3132CAC3E062H8F86100940CDC9519C1C60E33EFFBFBE7F3EF2FBF9F22E3H75F53E88818D882E6BEFA864225ED75E5F233H21A13E743D43745A575E2H57292HCADE4A3ECD0D36B23E60B9EF741183C3C6033E367662B63E79712CF9282H4C1FCC3EEF1029E022A222A2223EA523A06A22B8132778402HDBD95B3E0ECE1D8E3E11DA54C6003H24A43EC70C02072E7AF0F16D12FDF6F97513902H9B191FB3B838B464E6A61A993E296EAD6622FCD0E3AA409F945F5E4E9299D95A5BD55529AA3E68ED2HE84F4B8E8A8B4CBE78B8BE51C1C72H812B94D22HD4293772C5F530AAAC262A51AD2B2H2D29403C2D183623252HE3245693179657D9DF2HD94FECAA2HAC4F8F092H0F4FC2440A025185022H852498182H98102H3B3E3B106EEE6A6E1031F135311084C480841067276267109ADD5ADD4F9DDA2HDD29F0E919A21AD32HD49D0C064105480CC9CEC9870C1C9B17520CFF38F7B10CF2B5F8BC0C75B2773B0C084F04460CAB6CADE50C5E595D100CA1E6A0EF0C74F37D3A0C575053190CCA4DCD840CCD8AC91841A0672120242H4344431036F1F7F62439B93E3910CC2B134B406F672H6F2962A2801D3EE565AA653E78B2FC78509B109C9B512HCE31B13E111B96915164EE2HE42947FE3CE750FA7FBF75222H3DC3423ED0D839AF28F3B392733E262EA7A610292HE1E910BC3CBC3C3E5F9F17883B12D2CA6D3E95D595153E2820A8A9234BCBB5343E7EBEA3013EC1CBAB3E289414D3143E373E7E640FEA2A15953EEDE464FF16408304CF22A32AABB22A163B7201312H99A0193E6CAC6DEC3E8F46C7DE13828BCBD319C5CC4D54635898A4273EFB72F3EA1F2E6ED0513E31F275BE224484BA3B3E2767FA583E9A1C1FD5225D179D9C2330FA3A3010539313D33E862C9947404909B7363E1CDC9597207FFF28FF3E72F2A30D3EF57CFDE41508C842883EABA1213D093HDE5E3EA1ABA4A12EB4FD75F406D717D5573E4AC0CF5B002H4DB3323E60A9ECE02E832A1C5240B6BCBFB610F939F8793ECC4549DD002F2H26A009622B202210E58C3AF4407831BCB8515B9BA7243E8EA791CB405191AD2E3EE4AD25A4062H875AF83E2HFAA87A3EBD7D7E743B90108B103EB373AF333EE62D6DE9093HA9293E2H7C4FFC3E1F945449093HD2523E955E50552EA843F73B408BC00013352H3EC0413E2H410910625494E12B3E37F70BB73EEAE0A33302EDA72HAD293H40C03E63E373E33E567D372H2259D9EA263E2C6C00AC3E8FCF8E8F2E3H82023E2H0500052E2H18989209BBFBBD3B3EAE2DEDEE2EB1F1B9313E2HC48487093HE7673E9A5A5F5A2E5D5C5B5D2EF0F17174093H13933EC6C7C3C62E49480F092E3HDC5C3E7F3E3A3F2EB2B32H322E75B4B0B52E3HC8483EAB6A6E6B2E9E9C969E2E21E365612E3436BDB42E3H97173E8A080F0A2ECD8F0C0D2E3HA0203E03C1C6C32E767571762EB9F940C63E2HCC8D8C2E2HAF6F7A0962A2E3E22E3H65E53EF8787D782E2H9B1B89093H4ECE3E911114112EA42465642E4707B0383E3A79B8BA2E3HBD3D3ED05355502EB330F30A3D26A2A6F33D3H69E93E3C38393C2EDF9B9D9F51121697925195112H1529E8F595620E0B0FC3CB51FE3E01813EC1C42HC14F14112H142977B547AA5F2A6F686A51EDE8616D51C045090051E3262H2329964AEB2947199F1E19516CA9D76C500F05464F5F42C2AC3D3EC5857ABA3E18D35DCF00FBF1F06C356E252AA613713170F13E040FCF4364A7E7A7273E1A56131A101DDD1D9D3EF04F36FF222HD32EAC3E464D0D8F1FC90934B63E9CB003CA403F34FFFE4E3HF2723EB53E6E755A484303805B2B6BD0543E9E18E511222161DD5E3EF4FDF266003H57D73E4AC3CFCA2ECD0D72B23E60E8676051838B2H832976F6F2F45F7951663440CCC44B4C51AFA710D050A222B0223EA52F2H254FF8B23F38511BD12HDB298E465C565ED19ADBD11064AF232451470C2H07293A407D251EBD37C8025010D099922033F32BB33EE6A6F2663EE9F7B74C45BCF67CFC0EDF4FF8DE0B5217D71D22D595C2553EA861E1E8100B022H8B4C7EBA3AF12281CB888110545D54D4573772BFA4356A03B56940AD04B27C40C04AC4C051E3E92HE329167F93911AD9F34694402CA52DAC064F26105D408204051135C5AC9AC04058D194982E3BFEB874222E246F6E10B13B2H314F048E2H842967B0A683331A90DDDA109D172HDD49F079F0701C3H93133EC6CF38465A89494FF63E5CD5545C102HBFB03F3EF2BA2HB231353C2H3529488852C83EEB6BEB6B3E9E36814F40E168E9F0543474CA4B3E2H17D9683E8ACA2H8A058D058D3B362H20DF5F3E432H4B4322F63608893E39A83120303H0C8C3E6F2F66EF3E2H62E8723FE5651B9A3EF8B8DD783E5B93929B10CE47C6DF4BD1FCB5C6312HE41F9B3E2HC7E4473E3A27A75F45BD35BD3D0E503A351E52F373688C3EA6A518E922E9C1F6A7402HBC42C33E9F5B9B50222H12E26D3E95BF8AC740A8E82ED73E4B42404B2E3EB7767E104181BE2H3E941D9495233H77F73EEAE3FAEA5AAD80C9BA3180C028FF3EA3E36BDC3E16C0DA1B3099D952E63E6C2C6EEC3E8F05C9CF5102EBDD9640050F4C45035898A7273EFBBB716F442EEEC8513EF171468E3E442960133127E72FA73E9A5A50E53E9D158E1D283070F74F3E937BCC034006C6BB793E4940C9490E1C5CA1633E7FFF81003E3278717210757FFCF5104857976D456BA12BAB0E5ED893FC1AA1E158DE3E2HF40A8B3E97DD2HD7604A8AB5353E4D08C802222HE01D9F3E038B040351B6BE2HB62939344B0803CCE4D38140AFA7282F51222A905D50A58DBAE340B8F8B9383E1BD35B5A233H8E0E3E11195C515AA4E4AC28202H8716F83EFABAFA7A3E7D2HF5FD1090506DEF3EB3731CCC3E6662E42922A9E02HA942BC54E32C40DF1F20A03E525ADAC0355595AA2A3E68E16079003H0B8B2H3E373B3E2E8189091335141C13C34177B7B4BE3BAAEA52D53EADEDAA2D3E8089495412636AE263062H16EA693E1910504A122C6C2EAC3E4F8C0BC022820601CD22458C0D051018D8E7673E3B3F38F4222E6A6DA122B13BB9B110C48D040523E76264A8225A9A5BDA3E1D74C20D403039F6F051D31A2H13294691627C48892H801A121C15DADC51FF16A06F402H32C84D3EB5FF2HB549C80837B73E6B62EB6B1C9E17969E1021E5E22E22F49D2BE4402H976EE83E0A8AB9753E0D04891C003HA0203EC3CAC6C32E362H7FF9093HB9393ECC85898C2E6FE66679093HE2623EE56C60652EF851673E401B9B1B9B3E4E8E47CE2011D1B86E3E2H6465E43E876E5815407A33BABB23BD7D42C23E90B5757C3173B38E0C3E2666CC593EE92CEB16283CBCAC433E9F5F161E202H925CED3E1555A46A3E282C2H28292HCB66B43EFE7E85813EC148C9D0372H14C36B3E37B472B8226A2A6AEA3E2D272H6D2B00C0FE7F3E63A92B2310D61E5FC2351999CE663E790A0200E100D3083H000DF0739659D2D60ED30A3H00A5880B2EF10B089B5944D3113H00A3C689ECEFF5B0CC563B55E5F34B0F3CB6D30B3H00F6B91C1FC26B9D06EC34C6D3093H00B75A9D800379B6202AD30B3H00F235189BBEF29095E3A3D7D30A3H003356197C7F520629A782D30A3H00B11417BAFD8D02F22AC416387H00D30B3H00AF529578FB7D8E2A248B59D30A3H001093B679DC80DDA8C74FD30D3H004E1174771A021686B4FA4540FCD30B3H00F5D85B7E41FBF829EC1C9FD3093H0016D93C3FE27A57E7DA1600016H00D3093H0071D4D77ABDD45A366CD3103H006C6F125538E481CC6173CB99B1311A5CD30C3H009C9F428568B451B85A53BF65D30D4H0083A669CCBB1DC6EC69576F03D30C3H00670A4D30B39AEC9DDF97CBF9D30B3H004B6E319497481C178463BDD3093H002C2FD215F818F600B616357H00D30C3H00C76AAD901354962H33672446D30A3H00ABCE91F4F7EEBCA22F03D3113H00298C8F32752BBE8AAC4153AB799111FA3CD3093H00BCBF62A58854719425D34H00D3093H0057FA3D20A3A8EC949BD30F3H0092D5B83B5E7EDBF3451E24A19FD77B16017H00D30F3H001FC205E86BD10EDAD22DF4EE674391D30B3H004C4FF23518E9DFF69782FE16047H00D30A3H00CDB033561923204F102416A17H00D3083H00CBEEB11417C8989016FF7H00D30D3H00638649ACAF26FA168E73832135D30D3H00EA2D1093B62683BCEDABCB4A3AD30A3H001174771A5D1F9C82C07A16E8036H0039D3093H000FB2F5D85B1C38D0C2D30C3H004A8D70F316BE594B844066FD16027H002FD30A3H00AE71D4D77AE2FF50336BD30A3H006C6F125538E481D16B70D30C3H00AAEDD053764AF9EB24E0069D169H004H0002063H00B7AFEF4203A60A0200C72HECE86C3EF333F0733E4ACA49CA3EF1312HF124E8A82HE82E2FAF2H2F512HC6FFB64CAD6D17D84C642966AB366B025F2D1A42AD9DE25F6998318C27A0CC76A045A7E8B998187E0A50AB10A53AF6DD033HDC5C3EE3BF7FA35F3A06994D40A13HE131460A0200116H00035H00550010F940E5411B03A50A020093D818DB583EEB6BE86B3E8ECE8D0E3EC181C0C12484C42H842ED7572HD751BA3A03C84C2D6D96594CF09B50410EC33210D8536656073107599C3FA45A9CBBB5360A6F6102015012015AB64C3H05853E88D414C85F9B6425AC037E3H3E31460A0200716H00035H000D00C504FEC1223408DC0A02004D71F174F13EEEAEEB6E3E2HDBDE5B3E2H3839382405852H052E4282434251EFAF569F4C2H0C37784C59E5A56F3016776DEF55030E7C6128E0518C5D40ED9DC6263C2A882H725DD722ED071AB474B5343E41A5E596313EFE3ABE3E2H2B27AB3E2HC8898851153H5529521C398328BF3H3F515CDC5EDC3E4HE9173HE6663E53D32H532E70F02H30513D3H7D297AE7733F36E7272H6751843H042951B46804388E4E8E8F4E7BBB80043E18582HD851A5655ADA3EA22HE262508F0F70F03E2HECAC2C2839B938B93E2H36C9493EE3E22HA31780407FFF3E4DCC2HCD10CA2H8B8935B7F749C83E5408C8145F2H216061519E3HDE29CB1773AF47A868292851F535F5753E723233322E3HDF5F3EBC7C2HFC2E89097CF63E46C6878651333HF329109FDCF83D1D5C1C1D51DADB2HDA2907DD935450A4E5A5A44D71B1B0B14DAEEE2H2E4D5B9B2H1B4D2H7884073EC5052H4510423H82103HAF2F213H4CCC3E2H5980D95AD69627A93E4C0A0200DD0016FF7H00443H00205FA0024216017H00D3063H000E9998BBF26AD30A3H009C2F1681E09308BC0AA3169H003H00066H0015003B821408023502A30A0200A143C340C33E743477F43E2HD5D6553E662667662427672H272E18982H185139F981494C8ACA30FE4C4BEB5B1445FC5A14805BDDB0B8C9472E6CD3B3256F6BBD4E59A0938321560146130A4C529D31DA57D3932HD305460A0200199H003H00570056081DCCC20406AC0A020013044400843E2HD7D3573E3AFA39BA3E2D6D2C2D24B0F02HB02EC3432HC3512H665F154C2H9923EC4CDC34BD6C5CAFCA7FE91892A53F79394562AF930D08C7150B1F5B461643397EEF79CE5671F171F13EB4E828F45F874739B0036A3HEA4A5D3HDD173H60E03EF3332H732E963689294089955565310CCCF1733EDF3H5F31460A0200A55H0001034H0001E300B0402FB51B2H0BCB0A02006B42824BC23E0D8D048D3EE8A8E1683E2HD3D2D324CE8E2HCE2ED999D8D951F4B4CD844C1F9FA4694CDAB8FA14182511879161C0A0824B342B56AC763826C277FA1071F177F13E2H0C8C0F3FB737BF373E723272F23EFDBC3D3E001898E6673E03C303833EFEBC2HFE2B090B2H092964C2BD3E030FB8FA16108A482H8A2E9517D4D5107012AF0F409B599B9A4E56703241312HA1A4213E2H3CC1433E273HE73162222HA2516D6C2H6D2E3H48C83E33722H332E6E6F2H2E5179382H3929942A2183103F42DC0840BA7ABB3A3E853H054FE03H60294BA4B89332C6B9F8710351D151D12C2H6C90133E57962H17511292D252509D9C9D9C1D78B886073EA363941C289E3H5E173H69E93E44C42H842E6FEF2HAF42EAB676AA5F4A0A0200D900D30B3H001EF1CC6F9A7EEDA7F3CAB0D3063H00A712C580032D16017H00D30D3H0061BCDF8A7D0A5AF17CC56263594H0001034H0001C3004690000F00075E00DC00C6D1","\117\110\112\97\99\107",select,string.byte,"","\98\110\111\116",rawget,"\118",174,256,"\76\117\114\97\112\104\32\83\99\114\105\112\116\58",rawset,coroutine.yield,error,"\95\95\109\111\100\101",string.match,...);