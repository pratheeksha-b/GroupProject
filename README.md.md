Project Overview



This project performs Market Basket Analysis (MBA) on the Online Retail dataset to identify product relationships, frequently co-purchased items, and actionable cross-selling opportunities.



ML techniques used:

* Basket creation (Invoice × Product matrix)
* One-hot encoding
* Apriori algorithm for frequent itemsets
* Association rules (support, confidence, lift)
* Insights + business recommendations



1\. Basket Creation



* Built a pivot table → each invoice represented as a row, each product as a column
* Values converted to binary (1 = item purchased)



2\. Apriori Algorithm



* Minimum support: 0.02
* Extracted frequent itemsets
* Extracted association rules based on:
* Confidence
* Lift
* Leverage
* Jaccard
* Conviction



4\. Evaluation



Sorted rules by lift, confidence, and support



📊 Insights From Market Basket Analysis

1\. Popular Products (High Support)



The most frequently purchased products include:



* White Hanging Heart T-Light Holder - 10.63%
* Regency Cake Stand 3-Tier - 9.18%
* Jumbo Bag Red Retrospot - 8.63%
* Party Bunting - 7.44%
* Assorted Colour Bird Ornament – 7.41%



These act as strong primary products and should be used as lead items for promotions.



2\. Strongest Product Affinities (High Lift Rules)



The Regency Teacup \& Saucer series shows extremely strong relationships:



* Customers frequently buy Pink, Green, and Roses variations together.
* Lift values above 20 indicate these products behave like a bundle set.
* The presence of one variant heavily increases the probability of purchasing the other two.
* Customers prefer buying sets of multiple colors, not single items.



3\. High-Confidence Rules



* If customers buy the Pink Regency Teacup, there is an 82–89% chance they will also buy the Green or Roses versions.
* This suggests color-set buying behavior, where customers prefer owning multiple variations.

**Antecedent	   Consequent	           Confidence**

Pink + Roses	   Green Regency Teacup	       89.4%

Pink + Green	   Roses Regency Teacup	       84.7%

Pink → Green	   82.7%	

Pink → Roses	   78.4%	

Green → Roses	   78.2%



4\. Product Bundles \& Co-occurrence Patterns



The three Regency teacup variants form a natural bundle.



Other smaller pairs like



* Gardeners Kneeling Pad — Cup of Tea and
* Gardeners Kneeling Pad — Keep Calm also show strong cross-purchasing.



📦 Actionable Business Recommendations

1\. Bundle Creation



* Offer “Regency Teacup 3-Color Bundle” (Pink + Green + Roses)
* Provide 5–10% discount to increase average order value
* Create seasonal sets (Mother’s Day / Holiday Collection)



2\. Cross-Selling on Website



When a user adds Pink Regency Teacup, recommend:



* Green Regency
* Roses Regency



Add “Complete the Set” prompts



3\. In-Store Shelf Placement



* Display the Regency Teacup color variants together as a unit
* Use signage: “Mix \& Match Color Collection”



4\. Promote High-Support Items



Feature top sellers (T-Light Holder, Cake Stand, Retrospot Bag) on:



* Homepage banners
* New arrivals
* Bestsellers list



5\. Inventory Planning



High-co-occurrence items should be stocked together to avoid cart abandonment.



**🧠 Conclusion**



**Market Basket Analysis revealed strong product affinities—especially within the Regency Teacup \& Saucer collection—indicating a major opportunity for bundling and cross-selling. High-support items serve as natural traffic drivers, and the insights can guide pricing, placement, promotions, and recommendation systems.**



