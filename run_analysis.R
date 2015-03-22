###### [1] Introduction. 

# This script combines data sets from mechanical motion captured by the accelerometer 
# and gyro of a smartphone(Samsung Galaxy S II) into a coherent single data set that been structured 
# to adhere to the the three principles of tidy data sets.

# The diagnostic print statements utilised during coding have been retained in case they are required future need,
# but have been inactivated as comments.
 
setwd("C:/Users/User/Desktop/DataScienceWorkDir")

library(plyr)
library(dplyr)
# =====================================================================================
###### [2] Read Data into tables in working directory, "C:/Users/User/Desktop/DataScienceWorkDir"

Xtest.tbl <- read.table("./X_test.txt")
Xtrain.tbl <- read.table("./X_train.txt")
ytest.tbl <- read.table("./y_test.txt")
ytrain.tbl <- read.table("./y_test.txt")
subjtest.tbl <- read.table("./subject_test.txt")
subjtrain.tbl <- read.table("./subject_train.txt")

# Check dimensions of data files: 
# *test should have 7352 rows, and *train 2947 rows. 
# X* files have 561 columns; other files have 1 column
# dim(Xtest.tbl)
# dim(Xtrain.tbl)
# dim(ytest.tbl)
# dim(ytrain.tbl)
# dim(subjtest.tbl)
# dim(subjtrain.tbl)
# ====================================================================================================

###### [3] Create activity names data frame called ActivNames_test for the test set,
# and change number codes to descriptive names: 
# 1 -> "Walk", 2 -> "Walk_Upstairs", 3 -> "Walk_Dwnstairs", 4 -> "Sit", 5 -> "Stand", 6 -> "Lie"
#
numrows <- nrow(ytest.tbl)
ActivNames_test <- data.frame(1:numrows)
names(ActivNames_test) <- c("Activity")
 for (i in 1:numrows) ActivNames_test[i,1] <- if (ytest.tbl[i,1] == 1) {"Walk"
}                     else if (ytest.tbl[i,1] == 2) {"Walk_Upstairs"
}                     else if (ytest.tbl[i,1] == 3) {"Walk_Dwnstairs"
}                     else if (ytest.tbl[i,1] == 4) {"Sit"
}                     else if (ytest.tbl[i,1] == 5) {"Stand"
}                     else                  {"Lie"
}

# Check transcription of activities is done correctly by head() & tail() on ActivNames_test & ytest.tbl
# as well as str(ActivNames_test) & summary(ActivNames_test)
# head(ActivNames_test)
# head(ytest.tbl)
# tail(ActivNames_test)
# tail(ytest.tbl)
# str(ActivNames_train)
# summary(ActivNames_train)
# -------------------------------------------------------------------------------------------------

# Create activity names data frame called ActivNames_train for the training set.
# and change number codes to descriptive names: 
# 1 -> "Walk", 2 -> "Walk_Upstairs", 3 -> "Walk_Dwnstairs", 4 -> "Sit", 5 -> "Stand", 6 -> "Lie"
#
numrows <- nrow(ytrain.tbl)
ActivNames_train <- data.frame(1:numrows)
names(ActivNames_train) <- c("Activity")
 for (i in 1:numrows) ActivNames_train[i,1] <- if (ytrain.tbl[i,1] == 1) {"Walk"
}                     else if (ytrain.tbl[i,1] == 2) {"Walk_Upstairs"
}                     else if (ytrain.tbl[i,1] == 3) {"Walk_Dwnstairs"
}                     else if (ytrain.tbl[i,1] == 4) {"Sit"
}                     else if (ytrain.tbl[i,1] == 5) {"Stand"
}                     else                  {"Lie"
}

# Check transcription of activities is done correctly by head() & tail() on ActivNames_train & ytrain.tbl,
# as well as str(ActivNames_train) & summary(ActivNames_train)
# head(ActivNames_train)
# head(ytrain.tbl)
# tail(ActivNames_train)
# tail(ytrain.tbl)
# str(ActivNames_train)
# summary(ActivNames_train)

