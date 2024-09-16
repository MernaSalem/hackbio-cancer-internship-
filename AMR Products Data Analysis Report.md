# AMR Products Data Analysis Report

Authors (@slack): Merna Raafat Salem (@MernaSalem28), Yomna Khaled (@yomna98), Chijioke C. Uhegwu (@Chijioke001), Olorunfemi Omobolade (@Olorunfemi), Elizabeth Sayo (@Sayo)  
—----------------------------------------------------------------------------------------------------------------------------------

This report outlines the analysis and key insights extracted from the WHO Antimicrobial Resistance (AMR) products dataset. 

## **Data Preparation and Cleaning**

1. Data : The WHO AMR Products Dataset Was loaded into Rstudio  
2. Unique and Most Repeated Values: they were identified to understand the structure of the dataset and assess the distribution of key variables.  
3. Checking Missing Values: A detailed inspection of missing values across different columns .

## **Handling Missing Values**

* Replacing Values: Missing values were systematically replaced according to the nature of the data:

**Alternative Name**:  "-"  to  N/A, and "NA" to Unknown.

**Non-Traditional Categories**:  "NA"  to N/A.

**Mycobacterium tuberculosis**:  Missing entries were replaced with Not yet, and 

 "y" to Yes.

**Clostridioides difficile**:  "NA" to Null, "?" was converted to Unknown, and "y" to Yes.

## **Interactive Charts for Enhanced Understanding**

 Within the code, you’ll find several interactive charts to provide deeper insights and enhance your understanding of the AMR product data. such as the distribution of R\&D phases, product types, and developer contributions.

## **Key Insights and Summary**

**1\. Product Distribution:**   
   The dataset reveals that 57.2% of the products are Antibiotics, while 42.8% are Non-traditional  products, such as bacteriophages. This significant presence of non-traditional products shows that there is a growing focus on alternative approaches to combating AMR, an important trend in addressing resistance mechanisms that evade conventional antibiotics

**2\. R\&D Phases:**  
   The majority of products are still in early development. Specifically, 46.3% of the products are in Phase I, followed by 27.8% in Phase II, and 21.8% in Phase III. Only 4.04% have reached the pre-registration phase. This distribution highlights the bottleneck in advancing products from early research to later stages of clinical trials, a common challenge in pharmaceutical R\&D .

**3\. Key Indications and Bacteria:**  
   Gram-negative infections are a significant focus of many of these products. These infections are particularly dangerous due to the high resistance rate and the limited number of effective antibiotics available, emphasizing the urgent need for novel treatments.

**4\. Top Developers:**  
   Among the key players in AMR product development, companies like Qpex and GSK emerge as top contributors. These developers are leading the charge in both traditional antibiotics and non-traditional approaches.

**5\. Top Antibacterial Classes:**  
   A breakdown of the antibacterial products reveals a concentrated effort on specific drug classes, reflecting the industry's prioritization of therapies targeting resistant bacterial strains.

## **Conclusion:**

The analysis presents a clear view of the AMR landscape, showing a strong focus on early-stage products and the emergence of non-traditional therapies. Monitoring the progress of key developers and the advancement of products targeting Gram-negative bacteria will be crucial in the fight against AMR.  
