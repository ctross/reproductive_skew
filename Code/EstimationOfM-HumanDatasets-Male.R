################################################################################
## Estimation Of M Using SkewCalc R package
## Male Data Sets

###################################################################### Load Data
 setwd(paste0(basewd,'/Data/Individual-Level Human Data Sets/Males'))
 
 dTsimane1 = read.csv("GurvenEtAl-Tsimane-Male.csv")
 dKipsigis = read.csv("BorgerhoffMulder-Kipsigis-Male.csv")
 dPimbwe = read.csv("BorgerhoffMulder-Pimbwe-Male.csv")
 dSukuma1 = read.csv("BorgerhoffMulder-Sukuma-Male.csv")
 dMatsigenka = read.csv("Bunce-Matsigenka-Male.csv")
 dMestizo = read.csv("Bunce-Mestizo-Male.csv")
 dChagga = read.csv("Caudell-Chagga-Male.csv")
 dKoore = read.csv("Caudell-Koore-Male.csv")
 dMaasai1 = read.csv("Caudell-Maasai1-Male.csv")
 dMaasai2 = read.csv("Caudell-Maasai2-Male.csv")
 dSidama = read.csv("Caudell-Sidama-Male.csv")
 dWarusha = read.csv("Caudell-Warusha-Male.csv")
 dEngland = read.csv("Clark-England-Male.csv")
 dMaya1 = read.csv("Cortez-Maya-Male.csv")
 dTsimane2 = read.csv("Godoy-Tsimane-Male.csv")
 dAgtaSIA = read.csv("Headland-SIAAgta-Male.csv")
 dAka = read.csv("Hewlett-Aka-Male.csv")
 dTyva = read.csv("Hooper-Tyva-Male.csv")
 dMayangna = read.csv("Koster-Mayangna-Male.csv")
 dMaya2 = read.csv("Kramer-Maya-Male.csv")
 dPume = read.csv("Kramer-Pume-Male.csv")
 dSabaBlack = read.csv("Leslie-SabaBlack-Male.csv")
 dSabaWhite = read.csv("Leslie-SabaWhite-Male.csv")
 dHadza = read.csv("Marlowe-Hadza-Male.csv")
 dNyakyusa = read.csv("McElreath-Nyakyusa-Male.csv")
 dSangu = read.csv("McElreath-Sangu-Male.csv")
 dSukuma2 = read.csv("McElreath-Sukuma-Male.csv")
 dLamalera = read.csv("Nolin-Lamalera-Male.csv")
 dHimba = read.csv("Scelza-Himba-Male.csv")
 dMakushi = read.csv("Schacht-Makushi-Male.csv")
 dBengali = read.csv("Shenk-Bengali-Male.csv")
 dMeriam = read.csv("Smith-Meriam-Male.csv")
 dSukuma3 = read.csv("Solerno-Sukuma-Male.csv")
 dDolgan = read.csv("Ziker-Dolgan-Male.csv")
 dNganasan = read.csv("Ziker-Nganasan-Male.csv")
 dHadza2 = read.csv("Wood-Hadza-Male.csv")
 dKung = read.csv("HowellDraper-Kung-Male.csv")
 dAche = read.csv("Hill-Ache-Male.csv")
 dHiwi = read.csv("Hill-Hiwi-Male.csv")
 dToba = read.csv("Valeggia-WesternToba-Male.csv")
 dHadza3 = read.csv("BlurtonJones-Hadza-Male.csv")
 dAmmonni = read.csv("Bonte-Ammonni-Male.csv")
 dTorshan = read.csv("Botte-Torshan-Male.csv")
 dAlyawarra = read.csv("Denham-Alyawarra-Male.csv")
 dTikuna = read.csv("Echeverri-Tikuna-Male.csv")
 dChuukese = read.csv("Goodenough-Chuukese-Male.csv")
 dApache = read.csv("Goodwin-Apache-Male.csv")
 dNunamiut = read.csv("Gubser-Nunamiut-Male.csv")
 dRoyals = read.csv("Hamberger-EuropeanRoyalty-Male.csv")
 dTiwi = read.csv("Hart-Tiwi-Male.csv")
 dAfrobrasilians = read.csv("Hartung-Afrobrasilians-Male.csv")
 dSlavey = read.csv("Helm-Slavey-Male.csv")
 dInuit = read.csv("Holmes-Inuit-Male.csv")
 dSainteCatherine = read.csv("Legrand-SainteCatherine-Male.csv")
 dTurkanaNomadic = read.csv("Leslie-TurkanaNomadic-Male.csv")
 dTurkanaSettled = read.csv("Leslie-TurkanaSettled-Male.csv")
 dAchuar = read.csv("Mader-Achuar-Male.csv")
 dDogon = read.csv("MarieHelene-Dogon-Male.csv")
 dKung2 = read.csv("Marshall-Kung-Male.csv")
 dPere = read.csv("Mead-Pere-Male.csv")
 dOjibwa = read.csv("Rogers-Ojibwa-Male.csv")
 dWanindiljaugwa = read.csv("Rose-Wanindiljaugwa-Male.csv")
 dCocama = read.csv("Ruiz-Cocama-Male.csv")
 dXavante = read.csv("Salzano-Xavante-Male.csv")
 dSemang = read.csv("Schebesta-Semang-Male.csv")
 dGambia = read.csv("Sear-Gambia-Male.csv")
 dWaimiri = read.csv("Silva-Waimiri-Male.csv")
 dWarao = read.csv("Wilbert-Warao-Male.csv")
 dLapp = read.csv("Withaker-Lapp-Male.csv")
 dKrummhorn = read.csv("Willfuehr-Krummhorn-Male.csv")
 dMiskito = read.csv("Koster-Miskito-Male.csv")
 dCoastalTanna = read.csv("Atkinson-CoastalTanna-Male.csv")
 dInlandTanna = read.csv("Atkinson-InlandTanna-Male.csv")
 dHadza4 = read.csv("Apicella-Hadza-Male.csv")
 dPesqueiro = read.csv("Cohen-Pesqueiro-Male.csv") 
 dYasawa = read.csv("McNamara-Yasawa-Male.csv")
 dTyva2 = read.csv("Purzycki-Tyva-Male.csv")   
 dLovu = read.csv("Willard-Lovu-Male.csv") 
 dMauritius = read.csv("Xygalatas-Mauritius-Male.csv")                          
 dAfrocolombians = read.csv("Ross-Afrocolombians-Male.csv")  
 dEmbera = read.csv("Ross-Embera-Male.csv")
 dAfrocolombians2 = read.csv("Ross-Afrocolombians2-Male.csv")
 dAltiplano1 = read.csv("Moya- PeruvianAltiplano(1)-Male.csv")
 dAltiplano2 = read.csv("Moya- PeruvianAltiplano(2)-Male.csv")
 dPoland = read.csv("Colleran-Poland-Male.csv")
 dFinland = read.csv("Lummaa-Finland-Male.csv")
 dInterculturales = read.csv("Pisor-Interculturales-Male.csv")
 dMoseten = read.csv("Pisor-Moseten-Male.csv")
 dShodagor = read.csv("Starkweather-Shodagor-Male.csv")
 dBari = read.csv("Beckerman-Bari-Male.csv")
 dMestizo2 = read.csv("Ross-Mestizo1-Male.csv")
 dMestizo3 = read.csv("Ross-Mestizo2-Male.csv")
 dDarkhad = read.csv("Hooper-Darkhad-Male.csv")
 dArsiOromo = read.csv("Gibson-ArsiOromo-Male.csv")
 dArsiOromo2 = read.csv("Gibson-ArsiOromo2-Male.csv")
 dArsiOromo3 = read.csv("Gibson-ArsiOromo3-Male.csv")
 dBaja1 = read.csv("Macfarlan-BajaCaliforniaSurMexico-Male1.csv")
 dBaja2 = read.csv("Macfarlan-BajaCaliforniaSurMexico-Male2.csv")
 dIndia1 = read.csv("Power-Alakapuram-Male.csv")
 dIndia2 = read.csv("Power-Tenpatti-Male.csv")
 dMalawi = read.csv("Lanning-Malawi-Male.csv")
 dAgtaP0 = read.csv("Page-Agta0-Male.csv")
 dAgtaP1 = read.csv("Page-Agta1-Male.csv")
 dEfate = read.csv("Mattison-Efate-Male.csv")
 dTanna3 = read.csv("Massengill-Tanna-Male.csv")
 dMosuoPat = read.csv("Sum-Mosuo_Pat-Male.csv")
 dMosuoMat = read.csv("Sum-Mosuo_Mat-Male.csv")
 dHan = read.csv("Sum-Han_Mat-Male.csv")
 dPumi = read.csv("Sum-Pumi_Mat-Male.csv")
 dZhuang = read.csv("Sum-Zhuang_Mat-Male.csv")
 dHaiti = read.csv("DeMarco-Haiti-Male.csv")
 dMadagascar = read.csv("Golden-Madagascar-Male.csv")
 dSami = read.csv("Helle-Sami-Male.csv")
 dFinns = read.csv("Helle-Finns-Male.csv")
 dMozambique = read.csv("Mertens-Mozambique-Male.csv")
 dHental = read.csv("Grimalda-Hental-Male.csv")
 dAngola = read.csv("Davis-Angola-Male.csv")
 dBayaka = read.csv("Boyette-Bayaka-Male.csv")
 dBandongo = read.csv("Boyette-Bandongo-Male.csv")
 dChugurpampa = read.csv("Oths-Peru-Male.csv")
 dBelize1 = read.csv("Belize1-Downey-Male.csv")
 dBelize2 = read.csv("Belize2-Downey-Male.csv")
 dChewa= read.csv("Sear-Chewa-Male.csv")
 dShuar1 = read.csv("Sugiyama-Shuar1-Male.csv")
 dShuar2 = read.csv("Sugiyama-Shuar2-Male.csv")