# ===========================================================================================
###### [4] For test data, set "Subject" as column name,
# and combine with activity data frame using cbind().

names(subjtest.tbl) <- "Subject"

# Cbind subjects and activity column data frames
subj_act_test <-cbind(subjtest.tbl,ActivNames_test)

# str(subj_act_test)
# head(subj_act_test,3)
# tail(subj_act_test,3)

# ----------------------------------------------------------------------------------------
# For train data, set "Subject" as column name,
# and combine with activity data frame using cbind().

names(subjtrain.tbl) <- "Subject"

# Cbind subjects and activity column data frames
subj_act_train <-cbind(subjtrain.tbl,ActivNames_train)

# str(subj_act_train)
# head(subj_act_train,3)
# tail(subj_act_train,3)
# ===============================================================================
###### [5] Apply temporary names to columns in Xtest.tbl, so that the selecting of columns is facilitated.

# [This section could have been more elegantly done using a for statement.
# However, since it was working it was retained in the naive form.]

names(Xtest.tbl)[1:9]     <- c("pp1",  "pp2",  "pp3",   "pp4",  "pp5",  "pp6",  "pp7",  "pp8",  "pp9")
names(Xtest.tbl)[10:19]   <- c("pp10", "pp11", "pp12",  "pp13", "pp14", "pp15", "pp16", "pp17", "pp18","pp19")
names(Xtest.tbl)[20:29]   <- c("pp20", "pp21", "pp22",  "pp23", "pp24", "pp25", "pp26", "pp27", "pp28", "pp29")
names(Xtest.tbl)[30:39]   <- c("pp30", "pp31", "pp32",  "pp33", "pp34", "pp35", "pp36", "pp37", "pp38", "pp39")
names(Xtest.tbl)[40:49]   <- c("pp40", "pp41", "pp42",  "pp43", "pp44", "pp45", "pp46", "pp47", "pp48", "pp49")
names(Xtest.tbl)[50:59]   <- c("pp50", "pp51", "pp52",  "pp53", "pp54", "pp55", "pp56", "pp57", "pp58", "pp59")
names(Xtest.tbl)[60:69]   <- c("pp60", "pp61", "pp62",  "pp63", "pp64", "pp65", "pp66", "pp67", "pp68", "pp69")
names(Xtest.tbl)[70:79]   <- c("pp70", "pp71", "pp72",  "pp73", "pp74", "pp75", "pp76", "pp77", "pp78", "pp79")
names(Xtest.tbl)[80:89]   <- c("pp80", "pp81", "pp82",  "pp83", "pp84", "pp85", "pp86", "pp87", "pp88", "pp89")
names(Xtest.tbl)[90:99]   <- c("pp90", "pp91", "pp92",  "pp93", "pp94", "pp95", "pp96", "pp97", "pp98", "pp99")
names(Xtest.tbl)[100:109] <- c("pp100","pp101","pp102", "pp103","pp104","pp105","pp106","pp107","pp108","pp109")
names(Xtest.tbl)[110:119] <- c("pp110","pp111","pp112", "pp113","pp114","pp115","pp116","pp117","pp118","pp119")
names(Xtest.tbl)[120:129] <- c("pp120","pp121","pp122", "pp123","pp124","pp125","pp126","pp127","pp128","pp129")
names(Xtest.tbl)[130:139] <- c("pp130","pp131","pp132", "pp133","pp134","pp135","pp136","pp137","pp138","pp139")
names(Xtest.tbl)[140:149] <- c("pp140","pp141","pp142", "pp143","pp144","pp145","pp146","pp147","pp148","pp149")
names(Xtest.tbl)[150:159] <- c("pp150","pp151","pp152", "pp153","pp154","pp155","pp156","pp157","pp158","pp159")
names(Xtest.tbl)[160:169] <- c("pp160","pp161","pp162", "pp163","pp164","pp165","pp166","pp167","pp168","pp169")
names(Xtest.tbl)[170:179] <- c("pp170","pp171","pp172", "pp173","pp174","pp175","pp176","pp177","pp178","pp179")
names(Xtest.tbl)[180:189] <- c("pp180","pp181","pp182", "pp183","pp184","pp185","pp186","pp187","pp188","pp189")
names(Xtest.tbl)[190:199] <- c("pp190","pp191","pp192", "pp193","pp194","pp195","pp196","pp197","pp198","pp199")
names(Xtest.tbl)[200:209] <- c("pp200","pp201","pp202", "pp203","pp204","pp205","pp206","pp207","pp208","pp209")
names(Xtest.tbl)[210:219] <- c("pp210","pp211","pp212", "pp213","pp214","pp215","pp216","pp217","pp218","pp219")
names(Xtest.tbl)[220:229] <- c("pp220","pp221","pp222", "pp223","pp224","pp225","pp226","pp227","pp228","pp229")
names(Xtest.tbl)[230:239] <- c("pp230","pp231","pp232", "pp233","pp234","pp235","pp236","pp237","pp238","pp239")
names(Xtest.tbl)[240:249] <- c("pp240","pp241","pp242", "pp243","pp244","pp245","pp246","pp247","pp248","pp249")
names(Xtest.tbl)[250:259] <- c("pp250","pp251","pp252", "pp253","pp254","pp255","pp256","pp257","pp258","pp259")
names(Xtest.tbl)[260:269] <- c("pp260","pp261","pp262", "pp263","pp264","pp265","pp266","pp267","pp268","pp269")
names(Xtest.tbl)[270:279] <- c("pp270","pp271","pp272", "pp273","pp274","pp275","pp276","pp277","pp278","pp279")
names(Xtest.tbl)[280:289] <- c("pp280","pp281","pp282", "pp283","pp284","pp285","pp286","pp287","pp288","pp289")
names(Xtest.tbl)[290:299] <- c("pp290","pp291","pp292", "pp293","pp294","pp295","pp296","pp297","pp298","pp299")
names(Xtest.tbl)[300:309] <- c("pp300","pp301","pp302", "pp303","pp304","pp305","pp306","pp307","pp308","pp309")
names(Xtest.tbl)[310:319] <- c("pp310","pp311","pp312", "pp313","pp314","pp315","pp316","pp317","pp318","pp319")
names(Xtest.tbl)[320:329] <- c("pp320","pp321","pp322", "pp323","pp324","pp325","pp326","pp327","pp328","pp329")
names(Xtest.tbl)[330:339] <- c("pp330","pp331","pp332", "pp333","pp334","pp335","pp336","pp337","pp338","pp339")
names(Xtest.tbl)[340:349] <- c("pp340","pp341","pp342", "pp343","pp344","pp345","pp346","pp347","pp348","pp349")
names(Xtest.tbl)[350:359] <- c("pp350","pp351","pp352", "pp353","pp354","pp355","pp356","pp357","pp358","pp359")
names(Xtest.tbl)[360:369] <- c("pp360","pp361","pp362", "pp363","pp364","pp365","pp366","pp367","pp368","pp369")
names(Xtest.tbl)[370:379] <- c("pp370","pp371","pp372", "pp373","pp374","pp375","pp376","pp377","pp378","pp379")
names(Xtest.tbl)[380:389] <- c("pp380","pp381","pp382", "pp383","pp384","pp385","pp386","pp387","pp388","pp389")
names(Xtest.tbl)[390:399] <- c("pp390","pp391","pp392", "pp393","pp394","pp395","pp396","pp397","pp398","pp399")
names(Xtest.tbl)[400:409] <- c("pp400","pp401","pp402", "pp403","pp404","pp405","pp406","pp407","pp408","pp409")
names(Xtest.tbl)[410:419] <- c("pp410","pp411","pp412", "pp413","pp414","pp415","pp416","pp417","pp418","pp419")
names(Xtest.tbl)[420:429] <- c("pp420","pp421","pp422", "pp423","pp424","pp425","pp426","pp427","pp428","pp429")
names(Xtest.tbl)[430:439] <- c("pp430","pp431","pp432", "pp433","pp434","pp435","pp436","pp437","pp438","pp439")
names(Xtest.tbl)[440:449] <- c("pp440","pp441","pp442", "pp443","pp444","pp445","pp446","pp447","pp448","pp449")
names(Xtest.tbl)[450:459] <- c("pp450","pp451","pp452", "pp453","pp454","pp455","pp456","pp457","pp458","pp459")
names(Xtest.tbl)[460:469] <- c("pp460","pp461","pp462", "pp463","pp464","pp465","pp466","pp467","pp468","pp469")
names(Xtest.tbl)[470:479] <- c("pp470","pp471","pp472", "pp473","pp474","pp475","pp476","pp477","pp478","pp479")
names(Xtest.tbl)[480:489] <- c("pp480","pp481","pp482", "pp483","pp484","pp485","pp486","pp487","pp488","pp489")
names(Xtest.tbl)[490:499] <- c("pp490","pp491","pp492", "pp493","pp494","pp495","pp496","pp497","pp498","pp499")
names(Xtest.tbl)[500:509] <- c("pp500","pp501","pp502", "pp503","pp504","pp505","pp506","pp507","pp508","pp509")
names(Xtest.tbl)[510:519] <- c("pp510","pp511","pp512", "pp513","pp514","pp515","pp516","pp517","pp518","pp519")
names(Xtest.tbl)[520:529] <- c("pp520","pp521","pp522", "pp523","pp524","pp525","pp526","pp527","pp528","pp529")
names(Xtest.tbl)[530:539] <- c("pp530","pp531","pp532", "pp533","pp534","pp535","pp536","pp537","pp538","pp539")
names(Xtest.tbl)[540:549] <- c("pp540","pp541","pp542", "pp543","pp544","pp545","pp546","pp547","pp548","pp549")
names(Xtest.tbl)[550:559] <- c("pp550","pp551","pp552", "pp553","pp554","pp555","pp556","pp557","pp558","pp559")
names(Xtest.tbl)[560:561] <- c("pp560","pp561")

