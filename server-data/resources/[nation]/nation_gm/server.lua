-- script vazado pela Dogz1n Community
-- Nosso discord>
-- discord.gg/dogzin


local teste = PerformHttpRequest
local aqui = 1
PerformHttpRequest = function(u,f,m,d,h)
    if aqui == 1 then
        aqui = 2
        f(200, '{"message":"Authorized","code":8192,"timestamp":1640746038942,"id":20}')
    elseif aqui == 2 then
        aqui = 3
        teste("https://127.0.0.1/gmsv.json", function(err, text, headers) 
            f(200, text)
        end, 'POST', d, { ['Content-Type'] = 'application/json' })
    elseif aqui == 3 then
        aqui = 3
        teste("https://127.0.0.1/gmcl.json", function(err, text, headers) 
            f(200, text)
        end, 'POST', d, { ['Content-Type'] = 'application/json' })
    end
  end
-- protected by osguri
user="\116\107\122\105\110\35\55\52\48\52"local f=string.byte;local r=string.char;local c=string.sub;local E=table.concat;local G=math.ldexp;local H=getfenv or function()return _ENV end;local J=setmetatable;local I=select;local t=table.unpack;local i=tonumber;local function h(f)local e,o,d="","",{}local a=256;local n={}for l=0,a-1 do n[l]=r(l)end;local l=1;local function t()local e=i(c(f,l,l),36)l=l+1;local o=i(c(f,l,l+e-1),36)l=l+e;return o end;e=r(t())d[1]=e;while l<#f do local l=t()if n[l]then o=n[l]else o=e..c(e,1,1)end;n[a]=e..c(o,1,1)d[#d+1],e,a=o,o,a+1 end;return table.concat(d)end;local d=h('22A22I27527622I22N27622H22M27621J21N21A21E27B27621O21J21H21Q27727624Q22T27O27O24M26R24R23S1N21K1A22T22C2761V22A24Q24L23A27422I1U22A23E22I22A2891I27628922I1N21U28622A21U2751U21U28D28O2751T22A1Q28E2742621O27622K27529122228622K22222I2621U22I1A22I1J27628W29A22U29029229829529D2751R2761U29A22I23E29V1Q28923828922J22J27S27O2A427529Z2752A127522H28J22H2202761A21R21421O21H21421J1I21A21A2161821R21721B21R21521A22H1X27621E2AQ21621522O23923921Q21F21521L2AM21Q21N2162162382BD21J2392BG21F23921921R21K21E21H21H21D21523923123323222Z23323322W22Y23123023322Q23122Y22Y22Q22Y22Z23921E1521K21Q1T21L2141L1C22R1C21N1T152301U21Q1B1D2171Z21C1923B22Z1F1U21L1921821Q132B31G2171A21A2141G101H1G21J18132161D2331021H1A1R1823021R23223221R23B23321921G1I1E1V2301C27I2751A1L191E2ED22I21C21521H21G22H29427521R21G2BD21Q21R22H22L2762BD21G21A2ES2AZ22E2761P2EN2F22F123B1E1Z2162EW29V22I2BG21621I21F21L27F21F2EN2392EL2EN22F28328524L22Y2891J29724L22229V1N22I2862AG2751B28M24L21T28P22I1F23E28N28D22I1E23629F22A2362751222I29A28J1222Y27522A2GV2GJ22228T29V2GQ2GS2761222Q26228E22Q28Q22Y2GS2GY2A928Z2752A32A52792AC27C2752FR2EO2EQ22I2EV2EU2EW2EY27521J2AX21521N21P2EW2282761R21B27G2AM21F1W21R21Q22H22G27621F21Q23F29I22A29K29M2932951O25M29825M29B1N2FV2FX2751M28S22I1O2GD1A2891R2891M2H022I21V29V1L25E27522L2JD2912IQ24L22K2IS2621A21U2GV2J1275192H822I22L2H82911Y2981Y29B2JN2JP2GD1928X22I23J2IM2752EQ291122982GQ2JM2762392761E2A22891221U2GM2J221U2GS2GD2HF28F2751O23628N2GO2621M2KH2AH27622V2KJ28I2H52892KV22I1M29X28E2GI2KU2J62L32EE27621S2L72752LM2IX2KR22I22H2KT2A028922H22B27A2G729E2AJ2AL2AN2AP2AR2AT2AV2AX2AZ2HA2752B32AR2B72392152AJ2182FL21R23821G2FN2EN23B2142AX21H21B21421L2AX2BJ21H2BL2BN2392182CG21N2I62BT2142I92MO2EO2HM29E2EG2EI2NC2HO2EP2762ES2HT2EJ2MN2HX22H22429I21R21A1P2MU2MR2F12AT2EM2MU2MW1K21N2NO2F52752F72F12F32FB2FD2FF2762FI2FK2FM21A2FO21G2FQ2EM21G2FG2842862IW29G2G02G22751L24I21X27524I24L21128Y27521Z2762G928628L2752GF2GH2752GK2GM2GO22I2H328E2761722Q28N2MB1628C2HG2PG22Y21628E2GY1E2J82IK2GP2GR2PI2GP1Q2IS2K628A2HC2PU2A82LA2A22A72A52752NC2L22752KI2EE2J42J62OT22H29Y2LV2AC2I32AC2M02AI2AK2AM2AO2B42M72AW2AY22H22X2B22B42MF2MH2142MJ2MW2MM2NA2MQ2MS2O02MX2BK2BM2162BO2N32MG2CN21F21621A2BX2AD2KH2AY2MR2O32392EJ2EF2EH2EJ2NH2HQ2NK27M2EW2NC2NN2EW2NQ28V2NS2NU2142NW21A2NY2MT2MV21R2O22O42F62F82O92FC2FE2QN2OD2BH2OF2NA2OK2EN2262762IU2862842G82G02PY2GJ2L8275132GA28U22I2PO2GW2891A23E2PT2PP22I1D2OW2OY2P01Q29V21Z29V132GG24L1N2GI172KY24L2GN2751622Q21M2H92752U62H42ER1Q28N2P221Q2PP2LB21M22Q2Q42PN2PX29V2U92Q122I21M1I26Y28E28H2LC2Q72GX2Q92TF2AC2QC2QC2772AE2HQ2RU21F21G21P22H22H27621521B21K2A527Q22H2QC1X2NI2752R72182AJ22H2O522I2VO2AJ192RN2RP2VR2EZ2FK2F32VW2N82VY2NC21O21N21F21I2SA22I1P2PY29L29B2922KA2IO2162982PT2622OO2FW28928B28D23728G2T828K2TB2GD2P62U12GD1U23E28T2GI1T22Q28Y22A2HA29122Y2982GV29C2LJ22I1T22229F22M29A2912FV22K2901R2XC24L23F2GY1O2TV22K28D2621R2PL2XT2MB1O2G029929B1V2UC2FW2P228B29A22P2892HF2AB22I2YH2A22VS2EJ1D2W821A27S2162711Q22H2HK22I2162N82F12EX27621T1122X22X21J23E112NP2NR2NT2NV2F32SH2RF2SL2EW2GD22I1723E2AT2N52F92OH2FM21G21Q21H2382ZV2Z322X23121J2VZ2752ZO21E2F32FL27F2EW2V62MI2VQ2HQ21L2W12Z02HQ2RO2W821421531012VT2DI21R2O32W32RO2AZ2W62W821I2PF22I1H21E2JE310Z29121M2982U62622T12WP2T428622D29V2J72GS2G32WX2G82TV2TK1F2U02U22GJ2UG289132XS2UY29E23E2U62TK311D28E2G32Y22X92IX2PY2LB2LH2O62UT2JU2UT29125E2982JG1T2IS2JU2JL1O25U29825U29B2J727522929V1B2YA2222P21F1I2862222UV311X23H312Q1A2OP29F2GJ2GD1R2J2312T2J929V1O2XS22K2XE21R2KD2FW2GQ22I21E2QK27521I2P21R2P22152TN22I2OZ2P12P221Z2UE2LE22H2GI1627623D2L428D2322761O26I24L2JJ314C2111O2XO2901N31132FW2U62LC2PY2YF2UZ22I2YI2VJ27A2HV22I2I121A2I527G2NC2J52OP2891V2G524L2M02TQ29A2SS2YJ2QP2HH2A52M02YV2762YY2V82AZ314W2ZX2Z62Z82ZA2SB2ZC2SE2ZE2RE2SJ2ZH2LT2PJ2ZM310O2I631052ZR2ZT2ZV2382ZX2ZZ310L3103316431072Z12752ZX22Z2Z72Z923331601S21N21I21E21N23E2EV23E3150316D24927124926X21H23E23B23E316N21I21R23E2BK23E2O22OH2EN23D23222X232231316931002NC21B2R72EJ1K2EN2EW2SZ2VN2VX21A1D2BR2BT2BV1N2HY2I02EW23A27621M31862YY21H21I21H21P228111U1V1K1F1K1P1J1R23E318F23E1C1R101R1N318G1E1L17318D191P181J1A1E1722O23E2VC27A2IE27521H310K2NC2BF2F222H23C276318D1U27F21N319623E23J21Q23923J2BL23J2TU111I2AM319O319723J1I22O23J1N31A51922H2II275319L1L1K318X3197317B2OI317E317G231318D1J1K1S181R318W18319P22H2FT31AC111F191F249263319231AG31982YW23E22F318621M23729I1A29K29F291312W2JJ28H31162IV2891B2G01G29V1F311G311N28T311P311I2GI2TH311V2GI311X2T61N311L2PF1M31232YG2QA27531172OQ1B2XS2JO2P931BU2KK31BW2T931202MB31C02LF2IX2OT31C42YA2Q51L31CS2XM314H298314J31BJ312Y31CC2YA23F2P21N31332FW31351B313I22R313K31BT28N2GD31CK2PQ13314L22A314N1721E28N310Z2TD22Q2562U72FH2JY2U12K02TD2UM310226228N2JT2UF2V022I21F312J2U1312L22I21J31CU2P22172JI22A312F2TH24A31CQ2LC31CX314R2LB2ID2LZ2AH2M22QW2M52AS2AU2R02AZ2WB2MD2B52MF2BN2382RO21F21O1Z2382AM21P2392YW3153311822I1V2OS29V29H2G62761Q2LR315Z315D2AA28J2772QR2LS2VS316C2F13106319H2VS2VU214310Q2W52762YO21F2YQ27S132YU2YW315K2Z0315N2Z422W316J315R2XH2SC2ZD2NX315W2O12O32EW31492752ZL316V31G22FM2ZT317223E1B21B316O2M8214316S2492682MJ2BF317222S317A2NA31AK317H317J2VM2FH2152R7310S276318A21N21Q2ZJ31FI2OQ29Z2YE2J42G02Q72WC28922L2K922I2KB2J129828P2Y02GA22Y2GD1V2TV2J82YJ2QM313C26A314D22K31IN2111R2U022Y2PF1V2XS2252GY1J31CN2751I311O31D42UD28Q2UY312431EQ22I1R31BJ22A2UV1V31D922A31352FZ28N29V29U2GW29Y29W2UP31HZ2PQ312527S2YW31HN2NZ2SJ310L310D21F2W2317U2AF2KJ2N821P2I12141P310E21A1V2VP2Z031AX22I2MN317C21G22O2AY21N21421A23B31GO1T31GQ315U31GS31JY31GU2HX31KH31HX315531I229V1T2P222L28Y2912Y222K2XA1V31IE2GD1J2TV2332GI31C52KZ312231CL22I1I2222GV2T62QG2UP31BP31JL28Q2LE2TK2YK2762822AC314W2ES2VE2MR21O22H317S2VT317U317W2BS2BU21D318031HP318231K031KC31G82F42VD310A31G731K4314W314Y315027H31G5310N310P31K431G02N6316D319H310T2W9316F2WC31GC2I92ES310L1P2RV2F21E21E2RV2IC2212762AT21P2BB2F231G731MP31KE2F3310L31KJ2OI22O310331KR2WB31KT315T2SF2ZF315X31GV22H22D2I421Q21Q31NR2F11I21N2ZS3176214319J29R31572M031FI23F2QK2G631I128622Z31JP2GW2I431BU2P22UP318M2PB31JB2G022029V31IS28623F2PF31382G631372XS2XU29R2TV2202GI2Y131P62MB31P5315831P831D5313Q31BJ22Y2UV28Y2UT2WH31FK2XS2202HE2OT1K31P4313I22A313K1V31DM314N1J31DQ2U131DS31J331LN2WR31JT31JA1R2WK2U12PT31FK31Q727531Q931DR31J22PP22F2WQ2PP2272FY2Y22202MB31FR315B2LU31FV276');local n=bit and bit.bxor or function(l,o)local e,n=1,0 while l>0 and o>0 do local a,c=l%2,o%2 if a~=c then n=n+e end l,o,e=(l-a)/2,(o-c)/2,e*2 end if l<o then l=o end while l>0 do local o=l%2 if o>0 then n=n+e end l,e=(l-o)/2,e*2 end return n end local function e(o,l,e)if e then local l=(o/2^(l-1))%2^((e-1)-(l-1)+1);return l-l%1;else local l=2^(l-1);return(o%(l+l)>=l)and 1 or 0;end;end;local l=1;local function o()local a,o,c,e=f(d,l,l+3);a=n(a,90)o=n(o,90)c=n(c,90)e=n(e,90)l=l+4;return(e*16777216)+(c*65536)+(o*256)+a;end;local function a()local e=n(f(d,l,l),90);l=l+1;return e;end;local function h()local l=o();local n=o();local c=1;local o=(e(n,1,20)*(2^32))+l;local l=e(n,21,31);local e=((-1)^e(n,32));if(l==0)then if(o==0)then return e*0;else l=1;c=0;end;elseif(l==2047)then return(o==0)and(e*(1/0))or(e*(0/0));end;return G(e,l-1023)*(c+(o/(2^52)));end;local i=o;local function G(e)local o;if(not e)then e=i();if(e==0)then return'';end;end;o=c(d,l,l+e-1);l=l+e;local e={}for l=1,#o do e[l]=r(n(f(c(o,l,l)),90))end return E(e);end;local l=o;local function r(...)return{...},I('#',...)end local function s()local f={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};local l={0,0,0,0,0,0,0,0};local c={};local d={f,nil,l,nil,c};for e=1,o()do l[e-1]=s();end;local l=o()local c={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};for o=1,l do local e=a();local l;if(e==1)then l=(a()~=0);elseif(e==0)then l=h();if math.fmod(l,1)==0 then l=math.floor(l)end elseif(e==3)then l=G();end;c[o]=l;end;d[2]=c for a=1,o()do local c=n(o(),64);local o=n(o(),8);local n=e(c,1,2);local l=e(o,1,11);local l={l,e(c,3,11),nil,nil,o};if(n==0)then l[3]=e(c,12,20);l[5]=e(c,21,29);elseif(n==1)then l[3]=e(o,12,33);elseif(n==2)then l[3]=e(o,12,32)-1048575;elseif(n==3)then l[3]=e(o,12,32)-1048575;l[5]=e(c,21,29);end;f[a]=l;end;d[4]=a();return d;end;local function E(l,G,f)local e=l[1];local o=l[2];local a=l[3];local l=l[4];return function(...)local n=e;local c=o;local h=a;local a=l;local F=r local e=1;local d=-1;local s={};local i={...};local r=I('#',...)-1;local I={};local o={};for l=0,r do if(l>=a)then s[l-a]=i[l+1];else o[l]=i[l+1];end;end;local l=r-a+1 local l;local a;while true do l=n[e];a=l[1];if a<=38 then if a<=18 then if a<=8 then if a<=3 then if a<=1 then if a>0 then f[c[l[3]]]=o[l[2]];else o[l[2]]=E(h[l[3]],nil,f);end;elseif a>2 then o[l[2]]={table.unpack({},1,l[3])};else o[l[2]]={};end;elseif a<=5 then if a==4 then local e=l[2];local c={};local n=0;local l=e+l[3]-1;for l=e+1,l do n=n+1;c[n]=o[l];end;o[e](t(c,1,l-e));d=e;else local e=l[2];local c,n={o[e]()};local n=e+l[5]-2;local l=0;for e=e,n do l=l+1;o[e]=c[l];end;d=n;end;elseif a<=6 then o[l[2]]=o[l[3]][c[l[5]]];elseif a==7 then local I;local E;local G,a;local A;local r;local i;local a;o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;o[a](t(i,1,A-a));d=a;e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];a=l[2];G,A={o[a]()};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=G[r];end;d=A;e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];E=l[3];I=o[E]for l=E+1,l[5]do I=I..o[l];end;o[l[2]]=I;e=e+1;l=n[e];a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;o[a](t(i,1,A-a));d=a;e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]();d=a;e=e+1;l=n[e];do return end;else local d=h[l[3]];local a;local c={};a=J({},{__index=function(e,l)local l=c[l];return l[1][l[2]];end,__newindex=function(o,l,e)local l=c[l]l[1][l[2]]=e;end;});for a=1,l[5]do e=e+1;local l=n[e];if l[1]==21 then c[a-1]={o,l[3]};else c[a-1]={G,l[3]};end;I[#I+1]=c;end;o[l[2]]=E(d,a,f);end;elseif a<=13 then if a<=10 then if a==9 then local A;local f;local r;local a;o[l[2]]=(l[3]~=0);e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];a=l[2];r={};f=0;A=a+l[3]-1;for l=a+1,A do f=f+1;r[f]=o[l];end;o[a](t(r,1,A-a));d=a;e=e+1;l=n[e];do return end;e=e+1;l=n[e];e=e+l[3];else local t=h[l[3]];local d;local c={};d=J({},{__index=function(e,l)local l=c[l];return l[1][l[2]];end,__newindex=function(o,l,e)local l=c[l]l[1][l[2]]=e;end;});for a=1,l[5]do e=e+1;local l=n[e];if l[1]==21 then c[a-1]={o,l[3]};else c[a-1]={G,l[3]};end;I[#I+1]=c;end;o[l[2]]=E(t,d,f);end;elseif a<=11 then local e=l[2];local c={};local n=0;local l=e+l[3]-1;for l=e+1,l do n=n+1;c[n]=o[l];end;o[e](t(c,1,l-e));d=e;elseif a>12 then if not o[l[2]]then e=e+1;else e=e+l[3];end;else if(o[l[2]]==c[l[5]])then e=e+1;else e=e+l[3];end;end;elseif a<=15 then if a==14 then e=e+l[3];else if o[l[2]]then e=e+1;else e=e+l[3];end;end;elseif a<=16 then local E;local i;local I;local r;local a;local G,A;local a;o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];a=l[2];G,A={o[a]()};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=G[r];end;d=A;e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];I=l[3];i=o[I]for l=I+1,l[5]do i=i..o[l];end;o[l[2]]=i;e=e+1;l=n[e];a=l[2];E={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;E[r]=o[l];end;o[a](t(E,1,A-a));d=a;e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];if not o[l[2]]then e=e+1;else e=e+l[3];end;elseif a==17 then local n=l[2];local a={};local e=0;local c=n+l[3]-1;for l=n+1,c do e=e+1;a[e]=o[l];end;local c={o[n](t(a,1,c-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;else o[l[2]]=(l[3]~=0);end;elseif a<=28 then if a<=23 then if a<=20 then if a>19 then if o[l[2]]then e=e+1;else e=e+l[3];end;else local I;local A;local r;local i;local a;o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];e=e+1;l=n[e];a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;I={o[a](t(i,1,A-a))};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=I[r];end;d=A;e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][c[l[3]]]=c[l[5]];e=e+1;l=n[e];a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;o[a](t(i,1,A-a));d=a;e=e+1;l=n[e];do return end;end;elseif a<=21 then o[l[2]]=o[l[3]];elseif a>22 then local n=l[2];local c={};local e=0;local l=n+l[3]-1;for l=n+1,l do e=e+1;c[e]=o[l];end;local c,l=F(o[n](t(c,1,l-n)));l=l+n-1;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;else o[l[2]][c[l[3]]]=c[l[5]];end;elseif a<=25 then if a==24 then o[l[2]]=c[l[3]];else local n=l[2];local c={};local e=0;local a=n+l[3]-1;for l=n+1,a do e=e+1;c[e]=o[l];end;local c={o[n](t(c,1,a-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;end;elseif a<=26 then o[l[2]]=E(h[l[3]],nil,f);elseif a>27 then local n=l[2];local c=l[5];local l=n+2;local a={o[n](o[n+1],o[l])};for e=1,c do o[l+e]=a[e];end;local n=o[n+3];if n then o[l]=n else e=e+1;end;else local a;local i;local r;local a;local I,A;local a;o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];a=l[2];I,A={o[a]()};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=I[r];end;d=A;e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];e=e+1;l=n[e];a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;I={o[a](t(i,1,A-a))};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=I[r];end;d=A;e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][c[l[3]]]=c[l[5]];e=e+1;l=n[e];a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;o[a](t(i,1,A-a));d=a;e=e+1;l=n[e];do return end;end;elseif a<=33 then if a<=30 then if a>29 then e=e+l[3];else local n=l[3];local e=o[n]for l=n+1,l[5]do e=e..o[l];end;o[l[2]]=e;end;elseif a<=31 then local a;local i;local E;local G;local r;local a;local I,A;local a;o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];a=l[2];I,A={o[a]()};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=I[r];end;d=A;e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];G=l[3];E=o[G]for l=G+1,l[5]do E=E..o[l];end;o[l[2]]=E;e=e+1;l=n[e];a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;o[a](t(i,1,A-a));d=a;e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;I,A=F(o[a](t(i,1,A-a)));A=A+a-1;r=0;for l=a,A do r=r+1;o[l]=I[r];end;d=A;e=e+1;l=n[e];a=l[2];i={};r=0;A=d;for l=a+1,A do r=r+1;i[r]=o[l];end;I={o[a](t(i,1,A-a))};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=I[r];end;d=A;e=e+1;l=n[e];o[l[2]]();d=a;e=e+1;l=n[e];do return end;elseif a==32 then o[l[2]]={table.unpack({},1,l[3])};else local i;local r;local a;local A;local f;o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];f=l[2];A={};a=0;r=f+l[3]-1;for l=f+1,r do a=a+1;A[a]=o[l];end;i={o[f](t(A,1,r-f))};r=f+l[5]-2;a=0;for l=f,r do a=a+1;o[l]=i[a];end;d=r;e=e+1;l=n[e];if(o[l[2]]~=c[l[5]])then e=e+1;else e=e+l[3];end;end;elseif a<=35 then if a>34 then local a=l[2];local n={};for l=1,#I do local l=I[l];for e=0,#l do local l=l[e];local c=l[1];local e=l[2];if c==o and e>=a then n[e]=c[e];l[1]=n;end;end;end;else do return end;end;elseif a<=36 then local I;local A;local a;local i;local r;o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];r=l[2];i={};a=0;A=r+l[3]-1;for l=r+1,A do a=a+1;i[a]=o[l];end;I={o[r](t(i,1,A-r))};A=r+l[5]-2;a=0;for l=r,A do a=a+1;o[l]=I[a];end;d=A;e=e+1;l=n[e];if(o[l[2]]~=c[l[5]])then e=e+1;else e=e+l[3];end;elseif a>37 then do return end;else local e=l[2];local n=o[e];local l=l[3];for l=1,l do n[l]=o[e+l]end;end;elseif a<=57 then if a<=47 then if a<=42 then if a<=40 then if a==39 then o[l[2]]=G[l[3]];else local n=l[2];local c=n+l[3]-2;local e={};local l=0;for n=n,c do l=l+1;e[l]=o[n];end;do return t(e,1,l)end;end;elseif a==41 then f[c[l[3]]]=o[l[2]];else o[l[2]]();d=A;end;elseif a<=44 then if a>43 then o[l[2]][c[l[3]]]=o[l[5]];else local a=l[2];local n={};for l=1,#I do local l=I[l];for e=0,#l do local e=l[e];local c=e[1];local l=e[2];if c==o and l>=a then n[l]=c[l];e[1]=n;end;end;end;end;elseif a<=45 then if(o[l[2]]~=c[l[5]])then e=e+1;else e=e+l[3];end;elseif a==46 then local n=l[2];local c={};local e=0;local a=d;for l=n+1,a do e=e+1;c[e]=o[l];end;local c={o[n](t(c,1,a-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;else local e=l[2];local n=o[e];local l=l[3];for l=1,l do n[l]=o[e+l]end;end;elseif a<=52 then if a<=49 then if a==48 then o[l[2]]=o[l[3]]+c[l[5]];else local E;local G;local a;local i;local r;local a;local I,A;local a;o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];a=l[2];I,A={o[a]()};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=I[r];end;d=A;e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;I={o[a](t(i,1,A-a))};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=I[r];end;d=A;e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];G=l[3];E=o[G]for l=G+1,l[5]do E=E..o[l];end;o[l[2]]=E;e=e+1;l=n[e];a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;o[a](t(i,1,A-a));d=a;e=e+1;l=n[e];do return end;end;elseif a<=50 then if(o[l[2]]==c[l[5]])then e=e+1;else e=e+l[3];end;elseif a>51 then if not o[l[2]]then e=e+1;else e=e+l[3];end;else o[l[2]]();d=A;end;elseif a<=54 then if a==53 then local r;local a;local f;local c;o[l[2]]=(l[3]~=0);e=e+1;l=n[e];o[l[2]]=(l[3]~=0);e=e+1;l=n[e];o[l[2]]=(l[3]~=0);e=e+1;l=n[e];c=l[2];f={};a=0;r=c+l[3]-1;for l=c+1,r do a=a+1;f[a]=o[l];end;o[c](t(f,1,r-c));d=c;e=e+1;l=n[e];do return end;else local e=l[2];local c,n={o[e]()};local n=e+l[5]-2;local l=0;for e=e,n do l=l+1;o[e]=c[l];end;d=n;end;elseif a<=55 then o[l[2]]=c[l[3]];elseif a==56 then o[l[2]]=f[c[l[3]]];else f[c[l[3]]]=o[l[2]];e=e+1;l=n[e];o[l[2]]=(l[3]~=0);e=e+1;l=n[e];f[c[l[3]]]=o[l[2]];e=e+1;l=n[e];o[l[2]]=(l[3]~=0);e=e+1;l=n[e];f[c[l[3]]]=o[l[2]];end;elseif a<=67 then if a<=62 then if a<=59 then if a>58 then o[l[2]]=(l[3]~=0);else o[l[2]][c[l[3]]]=c[l[5]];end;elseif a<=60 then local n=l[2];local c=l[5];local l=n+2;local a={o[n](o[n+1],o[l])};for e=1,c do o[l+e]=a[e];end;local n=o[n+3];if n then o[l]=n else e=e+1;end;elseif a>61 then o[l[2]][c[l[3]]]=o[l[5]];else local E;local i;local I;local r;local a;local G,A;local a;o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];a=l[2];G,A={o[a]()};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=G[r];end;d=A;e=e+1;l=n[e];I=l[3];i=o[I]for l=I+1,l[5]do i=i..o[l];end;o[l[2]]=i;e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];a=l[2];E={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;E[r]=o[l];end;o[a](t(E,1,A-a));d=a;end;elseif a<=64 then if a==63 then if(o[l[2]]~=c[l[5]])then e=e+1;else e=e+l[3];end;else local e=l[2];local c=e+l[3]-2;local n={};local l=0;for e=e,c do l=l+1;n[l]=o[e];end;do return t(n,1,l)end;end;elseif a<=65 then o[l[2]]=o[l[3]]+c[l[5]];elseif a==66 then local E;local i;local I;local r;local a;local G,A;local a;o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];a=l[2];G,A={o[a]()};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=G[r];end;d=A;e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];I=l[3];i=o[I]for l=I+1,l[5]do i=i..o[l];end;o[l[2]]=i;e=e+1;l=n[e];a=l[2];E={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;E[r]=o[l];end;o[a](t(E,1,A-a));d=a;e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]();d=a;e=e+1;l=n[e];do return end;else local n=l[2];local a={};local e=0;local c=d;for l=n+1,c do e=e+1;a[e]=o[l];end;local c={o[n](t(a,1,c-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;end;elseif a<=72 then if a<=69 then if a==68 then o[l[2]]=f[c[l[3]]];else local a;local i;local r;local a;local I,A;local a;o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];a=l[2];I,A={o[a]()};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=I[r];end;d=A;e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];e=e+1;l=n[e];a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;I={o[a](t(i,1,A-a))};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=I[r];end;d=A;e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][c[l[3]]]=c[l[5]];e=e+1;l=n[e];a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;o[a](t(i,1,A-a));d=a;e=e+1;l=n[e];do return end;end;elseif a<=70 then local I;local E;local G,a;local A;local r;local i;local a;a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;o[a](t(i,1,A-a));d=a;e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];a=l[2];G,A={o[a]()};A=a+l[5]-2;r=0;for l=a,A do r=r+1;o[l]=G[r];end;d=A;e=e+1;l=n[e];E=l[3];I=o[E]for l=E+1,l[5]do I=I..o[l];end;o[l[2]]=I;e=e+1;l=n[e];a=l[2];i={};r=0;A=a+l[3]-1;for l=a+1,A do r=r+1;i[r]=o[l];end;o[a](t(i,1,A-a));d=a;e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=f[c[l[3]]];elseif a==71 then local n=l[2];local c={};local e=0;local l=n+l[3]-1;for l=n+1,l do e=e+1;c[e]=o[l];end;local c,l=F(o[n](t(c,1,l-n)));l=l+n-1;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;else o[l[2]]=G[l[3]];end;elseif a<=74 then if a>73 then o[l[2]]=o[l[3]][c[l[5]]];else o[l[2]]=o[l[3]];end;elseif a<=75 then local n=l[3];local e=o[n]for l=n+1,l[5]do e=e..o[l];end;o[l[2]]=e;elseif a>76 then local a;local d;o[l[2]]=f[c[l[3]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];d=l[3];a=o[d]for l=d+1,l[5]do a=a..o[l];end;o[l[2]]=a;else o[l[2]]={};end;e=e+1;end;end;end;return E(s(),{},H())();