############################################################# Prep Results Array
 Res = matrix(NA,nrow=125,ncol=36)
 Labels  =  c("Population","Ethnographer","Location","Production System","RS Type","Sample","N25","RS0A25","PercRS0A25",
             "N45","RS0A45","PercRS0A45","N0","RSsum","Exposuresum","RSmean","RSsd","RSvar","RScv", "RSofs","Gini",
             "RateGini","Bindex","Mraw_index","M_index",
             "Mraw_Posterior_Estimate","M_Posterior_Estimate",
             "Mraw_Posterior_EstimateL","M_Posterior_EstimateL",
             "Mraw_Posterior_EstimateH", "M_Posterior_EstimateH", 
             "Mraw_Posterior_EstimateSD","M_Posterior_EstimateSD",
             "Gamma", "Gamma_L","Gamma_H")

colnames(Res) = Labels

setwd(paste0(basewd,'/Results/Males'))
 
############################################################### Fill Male Results
 Res[1,] = c("Tsimane[1]","Gurven et al.","Bolivia", "Horticulture","Survived to 5","Census",
              MergeRes(dTsimane1$age, dTsimane1$rs))
              skew_index_plot("M", Age=TRUE, Save="Tsimane[1]_Male_GurvenEtAl_M")
              skew_scatter_plot(dTsimane1$age, dTsimane1$rs, Save="Tsimane[1]_Male_GurvenEtAl_Scatter")
              skew_trace_plot(dTsimane1$age, Save="Tsimane[1]_Male_GurvenEtAl_Trace")         
 

 Res[2,] = c("Kipsigis","Borgerhoff Mulder","Kenya", "Agropastoralism","Survived to 5","Census",
              MergeRes(dKipsigis$age, dKipsigis$rs))
              skew_index_plot("M", Age=TRUE, Save="Kipsigis_Male_BorgerhoffMulder_M")
              skew_scatter_plot(dKipsigis$age, dKipsigis$rs, Save="Kipsigis_Male_BorgerhoffMulder_Scatter")
              skew_trace_plot(dKipsigis$age, Save="Kipsigis_Male_BorgerhoffMulder_Trace")   
 

 Res[3,] = c("Pimbwe","Borgerhoff Mulder","Tanzania", "Horticulture","Survived to 5","Census",
              MergeRes(dPimbwe$age, dPimbwe$rs))
              skew_index_plot("M", Age=TRUE, Save="Pimbwe_Male_BorgerhoffMulder_M")
              skew_scatter_plot(dPimbwe$age, dPimbwe$rs, Save="Pimbwe_Male_BorgerhoffMulder_Scatter")
              skew_trace_plot(dPimbwe$age, Save="Pimbwe_Male_BorgerhoffMulder_Trace")   
 

 Res[4,] = c("Sukuma[1]","Borgerhoff Mulder","Tanzania", "Agropastoralism","Survived to 5","Random Sample",
              MergeRes(dSukuma1$age, dSukuma1$rs))
              skew_index_plot("M", Age=TRUE, Save="Sukuma[1]_Male_BorgerhoffMulder_M")
              skew_scatter_plot(dSukuma1$age, dSukuma1$rs, Save="Sukuma[1]_Male_BorgerhoffMulder_Scatter")
              skew_trace_plot(dSukuma1$age, Save="Sukuma[1]_Male_BorgerhoffMulder_Trace")   
 

 Res[5,] = c("Matsigenka","Revilla Minaya and Bunce","Peru", "Horticulture","Surviving","Census",
              MergeRes(dMatsigenka$age, dMatsigenka$rs))
              skew_index_plot("M", Age=TRUE, Save="Matsigenka_Male_RevillaMinayaAndBunce_M")
              skew_scatter_plot(dMatsigenka$age, dMatsigenka$rs, Save="Matsigenka_Male_RevillaMinayaAndBunce_Scatter")
              skew_trace_plot(dMatsigenka$age, Save="Matsigenka_Male_RevillaMinayaAndBunce_Trace")
 

 Res[6,] = c("Chagga","Caudell","Tanzania", "Agriculture","Surviving","Random Sample",
              MergeRes(dChagga$age, dChagga$rs))
              skew_index_plot("M", Age=TRUE, Save="Chagga_Male_Caudell_M")
              skew_scatter_plot(dChagga$age, dChagga$rs, Save="Chagga_Male_Caudell_Scatter")
              skew_trace_plot(dChagga$age, Save="Chagga_Male_Caudell_Trace")
 

 Res[7,] = c("Koore","Caudell","Ethiopia", "Agriculture","Surviving","Random Sample",
              MergeRes(dKoore$age, dKoore$rs))
              skew_index_plot("M", Age=TRUE, Save="Koore_Male_Caudell_M")
              skew_scatter_plot(dKoore$age, dKoore$rs, Save="Koore_Male_Caudell_Scatter")
              skew_trace_plot(dKoore$age, Save="Koore_Male_Caudell_Trace")
 

 Res[8,] = c("Maasai[1]","Caudell","Tanzania", "Agropastoralism","Surviving","Random Sample",
              MergeRes(dMaasai1$age, dMaasai1$rs))
              skew_index_plot("M", Age=TRUE, Save="Maasai[1]_Male_Caudell_M")
              skew_scatter_plot(dMaasai1$age, dMaasai1$rs, Save="Maasai[1]_Male_Caudell_Scatter")
              skew_trace_plot(dMaasai1$age, Save="Maasai[1]_Male_Caudell_Trace")
 

 Res[9,] = c("Maasai[2]","Caudell","Tanzania", "Agropastoralism","Surviving","Random Sample",
              MergeRes(dMaasai2$age, dMaasai2$rs))
              skew_index_plot("M", Age=TRUE, Save="Maasai[2]_Male_Caudell_M")
              skew_scatter_plot(dMaasai2$age, dMaasai2$rs, Save="Maasai[2]_Male_Caudell_Scatter")
              skew_trace_plot(dMaasai2$age, Save="Maasai[2]_Male_Caudell_Trace")
 

 Res[10,] = c("Sidama","Caudell","Ethiopia", "Agropastoralism","Surviving","Random Sample",
              MergeRes(dSidama$age, dSidama$rs))
              skew_index_plot("M", Age=TRUE, Save="Sidama_Male_Caudell_M")
              skew_scatter_plot(dSidama$age, dSidama$rs, Save="Sidama_Male_Caudell_Scatter")
              skew_trace_plot(dSidama$age, Save="Sidama_Male_Caudell_Trace")
 

 Res[11,] = c("Warusha","Caudell","Tanzania", "Agriculture","Surviving","Random Sample",
              MergeRes(dWarusha$age, dWarusha$rs))
              skew_index_plot("M", Age=TRUE, Save="Warusha_Male_Caudell_M")
              skew_scatter_plot(dWarusha$age, dWarusha$rs, Save="Warusha_Male_Caudell_Scatter")
              skew_trace_plot(dWarusha$age, Save="Warusha_Male_Caudell_Trace")
 

 Res[12,] = c("English","Clark","England", "Agriculture","Survived to 21","Random Sample",
              MergeRes(dEngland$age, dEngland$rs))
              skew_index_plot("M", Age=TRUE, Save="English_Male_Clark_M")
              skew_scatter_plot(dEngland$age, dEngland$rs, Save="English_Male_Clark_Scatter")
              skew_trace_plot(dEngland$age, Save="English_Male_Clark_Trace")
 

 Res[13,] = c("Maya[1]","Cortez and Winterhalder","Belize", "Agriculture","Surviving in Household","Census",
              MergeRes(dMaya1$age, dMaya1$rs))
              skew_index_plot("M", Age=TRUE, Save="Maya[1]_Male_CortezAndWinterhalder_M")
              skew_scatter_plot(dMaya1$age, dMaya1$rs, Save="Maya[1]_Male_CortezAndWinterhalder_Scatter")
              skew_trace_plot(dMaya1$age, Save="Maya[1]_Male_CortezAndWinterhalder_Trace")
 

 Res[14,] = c("Tsimane[2]","Godoy et al.","Bolivia", "Horticulture","Surviving","Census",
              MergeRes(dTsimane2$age, dTsimane2$rs))
              skew_index_plot("M", Age=TRUE, Save="Tsimane[2]_Male_GodoyEtAl_M")
              skew_scatter_plot(dTsimane2$age, dTsimane2$rs, Save="Tsimane[2]_Male_GodoyEtAl_Scatter")
              skew_trace_plot(dTsimane2$age, Save="Tsimane[2]_Male_GodoyEtAl_Trace")
 

 Res[15,] = c("Kung[1]","Howell and Draper","Botswana", "Foraging","Surviving","Census",
              MergeRes(dKung$age, dKung$rs))
              skew_index_plot("M", Age=TRUE, Save="Kung[1]_Male_HowellAndDraper_M")
              skew_scatter_plot(dKung$age, dKung$rs, Save="Kung[1]_Male_HowellAndDraper_Scatter")
              skew_trace_plot(dKung$age, Save="Kung[1]_Male_HowellAndDraper_Trace")
 

 Res[16,] = c("Agta[1]","Headland and Headland","Philippines", "Foraging","Survived to 5","Random Sample",
              MergeRes(dAgtaSIA$age, dAgtaSIA$rs))
              skew_index_plot("M", Age=TRUE, Save="Agta[1]_Male_HeadlandAndHeadland_M")
              skew_scatter_plot(dAgtaSIA$age, dAgtaSIA$rs, Save="Agta[1]_Male_HeadlandAndHeadland_Scatter")
              skew_trace_plot(dAgtaSIA$age, Save="Agta[1]_Male_HeadlandAndHeadland_Trace")
 

 Res[17,] = c("Aka","Hewlett","CAR", "Foraging","Surviving","Census",
              MergeRes(dAka$age, dAka$rs))
              skew_index_plot("M", Age=TRUE, Save="Aka_Male_Hewlett_M")
              skew_scatter_plot(dAka$age, dAka$rs, Save="Aka_Male_Hewlett_Scatter")
              skew_trace_plot(dAka$age, Save="Aka_Male_Hewlett_Trace")
 

 Res[18,] = c("Tyvans[1]","Hooper","Siberia", "Pastoralism","Surviving","Random Sample",
              MergeRes(dTyva$age, dTyva$rs))
              skew_index_plot("M", Age=TRUE, Save="Tyvans[1]_Male_Hooper_M")
              skew_scatter_plot(dTyva$age, dTyva$rs, Save="Tyvans[1]_Male_Hooper_Scatter")
              skew_trace_plot(dTyva$age, Save="Tyvans[1]_Male_Hooper_Trace")
 

 Res[19,] = c("Mayangna","Koster","Nicaragua", "Horticulture","Survived to 5","Random Sample",
              MergeRes(dMayangna$age, dMayangna$rs))
              skew_index_plot("M", Age=TRUE, Save="Mayangna_Male_Koster_M")
              skew_scatter_plot(dMayangna$age, dMayangna$rs, Save="Mayangna_Male_Koster_Scatter")
              skew_trace_plot(dMayangna$age, Save="Mayangna_Male_Koster_Trace")
 

 Res[20,] = c("Maya[2]","Kramer","Mexico", "Agriculture","Survived to 5","Census",
              MergeRes(dMaya2$age, dMaya2$rs))
              skew_index_plot("M", Age=TRUE, Save="Maya[2]_Male_Kramer_M")
              skew_scatter_plot(dMaya2$age, dMaya2$rs, Save="Maya[2]_Male_Kramer_Scatter")
              skew_trace_plot(dMaya2$age, Save="Maya[2]_Male_Kramer_Trace")
 

 Res[21,] = c("Pume","Kramer and Greaves","Venezuela", "Foraging","Surviving","Census",
              MergeRes(dPume$age, dPume$rs))
              skew_index_plot("M", Age=TRUE, Save="Pume_Male_Kramer_M")
              skew_scatter_plot(dPume$age, dPume$rs, Save="Pume_Male_Kramer_Scatter")
              skew_trace_plot(dPume$age, Save="Pume_Male_Kramer_Trace")
 

 Res[22,] = c("Saba (Black)","Leslie","Dutch Caribbean", "Market","Surviving","Census",
              MergeRes(dSabaBlack$age, dSabaBlack$rs))
              skew_index_plot("M", Age=TRUE, Save="SabaBlack_Male_Leslie_M")
              skew_scatter_plot(dSabaBlack$age, dSabaBlack$rs, Save="SabaBlack_Male_Leslie_Scatter")
              skew_trace_plot(dSabaBlack$age, Save="SabaBlack_Male_Leslie_Trace")
 

 Res[23,] = c("Saba (White)","Leslie","Dutch Caribbean", "Market","Surviving","Census",
              MergeRes(dSabaWhite$age, dSabaWhite$rs))
              skew_index_plot("M", Age=TRUE, Save="SabaWhite_Male_Leslie_M")
              skew_scatter_plot(dSabaWhite$age, dSabaWhite$rs, Save="SabaWhite_Male_Leslie_Scatter")
              skew_trace_plot(dSabaWhite$age, Save="SabaWhite_Male_Leslie_Trace")
 

 Res[24,] = c("Hadza[1]","Marlow","Tanzania", "Foraging","Surviving","Census",
              MergeRes(dHadza$age, dHadza$rs))
              skew_index_plot("M", Age=TRUE, Save="Hadza[1]_Male_Marlow_M")
              skew_scatter_plot(dHadza$age, dHadza$rs, Save="Hadza[1]_Male_Marlow_Scatter")
              skew_trace_plot(dHadza$age, Save="Hadza[1]_Male_Marlow_Trace")
 

 Res[25,] = c("Nyakyusa","McElreath","Tanzania", "Agropastoralism","Survived to 5","Random Sample",
              MergeRes(dNyakyusa$age, dNyakyusa$rs))
              skew_index_plot("M", Age=TRUE, Save="Nyakyusa_Male_McElreath_M")
              skew_scatter_plot(dNyakyusa$age, dNyakyusa$rs, Save="Nyakyusa_Male_McElreath_Scatter")
              skew_trace_plot(dNyakyusa$age, Save="Nyakyusa_Male_McElreath_Trace")
  

 Res[26,] = c("Sangu","McElreath","Tanzania", "Agropastoralism","Survived to 5","Random Sample",
              MergeRes(dSangu$age, dSangu$rs))
              skew_index_plot("M", Age=TRUE, Save="Sangu_Male_McElreath_M")
              skew_scatter_plot(dSangu$age, dSangu$rs, Save="Sangu_Male_McElreath_Scatter")
              skew_trace_plot(dSangu$age, Save="Sangu_Male_McElreath_Trace")
 

 Res[27,] = c("Sukuma[2]","McElreath","Tanzania", "Agropastoralism","Survived to 5","Random Sample",
              MergeRes(dSukuma2$age, dSukuma2$rs))
              skew_index_plot("M", Age=TRUE, Save="Sukuma[2]_Male_McElreath_M")
              skew_scatter_plot(dSukuma2$age, dSukuma2$rs, Save="Sukuma[2]_Male_McElreath_Scatter")
              skew_trace_plot(dSukuma2$age, Save="Sukuma[2]_Male_McElreath_Trace")
 

 Res[28,] = c("Lamalera","Nolin","Indonesia", "Foraging","Surviving","Census",
              MergeRes(dLamalera$age, dLamalera$rs))
              skew_index_plot("M", Age=TRUE, Save="Lamalera_Male_Nolin_M")
              skew_scatter_plot(dLamalera$age, dLamalera$rs, Save="Lamalera_Male_Nolin_Scatter")
              skew_trace_plot(dLamalera$age, Save="Lamalera_Male_Nolin_Trace")
 

 Res[29,] = c("Himba","Scelza","Namibia", "Pastoralism","Survived to 5","Random Sample",
              MergeRes(dHimba$age, dHimba$rs))
              skew_index_plot("M", Age=TRUE, Save="Himba_Male_Scelza_M")
              skew_scatter_plot(dHimba$age, dHimba$rs, Save="Himba_Male_Scelza_Scatter")
              skew_trace_plot(dHimba$age, Save="Himba_Male_Scelza_Trace")
 

 Res[30,] = c("Makushi","Schacht","Guyana", "Horticulture","Surviving","Random Sample",
              MergeRes(dMakushi$age, dMakushi$rs))
              skew_index_plot("M", Age=TRUE, Save="Makushi_Male_Schacht_M")
              skew_scatter_plot(dMakushi$age, dMakushi$rs, Save="Makushi_Male_Schacht_Scatter")
              skew_trace_plot(dMakushi$age, Save="Makushi_Male_Schacht_Trace")
  

 Res[31,] = c("Bengali","Shenk","Bangladesh", "Agriculture","Survived to 10","Random Sample",
              MergeRes(dBengali$age, dBengali$rs))
              skew_index_plot("M", Age=TRUE, Save="Bengali_Male_Shenk_M")
              skew_scatter_plot(dBengali$age, dBengali$rs, Save="Bengali_Male_Shenk_Scatter")
              skew_trace_plot(dBengali$age, Save="Bengali_Male_Shenk_Trace")
 

 Res[32,] = c("Meriam","Smith","Australia", "Foraging","Surviving","Census",
              MergeRes(dMeriam$age, dMeriam$rs))
              skew_index_plot("M", Age=TRUE, Save="Meriam_Male_Smith_M")
              skew_scatter_plot(dMeriam$age, dMeriam$rs, Save="Meriam_Male_Smith_Scatter")
              skew_trace_plot(dMeriam$age, Save="Meriam_Male_Smith_Trace")
 

 Res[33,] = c("Sukuma","Solerno","Tanzania", "Agropastoralism","Surviving Sons","Random Sample",
              MergeRes(dSukuma3$age, dSukuma3$rs))
              skew_index_plot("M", Age=TRUE, Save="Sukuma[3]_Male_Solerno_M")
              skew_scatter_plot(dSukuma3$age, dSukuma3$rs, Save="Sukuma[3]_Male_Solerno_Scatter")
              skew_trace_plot(dSukuma3$age, Save="Sukuma[3]_Male_Solerno_Trace")
 

 Res[34,] = c("Dolgan","Ziker","Siberia", "Foraging","Surviving","Random Sample",
              MergeRes(dDolgan$age, dDolgan$rs))
              skew_index_plot("M", Age=TRUE, Save="Dolgan_Male_Ziker_M")
              skew_scatter_plot(dDolgan$age, dDolgan$rs, Save="Dolgan_Male_Ziker_Scatter")
              skew_trace_plot(dDolgan$age, Save="Dolgan_Male_Ziker_Trace")
  

 Res[35,] = c("Nganasan","Ziker","Siberia", "Foraging","Surviving","Random Sample",
              MergeRes(dNganasan$age, dNganasan$rs))
              skew_index_plot("M", Age=TRUE, Save="Nganasan_Male_Ziker_M")
              skew_scatter_plot(dNganasan$age, dNganasan$rs, Save="Nganasan_Male_Ziker_Scatter")
              skew_trace_plot(dNganasan$age, Save="Nganasan_Male_Ziker_Trace")
  

 Res[36,] = c("Hadza[2]","Wood","Tanzania", "Foraging","Survived to 5","Random Sample",
              MergeRes(dHadza2$age, dHadza2$rs))
              skew_index_plot("M", Age=TRUE, Save="Hadza[2]_Male_Wood_M")
              skew_scatter_plot(dHadza2$age, dHadza2$rs, Save="Hadza[2]_Male_Wood_Scatter")
              skew_trace_plot(dHadza2$age, Save="Hadza[2]_Male_Wood_Trace")
 

 Res[37,] = c("Mestizo[1]","Revilla Minaya and Bunce","Peru", "Market","Surviving","Random Sample",
              MergeRes(dMestizo$age, dMestizo$rs))
              skew_index_plot("M", Age=TRUE, Save="Mestizo[1]_Male_RevillaMinayaAndBunce_M")
              skew_scatter_plot(dMestizo$age, dMestizo$rs, Save="Mestizo[1]_Male_RevillaMinayaAndBunce_Scatter")
              skew_trace_plot(dMestizo$age, Save="Mestizo[1]_Male_RevillaMinayaAndBunce_Trace")
  

  Res[38,] = c("Ache","Hill","Paraguay", "Foraging","Surviving","Census",
              MergeRes(dAche$age, dAche$rs))
              skew_index_plot("M", Age=TRUE, Save="Ache_Male_Hill_M")
              skew_scatter_plot(dAche$age, dAche$rs, Save="Ache_Male_Hill_Scatter")
              skew_trace_plot(dAche$age, Save="Ache_Male_Hill_Trace")
  

  Res[39,] = c("Hiwi","Hill","Venezuela", "Foraging","Surviving","Census",
              MergeRes(dHiwi$age, dHiwi$rs))
              skew_index_plot("M", Age=TRUE, Save="Hiwi_Male_Hill_M")
              skew_scatter_plot(dHiwi$age, dHiwi$rs, Save="Hiwi_Male_Hill_Scatter")
              skew_trace_plot(dHiwi$age, Save="Hiwi_Male_Hill_Trace")
  

  Res[40,] = c("Toba","Valeggia","Argentina", "Foraging","Surviving","Sample",
              MergeRes(dToba$age, dToba$rs))
              skew_index_plot("M", Age=TRUE, Save="Toba_Male_Valeggia_M")
              skew_scatter_plot(dToba$age, dToba$rs, Save="Toba_Male_Valeggia_Scatter")
              skew_trace_plot(dToba$age, Save="Toba_Male_Valeggia_Trace")
  

 Res[41,] = c("Hadza[3]","Blurton Jones","Tanzania", "Foraging","Surviving","Census",
              MergeRes(dHadza3$age, dHadza3$rs))
              skew_index_plot("M", Age=TRUE, Save="Hadza[3]_Male_BlurtonJones_M")
              skew_scatter_plot(dHadza3$age, dHadza3$rs, Save="Hadza[3]_Male_BlurtonJones_Scatter")
              skew_trace_plot(dHadza3$age, Save="Hadza[3]_Male_BlurtonJones_Trace")
 

 Res[42,] = c("Ammonni","Bonte","Mauritania", "Nomadic","Genealogical Descendants","Genealogy",
              MergeRes(dAmmonni$age, dAmmonni$rs))
              skew_index_plot("M", Age=TRUE, Save="Ammonni_Male_Bonte_M")
              skew_scatter_plot(dAmmonni$age, dAmmonni$rs, Save="Ammonni_Male_Bonte_Scatter")
              skew_trace_plot(dAmmonni$age, Save="Ammonni_Male_Bonte_Trace")
 

 Res[43,] = c("Torshan","Botte","Mauritania", "Nomadic","Genealogical Descendants","Genealogy",
              MergeRes(dTorshan$age, dTorshan$rs))
              skew_index_plot("M", Age=TRUE, Save="Torshan_Male_Botte_M")
              skew_scatter_plot(dTorshan$age, dTorshan$rs, Save="Torshan_Male_Botte_Scatter")
              skew_trace_plot(dTorshan$age, Save="Torshan_Male_Botte_Trace")
 

 Res[44,] = c("Alyawarra","Denham","Australia", "Foraging","Genealogical Descendants","Genealogy",
              MergeRes(dAlyawarra$age, dAlyawarra$rs))
              skew_index_plot("M", Age=TRUE, Save="Alyawarra_Male_Denham_M")
              skew_scatter_plot(dAlyawarra$age, dAlyawarra$rs, Save="Alyawarra_Male_Denham_Scatter")
              skew_trace_plot(dAlyawarra$age, Save="Alyawarra_Male_Denham_Trace")
  

 Res[45,] = c("Tikuna","Echeverri","Colombia", "Horticulture","Genealogical Descendants","Genealogy",
              MergeRes(dTikuna$age, dTikuna$rs))
              skew_index_plot("M", Age=TRUE, Save="Tikuna_Male_Echeverri_M")
              skew_scatter_plot(dTikuna$age, dTikuna$rs, Save="Tikuna_Male_Echeverri_Scatter")
              skew_trace_plot(dTikuna$age, Save="Tikuna_Male_Echeverri_Trace")
  

 Res[46,] = c("Chuukese ","Goodenough","Micronesia", "Horticulture","Genealogical Descendants","Genealogy",
              MergeRes(dChuukese$age, dChuukese$rs))
              skew_index_plot("M", Age=TRUE, Save="Chuukese_Male_Goodenough_M")
              skew_scatter_plot(dChuukese$age, dChuukese$rs, Save="Chuukese_Male_Goodenough_Scatter")
              skew_trace_plot(dChuukese$age, Save="Chuukese_Male_Goodenough_Trace")
 

 Res[47,] = c("Apache","Goodwin","USA", "Horticulture","Genealogical Descendants","Genealogy",
              MergeRes(dApache$age, dApache$rs))
              skew_index_plot("M", Age=TRUE, Save="Apache_Male_Goodwin_M")
              skew_scatter_plot(dApache$age, dApache$rs, Save="Apache_Male_Goodwin_Scatter")
              skew_trace_plot(dApache$age, Save="Apache_Male_Goodwin_Trace")
 

 Res[48,] = c("Nunamiut","Gubser","USA", "Foraging","Genealogical Descendants","Genealogy",
              MergeRes(dNunamiut$age, dNunamiut$rs))
              skew_index_plot("M", Age=TRUE, Save="Nunamiut_Male_Gubser_M")
              skew_scatter_plot(dNunamiut$age, dNunamiut$rs, Save="Nunamiut_Male_Gubser_Scatter")
              skew_trace_plot(dNunamiut$age, Save="Nunamiut_Male_Gubser_Trace")
  

 Res[49,] = c("European Royalty","Hamberger","Europe", "Agriculture","Genealogical Descendants","Genealogy",
              MergeRes(dRoyals$age, dRoyals$rs))
              skew_index_plot("M", Age=TRUE, Save="Royalty_Male_Hamberger_M")
              skew_scatter_plot(dRoyals$age, dRoyals$rs, Save="Royalty_Male_Hamberger_Scatter")
              skew_trace_plot(dRoyals$age, Save="Royalty_Male_Hamberger_Trace")
  

 Res[50,] = c("Tiwi","Hart","Australia", "Foraging","Surviving","Sample",
              MergeRes(dTiwi$age, dTiwi$rs))
              skew_index_plot("M", Age=TRUE, Save="Tiwi_Male_Hart_M")
              skew_scatter_plot(dTiwi$age, dTiwi$rs, Save="Tiwi_Male_Hart_Scatter")
              skew_trace_plot(dTiwi$age, Save="Tiwi_Male_Hart_Trace")
 

 Res[51,] = c("Afrobrasilians","Hartung","Brazil", "Peasants","Genealogical Descendants","Genealogy",
              MergeRes(dAfrobrasilians$age, dAfrobrasilians$rs))
              skew_index_plot("M", Age=TRUE, Save="Afrobrasilians_Male_Hartung_M")
              skew_scatter_plot(dAfrobrasilians$age, dAfrobrasilians$rs, Save="Afrobrasilians_Male_Hartung_Scatter")
              skew_trace_plot(dAfrobrasilians$age, Save="Afrobrasilians_Male_Hartung_Trace")
  

 Res[52,] = c("Slavey","Helm","Canada", "Foraging","Genealogical Descendants","Genealogy",
              MergeRes(dSlavey$age, dSlavey$rs))
              skew_index_plot("M", Age=TRUE, Save="Slavey_Male_Helm_M")
              skew_scatter_plot(dSlavey$age, dSlavey$rs, Save="Slavey_Male_Helm_Scatter")
              skew_trace_plot(dSlavey$age, Save="Slavey_Male_Helm_Trace")
 

 Res[53,] = c("Inuit","Holmes","Greenland", "Foraging","Genealogical Descendants","Genealogy",
              MergeRes(dInuit$age, dInuit$rs))
              skew_index_plot("M", Age=TRUE, Save="Inuit_Male_Holmes_M")
              skew_scatter_plot(dInuit$age, dInuit$rs, Save="Inuit_Male_Holmes_Scatter")
              skew_trace_plot(dInuit$age, Save="Inuit_Male_Holmes_Trace")
    

 Res[54,] = c("Sainte Catherine","Legrand","Canada", "Market","Genealogical Descendants","Genealogy",
              MergeRes(dSainteCatherine$age, dSainteCatherine$rs))
              skew_index_plot("M", Age=TRUE, Save="SainteCatherine_Male_Legrand_M")
              skew_scatter_plot(dSainteCatherine$age, dSainteCatherine$rs, Save="SainteCatherine_Male_Legrand_Scatter")
              skew_trace_plot(dSainteCatherine$age, Save="SainteCatherine_Male_Legrand_Trace")
  

 Res[55,] = c("Turkana[1]","Leslie","Kenya", "Agropastoralism","Survived to 5","Random Sample",
              MergeRes(dTurkanaNomadic$age, dTurkanaNomadic$rs))
              skew_index_plot("M", Age=TRUE, Save="TurkanaNomadic_Male_Leslie_M")
              skew_scatter_plot(dTurkanaNomadic$age, dTurkanaNomadic$rs, Save="TurkanaNomadic_Male_Leslie_Scatter")
              skew_trace_plot(dTurkanaNomadic$age, Save="TurkanaNomadic_Male_Leslie_Trace")
    

 Res[56,] = c("Turkana[2]","Leslie","Kenya", "Agropastoralism","Survived to 5","Random Sample",
              MergeRes(dTurkanaSettled$age, dTurkanaSettled$rs))
              skew_index_plot("M", Age=TRUE, Save="TurkanaSettled_Male_Leslie_M")
              skew_scatter_plot(dTurkanaSettled$age, dTurkanaSettled$rs, Save="TurkanaSettled_Male_Leslie_Scatter")
              skew_trace_plot(dTurkanaSettled$age, Save="TurkanaSettled_Male_Leslie_Trace")
    

 Res[57,] = c("Achuar","Mader","Peru", "Horticulture","Genealogical Descendants","Genealogy",
              MergeRes(dAchuar$age, dAchuar$rs))
              skew_index_plot("M", Age=TRUE, Save="Achuar_Male_Mader_M")
              skew_scatter_plot(dAchuar$age, dAchuar$rs, Save="Achuar_Male_Mader_Scatter")
              skew_trace_plot(dAchuar$age, Save="Achuar_Male_Mader_Trace")
  

 Res[58,] = c("Dogon","MarieHelene","Mali", "Agriculture","Genealogical Descendants","Genealogy",
              MergeRes(dDogon$age, dDogon$rs))
              skew_index_plot("M", Age=TRUE, Save="Dogon_Male_MarieHelene_M")
              skew_scatter_plot(dDogon$age, dDogon$rs, Save="Dogon_Male_MarieHelene_Scatter")
              skew_trace_plot(dDogon$age, Save="Dogon_Male_MarieHelene_Trace")
  

 Res[59,] = c("Kung[2]","Marshall","Botswana", "Foraging","Genealogical Descendants","Genealogy",
              MergeRes(dKung2$age, dKung2$rs))
              skew_index_plot("M", Age=TRUE, Save="Kung[2]_Male_Marshall_M")
              skew_scatter_plot(dKung2$age, dKung2$rs, Save="Kung[2]_Male_Marshall_Scatter")
              skew_trace_plot(dKung2$age, Save="Kung[2]_Male_Marshall_Trace")
  

 Res[60,] = c("Pere","Mead","New Guinea", "Foraging","Genealogical Descendants","Genealogy",
              MergeRes(dPere$age, dPere$rs))
              skew_index_plot("M", Age=TRUE, Save="Pere_Male_Mead_M")
              skew_scatter_plot(dPere$age, dPere$rs, Save="Pere_Male_Mead_Scatter")
              skew_trace_plot(dPere$age, Save="Pere_Male_Mead_Trace")
  

 Res[61,] = c("Ojibwa","Rogers","Canada", "Foraging","Genealogical Descendants","Genealogy",
              MergeRes(dOjibwa$age, dOjibwa$rs))
              skew_index_plot("M", Age=TRUE, Save="Ojibwa_Male_Rogers_M")
              skew_scatter_plot(dOjibwa$age, dOjibwa$rs, Save="Ojibwa_Male_Rogers_Scatter")
              skew_trace_plot(dOjibwa$age, Save="Ojibwa_Male_Rogers_Trace")
      

 Res[62,] = c("Wanindiljaugwa","Rose","Australia", "Foraging","Genealogical Descendants","Genealogy",
              MergeRes(dWanindiljaugwa$age, dWanindiljaugwa$rs))
              skew_index_plot("M", Age=TRUE, Save="Wanindiljaugwa_Male_Rose_M")
              skew_scatter_plot(dWanindiljaugwa$age, dWanindiljaugwa$rs, Save="Wanindiljaugwa_Male_Rose_Scatter")
              skew_trace_plot(dWanindiljaugwa$age, Save="Wanindiljaugwa_Male_Rose_Trace")
   

 Res[63,] = c("Cocama","Ruiz","Peru", "Horticulture","Genealogical Descendants","Genealogy",
              MergeRes(dCocama$age, dCocama$rs))
              skew_index_plot("M", Age=TRUE, Save="Cocama_Male_Ruiz_M")
              skew_scatter_plot(dCocama$age, dCocama$rs, Save="Cocama_Male_Ruiz_Scatter")
              skew_trace_plot(dCocama$age, Save="Cocama_Male_Ruiz_Trace")
  

 Res[64,] = c("Xavante","Salzano","Brazil", "Horticulture","Surviving","Census",
              MergeRes(dXavante$age, dXavante$rs))
              skew_index_plot("M", Age=TRUE, Save="Xavante_Male_Salzano_M")
              skew_scatter_plot(dXavante$age, dXavante$rs, Save="Xavante_Male_Salzano_Scatter")
              skew_trace_plot(dXavante$age, Save="Xavante_Male_Salzano_Trace")
  

 Res[65,] = c("Semang","Schebesta","Malaysia", "Foraging","Genealogical Descendants","Genealogy",
              MergeRes(dSemang$age, dSemang$rs))
              skew_index_plot("M", Age=TRUE, Save="Semang_Male_Schebesta_M")
              skew_scatter_plot(dSemang$age, dSemang$rs, Save="Semang_Male_Schebesta_Scatter")
              skew_trace_plot(dSemang$age, Save="Semang_Male_Schebesta_Trace")
    

 Res[66,] = c("Gambians","Sear","Gambia", "Agricultural","Survided to 5","Census",
              MergeRes(dGambia$age, dGambia$rs))
              skew_index_plot("M", Age=TRUE, Save="Gambians_Male_Sear_M")
              skew_scatter_plot(dGambia$age, dGambia$rs, Save="Gambians_Male_Sear_Scatter")
              skew_trace_plot(dGambia$age, Save="Gambians_Male_Sear_Trace")
 

 Res[67,] = c("Waimiri","Silva","Brazil", "Horticulture","Genealogical Descendants","Genealogy",
              MergeRes(dWaimiri$age, dWaimiri$rs))
              skew_index_plot("M", Age=TRUE, Save="Waimiri_Male_Silva_M")
              skew_scatter_plot(dWaimiri$age, dWaimiri$rs, Save="Waimiri_Male_Silva_Scatter")
              skew_trace_plot(dWaimiri$age, Save="Waimiri_Male_Silva_Trace")
 

 Res[68,] = c("Warao","Wilbert","Venezuela", "Horticulture","Genealogical Descendants","Genealogy",
              MergeRes(dWarao$age, dWarao$rs))
              skew_index_plot("M", Age=TRUE, Save="Warao_Male_Wilbert_M")
              skew_scatter_plot(dWarao$age, dWarao$rs, Save="Warao_Male_Wilbert_Scatter")
              skew_trace_plot(dWarao$age, Save="Warao_Male_Wilbert_Trace")
   

 Res[69,] = c("Lapp","Withaker","Scandinavia", "Nomadic","Genealogical Descendants","Genealogy",
              MergeRes(dLapp$age, dLapp$rs))
              skew_index_plot("M", Age=TRUE, Save="Lapp_Male_Withaker_M")
              skew_scatter_plot(dLapp$age, dLapp$rs, Save="Lapp_Male_Withaker_Scatter")
              skew_trace_plot(dLapp$age, Save="Lapp_Male_Withaker_Trace")
  

 Res[70,] = c("Krummhorn","Willfuehr","Germany", "Agriculture","Survived to 15","Genealogy",
              MergeRes(dKrummhorn$age, dKrummhorn$rs))
              skew_index_plot("M", Age=TRUE, Save="Krummhorn_Male_Willfuehr_M")
              skew_scatter_plot(dKrummhorn$age, dKrummhorn$rs, Save="Krummhorn_Male_Willfuehr_Scatter")
              skew_trace_plot(dKrummhorn$age, Save="Krummhorn_Male_Willfuehr_Trace")
    

 Res[71,] = c("Miskito","Koster","Nicaragua", "Horticulture","Survived to 5","Random Sample",
              MergeRes(dMiskito$age, dMiskito$rs))
              skew_index_plot("M", Age=TRUE, Save="Miskito_Male_Koster_M")
              skew_scatter_plot(dMiskito$age, dMiskito$rs, Save="Miskito_Male_Koster_Scatter")
              skew_trace_plot(dMiskito$age, Save="Miskito_Male_Koster_Trace")
  
  
  Res[72,] = c("Tanna[1]","Atkinson","Vanuatu", "Horticulture","Children had","Random Sample",
              MergeRes(dCoastalTanna$age, dCoastalTanna$rs))
              skew_index_plot("M", Age=TRUE, Save="CoastalTanna_Male_Atkinson_M")
              skew_scatter_plot(dCoastalTanna$age, dCoastalTanna$rs, Save="CoastalTanna_Male_Atkinson_Scatter")
              skew_trace_plot(dCoastalTanna$age, Save="CoastalTanna_Male_Atkinson_Trace")
  

  Res[73,] = c("Tanna[2]","Atkinson","Vanuatu", "Horticulture","Children had","Random Sample",
              MergeRes(dInlandTanna$age, dInlandTanna$rs))
              skew_index_plot("M", Age=TRUE, Save="InlandTanna_Male_Atkinson_M")
              skew_scatter_plot(dInlandTanna$age, dInlandTanna$rs, Save="InlandTanna_Male_Atkinson_Scatter")
              skew_trace_plot(dInlandTanna$age, Save="InlandTanna_Male_Atkinson_Trace")
  
  
  Res[74,] = c("Hadza[4]","Apicella","Tanzania", "Foraging","Children had","Census",
              MergeRes(dHadza4$age, dHadza4$rs))
              skew_index_plot("M", Age=TRUE, Save="Hadza[4]_Male_Apicella_M")
              skew_scatter_plot(dHadza4$age, dHadza4$rs, Save="Hadza[4]_Male_Apicella_Scatter")
              skew_trace_plot(dHadza4$age, Save="Hadza[4]_Male_Apicella_Trace")
  
  
 Res[75,] = c("Pesqueiro","Cohen","Brazil", "Market","Children had","Census",
              MergeRes(dPesqueiro$age, dPesqueiro$rs))
              skew_index_plot("M", Age=TRUE, Save="Pesqueiro_Male_Cohen_M")
              skew_scatter_plot(dPesqueiro$age, dPesqueiro$rs, Save="Pesqueiro_Male_Cohen_Scatter")
              skew_trace_plot(dPesqueiro$age, Save="Pesqueiro_Male_Cohen_Trace")
  
 
 Res[76,] = c("Yasawa","McNamara","Fiji", "Fishing","Children had","Random Sample",
              MergeRes(dYasawa$age, dYasawa$rs))
              skew_index_plot("M", Age=TRUE, Save="Yasawa_Male_McNamara_M")
              skew_scatter_plot(dYasawa$age, dYasawa$rs, Save="Yasawa_Male_McNamara_Scatter")
              skew_trace_plot(dYasawa$age, Save="Yasawa_Male_McNamara_Trace")
   
  
 Res[77,] = c("Tyvans[2]","Purzycki","Siberia", "Pastoralism","Children had","Random Sample",
              MergeRes(dTyva2$age, dTyva2$rs))
              skew_index_plot("M", Age=TRUE, Save="Tyvans[2]_Male_Purzycki_M")
              skew_scatter_plot(dTyva2$age, dTyva2$rs, Save="Tyvans[2]_Male_Purzycki_Scatter")
              skew_trace_plot(dTyva2$age, Save="Tyvans[2]_Male_Purzycki_Trace")
   
 
  Res[78,] = c("Lovu","Willard","Fiji", "Market","Children had","Random Sample",
              MergeRes(dLovu$age, dLovu$rs))
              skew_index_plot("M", Age=TRUE, Save="Lovu_Male_Willard_M")
              skew_scatter_plot(dLovu$age, dLovu$rs, Save="Lovu_Male_Willard_Scatter")
              skew_trace_plot(dLovu$age, Save="Lovu_Male_Willard_Trace")
  
 
  Res[79,] = c("Mauritius","Xygalatas","Mauritius", "Market","Children had","Random Sample",
              MergeRes(dMauritius$age, dMauritius$rs))
              skew_index_plot("M", Age=TRUE, Save="Mauritius_Male_Xygalatas_M")
              skew_scatter_plot(dMauritius$age, dMauritius$rs, Save="Mauritius_Male_Xygalatas_Scatter")
              skew_trace_plot(dMauritius$age, Save="Mauritius_Male_Xygalatas_Trace")
    
 
 Res[80,] = c("Afrocolombians[1]","Ross","Colombia", "Fishing","Surviving Children","Census",
              MergeRes(dAfrocolombians$age, dAfrocolombians$rs))
              skew_index_plot("M", Age=TRUE, Save="Afrocolombians[1]_Male_Ross_M")
              skew_scatter_plot(dAfrocolombians$age, dAfrocolombians$rs, Save="Afrocolombians[1]_Male_Ross_Scatter")
              skew_trace_plot(dAfrocolombians$age, Save="Afrocolombians[1]_Male_Ross_Trace")
   
 
  Res[81,] = c("Embera","Ross","Colombia", "Horticulture","Surviving Children","Random Sample",
              MergeRes(dEmbera$age, dEmbera$rs))
              skew_index_plot("M", Age=TRUE, Save="Embera_Male_Ross_M")
              skew_scatter_plot(dEmbera$age, dEmbera$rs, Save="Embera_Male_Ross_Scatter")
              skew_trace_plot(dEmbera$age, Save="Embera_Male_Ross_Trace")
   

  Res[82,] = c("Afrocolombians[2]","Ross","Colombia", "Horticulture","Surviving Children","Census",
              MergeRes(dAfrocolombians2$age, dAfrocolombians2$rs))
              skew_index_plot("M", Age=TRUE, Save="Afrocolombians[2]_Male_Ross_M")
              skew_scatter_plot(dAfrocolombians2$age, dAfrocolombians2$rs, Save="Afrocolombians[2]_Male_Ross_Scatter")
              skew_trace_plot(dAfrocolombians2$age, Save="Afrocolombians[2]_Male_Ross_Trace")
 

  Res[83,] = c("Interculturales","Pisor","Bolivia", "Horticulture","Surviving Children","Random Sample",
              MergeRes(dInterculturales$age, dInterculturales$rs))
              skew_index_plot("M", Age=TRUE, Save="Interculturales_Male_Pisor_M")
              skew_scatter_plot(dInterculturales$age, dInterculturales$rs, Save="Interculturales_Male_Pisor_Scatter")
              skew_trace_plot(dInterculturales$age, Save="Interculturales_Male_Pisor_Trace")
 

  Res[84,] = c("Moseten","Pisor","Bolivia", "Horticulture","Surviving Children","Random Sample",
              MergeRes(dMoseten$age, dMoseten$rs))
              skew_index_plot("M", Age=TRUE, Save="Moseten_Male_Pisor_M")
              skew_scatter_plot(dMoseten$age, dMoseten$rs, Save="Moseten_Male_Pisor_Scatter")
              skew_trace_plot(dMoseten$age, Save="Moseten_Male_Pisor_Trace")
 

  Res[85,] = c("Altiplano[1]","Moya","Peru", "Agropastoral","Surviving Children","Random Sample",
              MergeRes(dAltiplano1$age, dAltiplano1$rs))
              skew_index_plot("M", Age=TRUE, Save="Altiplano[1]_Male_Moya_M")
              skew_scatter_plot(dAltiplano1$age, dAltiplano1$rs, Save="Altiplano[1]_Male_Moya_Scatter")
              skew_trace_plot(dAltiplano1$age, Save="Altiplano[1]_Male_Moya_Trace")
 

  Res[86,] = c("Altiplano[2]","Moya","Peru", "Agropastoral","Surviving Children","Random Sample",
              MergeRes(dAltiplano2$age, dAltiplano2$rs))
              skew_index_plot("M", Age=TRUE, Save="Altiplano[2]_Male_Moya_M")
              skew_scatter_plot(dAltiplano2$age, dAltiplano2$rs, Save="Altiplano[2]_Male_Moya_Scatter")
              skew_trace_plot(dAltiplano2$age, Save="Altiplano[2]_Male_Moya_Trace")
 

 Res[87,] = c("Finnish","Lummaa","Finland", "Agriculture","Survived to 15","Census",
              MergeRes(dFinland$age, dFinland$rs))
              skew_index_plot("M", Age=TRUE, Save="Finnish_Male_Lummaa_M")
              skew_scatter_plot(dFinland$age, dFinland$rs, Save="Finnish_Male_Lummaa_Scatter")
              skew_trace_plot(dFinland$age, Save="Finnish_Male_Lummaa_Trace")
 

 Res[88,] = c("Shodagor","Starkweather","Bangladesh", "Fishing","Surviving Children","Census",
              MergeRes(dShodagor$age, dShodagor$rs))
              skew_index_plot("M", Age=TRUE, Save="Shodagor_Male_Starkweather_M")
              skew_scatter_plot(dShodagor$age, dShodagor$rs, Save="Shodagor_Male_Starkweather_Scatter")
              skew_trace_plot(dShodagor$age, Save="Shodagor_Male_Starkweather_Trace")
 

 Res[89,] = c("Polish","Colleran","Poland", "Agriculture","Children had","Census",
              MergeRes(dPoland$age, dPoland$rs))
              skew_index_plot("M", Age=TRUE, Save="Polish_Male_Colleran_M")
              skew_scatter_plot(dPoland$age, dPoland$rs, Save="Polish_Male_Colleran_Scatter")
              skew_trace_plot(dPoland$age, Save="Polish_Male_Colleran_Trace")
 

 dBari$age  =  rep(60, length(dBari$rs))                                                  
 Res[90,] = c("Bari","Beckerman","Venezuela", "Fishing","Survived to 15","Random Sample",  
              MergeRes(dBari$age, dBari$rs))
              skew_index_plot("M", Age=TRUE, Save="Bari_Male_Beckerman_M")
              skew_scatter_plot(dBari$age, dBari$rs, Save="Bari_Male_Beckerman_Scatter")
              skew_trace_plot(dBari$age, Save="Bari_Male_Beckerman_Trace") 
 

 Res[91,] = c("Mestizo[2]","Ross","Colombia", "Market","Surviving Children","Census",
              MergeRes(dMestizo2$age, dMestizo2$rs))
              skew_index_plot("M", Age=TRUE, Save="Mestizo[2]_Male_Ross_M")
              skew_scatter_plot(dMestizo2$age, dMestizo2$rs, Save="Mestizo[2]_Male_Ross_Scatter")
              skew_trace_plot(dMestizo2$age, Save="Mestizo[2]_Male_Ross_Trace")
 
  Res[92,] = c("Mestizo[3]","Ross","Colombia", "Agriculture","Surviving Children","Census",
              MergeRes(dMestizo3$age, dMestizo3$rs))
              skew_index_plot("M", Age=TRUE, Save="Mestizo[3]_Male_Ross_M")
              skew_scatter_plot(dMestizo3$age, dMestizo3$rs, Save="Mestizo[3]_Male_Ross_Scatter")
              skew_trace_plot(dMestizo3$age, Save="Mestizo[3]_Male_Ross_Trace")

  Res[93,] = c("Darkhad","Hooper","Mongolia", "Pastoralism","Surviving Children","Census",
              MergeRes(dDarkhad$age, dDarkhad$rs))
              skew_index_plot("M", Age=TRUE, Save="Darkhad_Male_Hooper_M")
              skew_scatter_plot(dDarkhad$age, dDarkhad$rs, Save="Darkhad_Male_Hooper_Scatter")
              skew_trace_plot(dDarkhad$age, Save="Darkhad_Male_Hooper_Trace")

  Res[94,] = c("ArsiOromo[1]","Gibson","Ethiopia", "Agriculture","Surviving Children","Random Sample",
              MergeRes(dArsiOromo$age, dArsiOromo$rs_surviving))
              skew_index_plot("M", Age=TRUE, Save="ArsiOromo[1]_Male_Gibson_M")
              skew_scatter_plot(dArsiOromo$age, dArsiOromo$rs_surviving, Save="ArsiOromo[1]_Male_Gibson_Scatter")
              skew_trace_plot(dArsiOromo$age, Save="ArsiOromo[1]_Male_Gibson_Trace")

  Res[95,] = c("ArsiOromo[2]","Gibson","Ethiopia", "Agriculture","Surviving Children","Random Sample",
              MergeRes(dArsiOromo2$age, dArsiOromo2$rs_surviving))
              skew_index_plot("M", Age=TRUE, Save="ArsiOromo[2]_Male_Gibson_M")
              skew_scatter_plot(dArsiOromo2$age, dArsiOromo2$rs_surviving, Save="ArsiOromo[2]_Male_Gibson_Scatter")
              skew_trace_plot(dArsiOromo2$age, Save="ArsiOromo[2]_Male_Gibson_Trace")

  Res[96,] = c("ArsiOromo[3]","Gibson","Ethiopia", "Agriculture","Surviving Children","Random Sample",
              MergeRes(dArsiOromo3$age, dArsiOromo3$rs_surviving))
              skew_index_plot("M", Age=TRUE, Save="ArsiOromo[3]_Male_Gibson_M")
              skew_scatter_plot(dArsiOromo3$age, dArsiOromo3$rs_surviving, Save="ArsiOromo[3]_Male_Gibson_Scatter")
              skew_trace_plot(dArsiOromo3$age, Save="ArsiOromo[3]_Male_Gibson_Trace")

  Res[97,] = c("BajaCalifornians[1]","Macfarlan","Mexico", "Ranching","Surviving Children","Census",
              MergeRes(dBaja1$age, dBaja1$rs))
              skew_index_plot("M", Age=TRUE, Save="BajaCalifornians[1]_Male_Macfarlan_M")
              skew_scatter_plot(dBaja1$age, dBaja1$rs, Save="BajaCalifornians[1]_Male_Macfarlan_Scatter")
              skew_trace_plot(dBaja1$age, Save="BajaCalifornians[1]_Male_Macfarlan_Trace")

  Res[98,] = c("BajaCalifornians[2]","Macfarlan","Mexico", "Ranching","Surviving Children","Census",
              MergeRes(dBaja2$age, dBaja2$rs))
              skew_index_plot("M", Age=TRUE, Save="BajaCalifornians[2]_Male_Macfarlan_M")
              skew_scatter_plot(dBaja2$age, dBaja2$rs, Save="BajaCalifornians[2]_Male_Macfarlan_Scatter")
              skew_trace_plot(dBaja2$age, Save="BajaCalifornians[2]_Male_Macfarlan_Trace")

  Res[99,] = c("Indian[1]","Power","India", "Market","Surviving Children","Census",
              MergeRes(dIndia1$age, dIndia1$rs))
              skew_index_plot("M", Age=TRUE, Save="Indian[1]_Male_Power_M")
              skew_scatter_plot(dIndia1$age, dIndia1$rs, Save="Indian[1]_Male_Power_Scatter")
              skew_trace_plot(dIndia1$age, Save="Indian[1]_Male_Power_Trace")

 Res[100,] = c("Indian[2]","Power","India", "Market","Surviving Children","Census",
              MergeRes(dIndia2$age, dIndia2$rs))
              skew_index_plot("M", Age=TRUE, Save="Indian[2]_Male_Power_M")
              skew_scatter_plot(dIndia2$age, dIndia2$rs, Save="Indian[2]_Male_Power_Scatter")
              skew_trace_plot(dIndia2$age, Save="Indian[2]_Male_Power_Trace")

 Res[101,] = c("Malawi","Lanning","Malawi", "Agriculture","Surviving Children","Random Sample",
              MergeRes(dMalawi$age, dMalawi$rs))
              skew_index_plot("M", Age=TRUE, Save="Malawi_Male_Lanning_M")
              skew_scatter_plot(dMalawi$age, dMalawi$rs, Save="Malawi_Male_Lanning_Scatter")
              skew_trace_plot(dMalawi$age, Save="Malawi_Male_Lanning_Trace")


 Res[102,] = c("Agta[2]","Page","Philippines", "Foraging","Surviving Children","Random Sample",
              MergeRes(dAgtaP0$age, dAgtaP0$rs_surviving))
              skew_index_plot("M", Age=TRUE, Save="Agta[2]_Male_Page_M")
              skew_scatter_plot(dAgtaP0$age, dAgtaP0$rs_surviving, Save="Agta[2]_Male_Page_Scatter")
              skew_trace_plot(dAgtaP0$age, Save="Agta[2]_Male_Page_Trace")

 Res[103,] = c("Agta[3]","Page","Philippines", "Foraging","Surviving Children","Random Sample",
              MergeRes(dAgtaP1$age, dAgtaP1$rs_surviving))
              skew_index_plot("M", Age=TRUE, Save="Agta[3]_Male_Page_M")
              skew_scatter_plot(dAgtaP1$age, dAgtaP1$rs_surviving, Save="Agta[3]_Male_Page_Scatter")
              skew_trace_plot(dAgtaP1$age, Save="Agta[3]_Male_Page_Trace")

 Res[104,] = c("Zhuang","Sum","China", "Agriculture","Surviving Children","Census",
              MergeRes(dZhuang$age, dZhuang$rs))
              skew_index_plot("M", Age=TRUE, Save="Zhuang_Male_Sum_M")
              skew_scatter_plot(dZhuang$age, dZhuang$rs, Save="Zhuang_Male_Sum_Scatter")
              skew_trace_plot(dZhuang$age, Save="Zhuang_Male_Sum_Trace")

 Res[105,] = c("Pumi","Sum","China", "Agriculture","Surviving Children","Census",
              MergeRes(dPumi$age, dPumi$rs))
              skew_index_plot("M", Age=TRUE, Save="Pumi_Male_Sum_M")
              skew_scatter_plot(dPumi$age, dPumi$rs, Save="Pumi_Male_Sum_Scatter")
              skew_trace_plot(dPumi$age, Save="Pumi_Male_Sum_Trace")

 Res[106,] = c("Han","Sum","China", "Agriculture","Surviving Children","Census",
              MergeRes(dHan$age, dHan$rs))
              skew_index_plot("M", Age=TRUE, Save="Han_Male_Sum_M")
              skew_scatter_plot(dHan$age, dHan$rs, Save="Han_Male_Sum_Scatter")
              skew_trace_plot(dHan$age, Save="Han_Male_Sum_Trace")

 Res[107,] = c("Mosuo[1]","Sum","China", "Agriculture","Surviving Children","Census",
              MergeRes(dMosuoPat$age, dMosuoPat$rs))
              skew_index_plot("M", Age=TRUE, Save="Mosuo[1]_Male_Sum_M")
              skew_scatter_plot(dMosuoPat$age, dMosuoPat$rs, Save="Mosuo[1]_Male_Sum_Scatter")
              skew_trace_plot(dMosuoPat$age, Save="Mosuo[1]_Male_Sum_Trace")

 Res[108,] = c("Mosuo[2]","Sum","China", "Agriculture","Surviving Children","Census",
              MergeRes(dMosuoMat$age, dMosuoMat$rs))
              skew_index_plot("M", Age=TRUE, Save="Mosuo[2]_Male_Sum_M")
              skew_scatter_plot(dMosuoMat$age, dMosuoMat$rs, Save="Mosuo[2]_Male_Sum_Scatter")
              skew_trace_plot(dMosuoMat$age, Save="Mosuo[2]_Male_Sum_Trace")

 Res[109,] = c("Efate","Mattison","Vanuatu", "Fishing","Surviving Children","Census",
              MergeRes(dEfate$age, dEfate$rs))
              skew_index_plot("M", Age=TRUE, Save="Efate_Male_Mattison_M")
              skew_scatter_plot(dEfate$age, dEfate$rs, Save="Efate_Male_Mattison_Scatter")
              skew_trace_plot(dEfate$age, Save="Efate_Male_Mattison_Trace")

 Res[110,] = c("Tanna[3]","Massengill","Vanuatu", "Horticulture","Surviving Children","Census",
              MergeRes(dTanna3$age, dTanna3$rs))
              skew_index_plot("M", Age=TRUE, Save="Tanna[3]_Male_Massengill_M")
              skew_scatter_plot(dTanna3$age, dTanna3$rs, Save="Tanna[3]_Male_Massengill_Scatter")
              skew_trace_plot(dTanna3$age, Save="Tanna[3]_Male_Massengill_Trace")

 Res[111,] = c("Haiti","DeMarco","Haiti", "Agriculture","Children had","Census",
              MergeRes(dHaiti$age, dHaiti$rs))
              skew_index_plot("M", Age=TRUE, Save="Haiti_Male_DeMarco_M")
              skew_scatter_plot(dHaiti$age, dHaiti$rs, Save="Haiti_Male_DeMarco_Scatter")
              skew_trace_plot(dHaiti$age, Save="Haiti_Male_DeMarco_Trace")

 Res[112,] = c("Madagascar","Golden","Madagascar", "Horticulture","Surviving Children","Census",
              MergeRes(dMadagascar$age, dMadagascar$rs))
              skew_index_plot("M", Age=TRUE, Save="Madagascar_Male_Golden_M")
              skew_scatter_plot(dMadagascar$age, dMadagascar$rs, Save="Madagascar_Male_Golden_Scatter")
              skew_trace_plot(dMadagascar$age, Save="Madagascar_Male_Golden_Trace")

 Res[113,] = c("Sami","Helle","Finland", "Pastoralism","Lifetime RS","Parish Registers",
              MergeRes(dSami$age, dSami$rs))
              skew_index_plot("M", Age=TRUE, Save="Sami_Male_Helle_M")
              skew_scatter_plot(dSami$age, dSami$rs, Save="Sami_Male_Helle_Scatter")
              skew_trace_plot(dSami$age, Save="Sami_Male_Helle_Trace")

 Res[114,] = c("Finnish[2]","Helle","Finland", "Agriculture","Lifetime RS","Parish Registers",
              MergeRes(dFinns$age, dFinns$rs))
              skew_index_plot("M", Age=TRUE, Save="Finnish[2]_Male_Helle_M")
              skew_scatter_plot(dFinns$age, dFinns$rs, Save="Finnish[2]_Male_Helle_Scatter")
              skew_trace_plot(dFinns$age, Save="Finnish[2]_Male_Helle_Trace")

 Res[115,] = c("Sena","Mertens","Mozambique", "Horticulture","Survived to 5","Census",
              MergeRes(dMozambique$age, dMozambique$rs))
              skew_index_plot("M", Age=TRUE, Save="Sena_Male_Mertens_M")
              skew_scatter_plot(dMozambique$age, dMozambique$rs, Save="Sena_Male_Mertens_Scatter")
              skew_trace_plot(dMozambique$age, Save="Sena_Male_Mertens_Trace")

 Res[116,] = c("Hental","Grimalda","PapuaNewGuinea", "Horticulture","Children had","Census",
              MergeRes(dHental$age, dHental$rs))
              skew_index_plot("M", Age=TRUE, Save="Hental_Male_Grimalda_M")
              skew_scatter_plot(dHental$age, dHental$rs, Save="Hental_Male_Grimalda_Scatter")
              skew_trace_plot(dHental$age, Save="Hental_Male_Grimalda_Trace")

 Res[117,] = c("Angola","Davis","Angola", "Pastoralism","Surviving Children","Census",
              MergeRes(dAngola$age, dAngola$rs))
              skew_index_plot("M", Age=TRUE, Save="Angola_Male_Davis_M")
              skew_scatter_plot(dAngola$age, dAngola$rs, Save="Angola_Male_Davis_Scatter")
              skew_trace_plot(dAngola$age, Save="Angola_Male_Davis_Trace")

 Res[118,] = c("Bayaka","Boyette and Lew-Levy","Congo", "Foraging","Surviving Children","Census",
              MergeRes(dBayaka$age, dBayaka$rs))
              skew_index_plot("M", Age=TRUE, Save="Bayaka_Male_Boyette_M")
              skew_scatter_plot(dBayaka$age, dBayaka$rs, Save="Bayaka_Male_Boyette_Scatter")
              skew_trace_plot(dBayaka$age, Save="Bayaka_Male_Boyette_Trace")

 Res[119,] = c("Bandongo","Boyette and Lew-Levy","Congo", "Farming","Surviving Children","Census",
              MergeRes(dBandongo$age, dBandongo$rs))
              skew_index_plot("M", Age=TRUE, Save="Bandongo_Male_Boyette_M")
              skew_scatter_plot(dBandongo$age, dBandongo$rs, Save="Bandongo_Male_Boyette_Scatter")
              skew_trace_plot(dBandongo$age, Save="Bandongo_Male_Boyette_Trace")

 Res[120,] = c("Chugurpampa","Oths","Peru", "Agriculture","Surviving Children","Sample",
              MergeRes(dChugurpampa$age, dChugurpampa$rs))
              skew_index_plot("M", Age=TRUE, Save="Chugurpampa_Male_Oths_M")
              skew_scatter_plot(dChugurpampa$age, dChugurpampa$rs, Save="Chugurpampa_Male_Oths_Scatter")
              skew_trace_plot(dChugurpampa$age, Save="Chugurpampa_Male_Oths_Trace")

 Res[121,] = c("Maya[3]","Downey","Belize", "Agriculture","Surviving Children","Sample",
              MergeRes(dBelize1$age, dBelize1$rs))
              skew_index_plot("M", Age=TRUE, Save="Maya[3]_Male_Downey_M")
              skew_scatter_plot(dBelize1$age, dBelize1$rs, Save="Maya[3]_Male_Downey_Scatter")
              skew_trace_plot(dBelize1$age, Save="Maya[3]_Male_Downey_Trace")

 Res[122,] = c("Maya[4]","Downey","Belize", "Agriculture","Surviving Children","Sample",
              MergeRes(dBelize2$age, dBelize2$rs))
              skew_index_plot("M", Age=TRUE, Save="Maya[4]_Male_Downey_M")
              skew_scatter_plot(dBelize2$age, dBelize2$rs, Save="Maya[4]_Male_Downey_Scatter")
              skew_trace_plot(dBelize2$age, Save="Maya[4]_Male_Downey_Trace")

 Res[123,] = c("Chewa","Sear","Malawi", "Agriculture","Surviving Children","Sample",
              MergeRes(dChewa$age, dChewa$rs))
              skew_index_plot("M", Age=TRUE, Save="Chewa_Male_Sear_M")
              skew_scatter_plot(dChewa$age, dChewa$rs, Save="Chewa_Male_Sear_Scatter")
              skew_trace_plot(dChewa$age, Save="Chewa_Male_Sear_Trace")

 Res[124,] = c("Shuar[1]","Sugiyama","Ecuador", "Horticulture","Children Born","Census",
              MergeRes(dShuar1$age, dShuar1$rs))
              skew_index_plot("M", Age=TRUE, Save="Shuar[1]_Male_Sugiyama_M")
              skew_scatter_plot(dShuar1$age, dShuar1$rs, Save="Shuar[1]_Male_Sugiyama_Scatter")
              skew_trace_plot(dShuar1$age, Save="Shuar[1]_Male_Sugiyama_Trace")

 Res[125,] = c("Shuar[2]","Sugiyama","Ecuador", "Horticulture","Children Born","Census",
              MergeRes(dShuar2$age, dShuar2$rs))
              skew_index_plot("M", Age=TRUE, Save="Shuar[2]_Male_Sugiyama_M")
              skew_scatter_plot(dShuar2$age, dShuar2$rs, Save="Shuar[2]_Male_Sugiyama_Scatter")
              skew_trace_plot(dShuar2$age, Save="Shuar[2]_Male_Sugiyama_Trace")

########################################
setwd(paste0(basewd,'/Results'))
save.image("SkewRes_M.RData")
dM = data.frame(Res)
colnames(dM) = colnames(Res)
write.csv(Res,"SkewResults-Individual-Human-Male.csv")
setwd(basewd)