# Check that names have been correctly applied to columns
# names(Xtest.tbl)

# --------------------------------------------------------------------------------------

# Apply temporary names to columns in Xtrain.tbl, so that the selecting of columns is facilitated

names(Xtrain.tbl)[1:9]     <- c("pp1",  "pp2",  "pp3",   "pp4",  "pp5",  "pp6",  "pp7",  "pp8",  "pp9")
names(Xtrain.tbl)[10:19]   <- c("pp10", "pp11", "pp12",  "pp13", "pp14", "pp15", "pp16", "pp17", "pp18","pp19")
names(Xtrain.tbl)[20:29]   <- c("pp20", "pp21", "pp22",  "pp23", "pp24", "pp25", "pp26", "pp27", "pp28", "pp29")
names(Xtrain.tbl)[30:39]   <- c("pp30", "pp31", "pp32",  "pp33", "pp34", "pp35", "pp36", "pp37", "pp38", "pp39")
names(Xtrain.tbl)[40:49]   <- c("pp40", "pp41", "pp42",  "pp43", "pp44", "pp45", "pp46", "pp47", "pp48", "pp49")
names(Xtrain.tbl)[50:59]   <- c("pp50", "pp51", "pp52",  "pp53", "pp54", "pp55", "pp56", "pp57", "pp58", "pp59")
names(Xtrain.tbl)[60:69]   <- c("pp60", "pp61", "pp62",  "pp63", "pp64", "pp65", "pp66", "pp67", "pp68", "pp69")
names(Xtrain.tbl)[70:79]   <- c("pp70", "pp71", "pp72",  "pp73", "pp74", "pp75", "pp76", "pp77", "pp78", "pp79")
names(Xtrain.tbl)[80:89]   <- c("pp80", "pp81", "pp82",  "pp83", "pp84", "pp85", "pp86", "pp87", "pp88", "pp89")
names(Xtrain.tbl)[90:99]   <- c("pp90", "pp91", "pp92",  "pp93", "pp94", "pp95", "pp96", "pp97", "pp98", "pp99")
names(Xtrain.tbl)[100:109] <- c("pp100","pp101","pp102", "pp103","pp104","pp105","pp106","pp107","pp108","pp109")
names(Xtrain.tbl)[110:119] <- c("pp110","pp111","pp112", "pp113","pp114","pp115","pp116","pp117","pp118","pp119")
names(Xtrain.tbl)[120:129] <- c("pp120","pp121","pp122", "pp123","pp124","pp125","pp126","pp127","pp128","pp129")
names(Xtrain.tbl)[130:139] <- c("pp130","pp131","pp132", "pp133","pp134","pp135","pp136","pp137","pp138","pp139")
names(Xtrain.tbl)[140:149] <- c("pp140","pp141","pp142", "pp143","pp144","pp145","pp146","pp147","pp148","pp149")
names(Xtrain.tbl)[150:159] <- c("pp150","pp151","pp152", "pp153","pp154","pp155","pp156","pp157","pp158","pp159")
names(Xtrain.tbl)[160:169] <- c("pp160","pp161","pp162", "pp163","pp164","pp165","pp166","pp167","pp168","pp169")
names(Xtrain.tbl)[170:179] <- c("pp170","pp171","pp172", "pp173","pp174","pp175","pp176","pp177","pp178","pp179")
names(Xtrain.tbl)[180:189] <- c("pp180","pp181","pp182", "pp183","pp184","pp185","pp186","pp187","pp188","pp189")
names(Xtrain.tbl)[190:199] <- c("pp190","pp191","pp192", "pp193","pp194","pp195","pp196","pp197","pp198","pp199")
names(Xtrain.tbl)[200:209] <- c("pp200","pp201","pp202", "pp203","pp204","pp205","pp206","pp207","pp208","pp209")
names(Xtrain.tbl)[210:219] <- c("pp210","pp211","pp212", "pp213","pp214","pp215","pp216","pp217","pp218","pp219")
names(Xtrain.tbl)[220:229] <- c("pp220","pp221","pp222", "pp223","pp224","pp225","pp226","pp227","pp228","pp229")
names(Xtrain.tbl)[230:239] <- c("pp230","pp231","pp232", "pp233","pp234","pp235","pp236","pp237","pp238","pp239")
names(Xtrain.tbl)[240:249] <- c("pp240","pp241","pp242", "pp243","pp244","pp245","pp246","pp247","pp248","pp249")
names(Xtrain.tbl)[250:259] <- c("pp250","pp251","pp252", "pp253","pp254","pp255","pp256","pp257","pp258","pp259")
names(Xtrain.tbl)[260:269] <- c("pp260","pp261","pp262", "pp263","pp264","pp265","pp266","pp267","pp268","pp269")
names(Xtrain.tbl)[270:279] <- c("pp270","pp271","pp272", "pp273","pp274","pp275","pp276","pp277","pp278","pp279")
names(Xtrain.tbl)[280:289] <- c("pp280","pp281","pp282", "pp283","pp284","pp285","pp286","pp287","pp288","pp289")
names(Xtrain.tbl)[290:299] <- c("pp290","pp291","pp292", "pp293","pp294","pp295","pp296","pp297","pp298","pp299")
names(Xtrain.tbl)[300:309] <- c("pp300","pp301","pp302", "pp303","pp304","pp305","pp306","pp307","pp308","pp309")
names(Xtrain.tbl)[310:319] <- c("pp310","pp311","pp312", "pp313","pp314","pp315","pp316","pp317","pp318","pp319")
names(Xtrain.tbl)[320:329] <- c("pp320","pp321","pp322", "pp323","pp324","pp325","pp326","pp327","pp328","pp329")
names(Xtrain.tbl)[330:339] <- c("pp330","pp331","pp332", "pp333","pp334","pp335","pp336","pp337","pp338","pp339")
names(Xtrain.tbl)[340:349] <- c("pp340","pp341","pp342", "pp343","pp344","pp345","pp346","pp347","pp348","pp349")
names(Xtrain.tbl)[350:359] <- c("pp350","pp351","pp352", "pp353","pp354","pp355","pp356","pp357","pp358","pp359")
names(Xtrain.tbl)[360:369] <- c("pp360","pp361","pp362", "pp363","pp364","pp365","pp366","pp367","pp368","pp369")
names(Xtrain.tbl)[370:379] <- c("pp370","pp371","pp372", "pp373","pp374","pp375","pp376","pp377","pp378","pp379")
names(Xtrain.tbl)[380:389] <- c("pp380","pp381","pp382", "pp383","pp384","pp385","pp386","pp387","pp388","pp389")
names(Xtrain.tbl)[390:399] <- c("pp390","pp391","pp392", "pp393","pp394","pp395","pp396","pp397","pp398","pp399")
names(Xtrain.tbl)[400:409] <- c("pp400","pp401","pp402", "pp403","pp404","pp405","pp406","pp407","pp408","pp409")
names(Xtrain.tbl)[410:419] <- c("pp410","pp411","pp412", "pp413","pp414","pp415","pp416","pp417","pp418","pp419")
names(Xtrain.tbl)[420:429] <- c("pp420","pp421","pp422", "pp423","pp424","pp425","pp426","pp427","pp428","pp429")
names(Xtrain.tbl)[430:439] <- c("pp430","pp431","pp432", "pp433","pp434","pp435","pp436","pp437","pp438","pp439")
names(Xtrain.tbl)[440:449] <- c("pp440","pp441","pp442", "pp443","pp444","pp445","pp446","pp447","pp448","pp449")
names(Xtrain.tbl)[450:459] <- c("pp450","pp451","pp452", "pp453","pp454","pp455","pp456","pp457","pp458","pp459")
names(Xtrain.tbl)[460:469] <- c("pp460","pp461","pp462", "pp463","pp464","pp465","pp466","pp467","pp468","pp469")
names(Xtrain.tbl)[470:479] <- c("pp470","pp471","pp472", "pp473","pp474","pp475","pp476","pp477","pp478","pp479")
names(Xtrain.tbl)[480:489] <- c("pp480","pp481","pp482", "pp483","pp484","pp485","pp486","pp487","pp488","pp489")
names(Xtrain.tbl)[490:499] <- c("pp490","pp491","pp492", "pp493","pp494","pp495","pp496","pp497","pp498","pp499")
names(Xtrain.tbl)[500:509] <- c("pp500","pp501","pp502", "pp503","pp504","pp505","pp506","pp507","pp508","pp509")
names(Xtrain.tbl)[510:519] <- c("pp510","pp511","pp512", "pp513","pp514","pp515","pp516","pp517","pp518","pp519")
names(Xtrain.tbl)[520:529] <- c("pp520","pp521","pp522", "pp523","pp524","pp525","pp526","pp527","pp528","pp529")
names(Xtrain.tbl)[530:539] <- c("pp530","pp531","pp532", "pp533","pp534","pp535","pp536","pp537","pp538","pp539")
names(Xtrain.tbl)[540:549] <- c("pp540","pp541","pp542", "pp543","pp544","pp545","pp546","pp547","pp548","pp549")
names(Xtrain.tbl)[550:559] <- c("pp550","pp551","pp552", "pp553","pp554","pp555","pp556","pp557","pp558","pp559")
names(Xtrain.tbl)[560:561] <- c("pp560","pp561")

