clear
set seed 340600  // Ensures reproducibility
set obs 37706  // Matches the trial size
generate bnt=rbinomial(1,.5)
label define Bnt 0 "Placebo" 1 "BNT162b2"
label values bnt Bnt
tabulate bnt
generate female=rbinomial(1, .494)
generate race=round(runiform(0,100),.1)
generate ethnicity=rbinomial(1,0.28)
generate country=round(runiform(0,100), .1)
generate age=(rt(_N)*9.25)+52
generate days=rweibull(.7,17,0) if bnt==0
generate bmi=rbinomial(1, .351)

sts graph, by(bnt)
stcox bnt
label variable bnt_id "Participant Identifier"