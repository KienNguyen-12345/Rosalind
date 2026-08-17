number_of_couple <- c(19334, 16344, 18129, 19342, 19561, 16820)

prob_of_dom <- c(2,2,2,1.5,1,0)
'Why 2,2,2,1.5,1,0?
      Chance of having dominant phenotype (having at least 1 "A" allele)
AA-AA: 100% - 1
AA-Aa: 100% - 1
AA-aa: 100% - 1
Aa-Aa: 75% - 0.75
Aa-aa: 50% - 0.5
aa-aa: 0% - 0
So the chances of 1 offspring with dominant phenotype are: 1,1,1,0.75,0.5,0
 ==> Multiply by 2 for 2 offsprings: 2,2,2,1.5,1,0'

number_of_offpsring_with_dom <- sum(number_of_couple*prob_of_dom)
print(number_of_offpsring_with_dom)