# Check that names have been correctly applied to columns
# names(Xtrain.tbl)
# ============================================================================================

###### [6] Measurements on means (column names containing 'mean') 
#    and  standard deviation (columns names containing 'std') in the test set, Xtest.tbl are selected

te <- select(Xtest.tbl,pp1:pp6,pp41:pp46,pp81:pp86,pp121:pp126,pp161:pp166,pp201:pp202,pp214:pp215,pp227:pp228,pp240:pp241,pp253:pp254,pp266:pp271,pp294:pp296,pp345:pp350,pp373:pp375,pp424:pp429,pp452:pp454,pp503:pp504,pp513,pp516:pp517,pp526,pp529:pp530,pp539,pp542:pp543,pp552,pp555:pp561)

# Check column names dimensions and variable type, etc by str()
# str(te)
# ------------------------------------------------------------------


# Measurements on means (column names containing 'mean') 
#    and  standard deviation (columns names containing 'std') in the test set, Xtest.tbl are selected

tr <- select(Xtrain.tbl,pp1:pp6,pp41:pp46,pp81:pp86,pp121:pp126,pp161:pp166,pp201:pp202,pp214:pp215,pp227:pp228,pp240:pp241,pp253:pp254,pp266:pp271,pp294:pp296,pp345:pp350,pp373:pp375,pp424:pp429,pp452:pp454,pp503:pp504,pp513,pp516:pp517,pp526,pp529:pp530,pp539,pp542:pp543,pp552,pp555:pp561)

# Check column names dimensions and variable type, etc by str()
# str(tr)
# ========================================================================================================

###### [7] Combine the test and training Subject-Activity data frames, subj_act_test and subj_act_train by rbind

sa <- rbind(subj_act_test,subj_act_train)

# Check dimensions and structure of sa.   (Expect 10299 observations of 2 variables, both character.  
#         Activity in head() should be Subject 2 standing, and Subject 30 walking upstairs in tail().)   
# str(sa)
# head(sa,2)
# tail(sa,2)
# =========================================================================================================
###### [8] Combine the test and training measurements on mean & standard deviation data frames, te and tr by rbind().

tetr <- rbind(te,tr)

# Check dimensions and structure of tetr.   (Expect 10299 observations of 86 variables, all numeric.) 
# I have done spot checks to confirm that head(tetr) is consistent with head(Xtest.tbl) and tail(Xtrain.tbl) 
#   but it's rather messy to do so, because the numbers of columns differ. 
   
# str(tetr)
# head(tetr,1)
# tail(tetr,1)
# ========================================================================================================

###### [9] Labelling the measurement with descriptive variable names.  
# (The labels provided for the measurements have been streamlined somewhat, 
#   but some of the names remain rather long and unwieldy.
#   However, it was felt that further simplification would result in loss of information.)

names(tetr)[1:10]  <- c("tBodyAcc.mean.X", "tBodyAcc.mean.Y", "tBodyAcc.mean.Z", "tBodyAcc.std.X", "tBodyAcc.std.Y", "tBodyAcc.std.Z", "tGravityAcc.mean.X", "tGravityAcc.mean.Y", "tGravityAcc.mean.Z", "tGravityAcc.std.X")
names(tetr)[11:20] <- c("tGravityAcc.std.Y", "tGravityAcc.std.Z", "tBodyAccJerk.mean.X", "tBodyAccJerk.mean.Y", "tBodyAccJerk.mean.Z", "tBodyAccJerk.std.X", "tBodyAccJerk.std.Y", "tBodyAccJerk.std.Z", "tBodyGyro.mean.X", "tBodyGyro.mean.Y")
names(tetr)[21:30] <- c("tBodyGyro.mean.Z", "tBodyGyro.std.X", "tBodyGyro.std.Y", "tBodyGyro.std.Z", "tBodyGyroJerk.mean.X", "tBodyGyroJerk.mean.Y", "tBodyGyroJerk.mean.Z", "tBodyGyroJerk.std.X", "tBodyGyroJerk.std.Y", "tBodyGyroJerk.std.Z")
names(tetr)[31:40] <- c("tBodyAccMag.mean", "tBodyAccMag.std", "tGravityAccMag.mean", "tGravityAccMag.std", "tBodyAccJerkMag.mean", "tBodyAccJerkMag.std", "tBodyGyroMag.mean", "tBodyGyroMag.std", "tBodyGyroJerkMag.mean", "tBodyGyroJerkMag.std")
names(tetr)[41:50] <- c("fBodyAcc.mean.X", "fBodyAcc.mean.Y", "fBodyAcc.mean.Z", "fBodyAcc.std.X", "fBodyAcc.std.Y", "fBodyAcc.std.Z", "fBodyAcc.meanFreq.X", "fBodyAcc.meanFreq.Y", "fBodyAcc.meanFreq.Z", "fBodyAccJerk.mean.X")
names(tetr)[51:60] <- c("fBodyAccJerk.mean.Y", "fBodyAccJerk.mean.Z", "fBodyAccJerk.std.X", "fBodyAccJerk.std.Y", "fBodyAccJerk.std.Z", "fBodyAccJerk.meanFreq.X", "fBodyAccJerk.meanFreq.Y", "fBodyAccJerk.meanFreq.Z", "fBodyGyro.mean.X", "fBodyGyro.mean.Y")
names(tetr)[61:70] <- c("fBodyGyro.mean.Z", "fBodyGyro.std.X", "fBodyGyro.std.Y", "fBodyGyro.std.Z", "fBodyGyro.meanFreq.X", "fBodyGyro.meanFreq.Y", "fBodyGyro.meanFreq.Z", "fBodyAccMag.mean", "fBodyAccMag.std", "fBodyAccMag.meanFreq")
names(tetr)[71:80] <- c("fBodyBodyAccJerkMag.mean", "fBodyBodyAccJerkMag.std", "fBodyBodyAccJerkMag.meanFreq", "fBodyBodyGyroMag.mean", "fBodyBodyGyroMag.std", "fBodyBodyGyroMag.meanFreq", "fBodyBodyGyroJerkMag.mean", "fBodyBodyGyroJerkMag.std", "fBodyBodyGyroJerkMag.meanFreq", "angle(tBodyAccMean,gravity)")
names(tetr)[81:86] <- c("angle(tBodyAccJerkMean),gravityMean)", "angle(tBodyGyroMean,gravityMean)", "angle(tBodyGyroJerkMean,gravityMean)", "angle(X,gravityMean)", "angle(Y,gravityMean)", "angle(Z,gravityMean)")

# The variable names are highlighted by str(tetr).
# str(tetr)
# =====================================================================================================
###### [10] Combine the subject-activity data frame, sa, with the measurement data frame, tetr by cbind().

combo <- cbind(sa, tetr)

# The combined data frame, combo should have 88 columns 
#       i.e.the subject and activity variables and 86 measurement variables.  
#  The variable names can also be seen as well as the initial observations of the variables.

# str(combo)
# =========================================================================================================
###### [11] Getting final tidy data set, TidyData 
#       - the variables are means of observations for the Subject-Activity combination 

# Create Subject and Activity vectors, Subj and Activty
Subj <- sa$Subject
Activty <- sa$Activity

#tidydat is a dataframe of means of observations for each Subject-Activity combination. 

tidydat <- aggregate(x = tetr, by = list(Subj, Activty), FUN = "mean")

# The first two columns are the ordering variables Subj, Activty, but they are not named or ordered.
# str(tidydat)
# -----------------------------------------------------------------------------------------------
# Names are given to the ordering variables. 
names(tidydat)[1:2] <- c("Subject", "Activity")

# Obtain the final tidy data set by ordering with respect to Subject and Activity.
# The Subject variable orders nicely(1,2,3...) as integers.
# The Activity variable is sorted alphabetically in the order:
#                     Lie, Sit, Stand, Walk, Walk_Dwnstairs, Walk_Upstairs
TidyData <- tidydat[order(tidydat$Subject,tidydat$Activity),]

# Printing out the first 3 columns of TidyData shows the tidy data structure, ordered nicely, 
#   while str(TidyData) shows the structure including that it has 180 observations of 88 variables 
#                                                   ( Subject, Activity plus 86 measured variables).
# TidyData[,1:3]
# ===================================================================================================
###### [12] Writes TidyData to file TidyDataSet.txt in the work directory

# write.table(TidyData, file = "./TidyDataSet.txt",row.name = FALSE)

# =====================================================================================================