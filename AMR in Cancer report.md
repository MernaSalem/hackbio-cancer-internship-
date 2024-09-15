<!--StartFragment-->


# **WHO AMR Products Data Analysis**

Authors (@slack): Chijioke C. Uhegwu (@Chijioke001), Merna Raafat Salem (@MernaSalem28), Olorunfemi Omobolade (@Olorunfemi), Elizabeth Sayo (@Sayo), Yomna Khaled (@yomna98)

This is a report about antimicrobial resistance (AMR) products data provided by World Health Organization (WHO). We are aiming to explore the product distribution, R\&D phases and pathogen activity. 

We found that 12.9% of the data was missing. After cleaning the data, we ended up with 10472 values out of 13380 with no missing values. Most of the AMR products provided in the data are antibiotics while the other products are non-traditional, as shown in figure 1. The majority of the products are still in phase I in R\&D, as illustrated in figure 2, followed by phase II, phase III, and preregistration. Therefore, we will focus on the products of phase I later in the report.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfckKtn0Wf-5Su9qDfd48Low1N0asPalXoIq5FEQzF-grXiU3TNJaCs6QAF-Sx-GNmIBdepL-tVjM2FqQdKmAOE-3XEFHY1zXXzd-fQ8tKXTNL8HMzgkrhD9eV8idU7LVdM0yY4QT-5NihSTH_ErjAL73w?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 1** represents the distribution of product types.
![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfQE-6mh_urPQ-edcr6lSeGVGOatW8ww2P6MRhTFMtmzKVYEeV7BDOsJRhtJ3bkAchpu5KYsaD3UM7WNkaO-Pvkz-gAvnuvNktJfnnoTAWokMqzjmcXrUl2KXfWOQ1wg5HNmHcMdLMY-S4g1tcqWl95rRMS?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 2.** Number of products in each R\&D phase.

As seen in figure 3, all the R\&D phases have AMR products that are administered intravenously, especially phase I. Whereas, only phase II has AMR products that are administered via inhalation, and only the preregistration phase has products that require colonoscopy.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcccNgnBFRxz1PqABzUmi-kHrsgU4qtKIFyf6Nr6ysnhjrnDyajaSxqf1CpWU6eQyTqXZR_vupHwY96ylJqQ6qHr3oFACh3J4UeJRwOtHEyhw53nGP6iDYj9cgOnhx38SUkAjBMZEQZRi8PQGkK4WdeBYJJ?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 3.** Distribution of products by route of administration and R\&D phase.

All the products are new chemical entities (figure 4). The highest number of the AMR products that have activity against priority pathogens are found in phase I, followed by phase II, phase III, and preregistration (figure 5).

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXckgYVdapzTXluIh9J0Skbt1kTuSq1bdBEwDE1NAw3m3ZHLQLadnZMrxC-mUIR1g-PYAmdEiH7lTVp0ZaJPxtgh7ytk28NOeQuChmPpm97X49GIVaFfK-rlT_mESsAdPjreh2xL9UVZUORMDE0CIIhzz-nD?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 4.** Relation between product name and new chemical entity (NCE) status.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfab3-JRQtPexXpXOf5LGJMJGllUqMC-Tqb_Tt8uHplCgnBjnlKOkwsLJ7DSVwaWnYnTiNMZmZ6_74hgRwWtdYzgE8Fl2jp68bd_98xiIdowGKyjvUUEGMvfGueYihe6nFYTOCZQCSlvqLUSg07mWcSqc4?key=5PtJDuPWXv5M3srZT2Fw7Q)**Figure 5** illustrates the efficacy of the AMR products against priority pathogens across the R\&D phases.

Among the pathogens mentioned in the data, the critical priority pathogens were less dominant than the other priority pathogens as seen in figure 6.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeK77VBI-qRxMdXf8A-h4W5D_A9cgTYpYPO6luRzlsVuRq2NKlVBLRlYzdsuQQdA2mP_Y7Gv-jiLp9M8_bfRsg21GjEe7yUGTms_BHliOmsKSaULsudAMh8LXgIk8nhcGAvO794MMabLPZEON90odf1Rtto?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 6.**  The activity and the number of the pathogens across the data.

The pie chart in figure 7 demonstrates a wide variety in the antimicrobial products types, with bacteriophage as the major type among the products.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdUOBYNchcj_e0k3ITd8nUBRPUM73lWPP7WGIpxljs7rIDeIx7T8bzGPXLMA44bwLLxuDx4VGVs6ZG5HscoDBv-SGw9ZvwZAkqmYbJ3QZkpJNBTjspNQukvn7gXDOxNANOpzg-R5bT5OYgswR6s-r0p8Hjk?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 7.** Antibacterial class distribution among the products.


## **Phase I: The initial stage of R\&D**

The vast majority of the AMR products are administered intravenously in most cases among the targeted pathogens, while the other products can be orally administered. Only TXA709 can be administered either intravenously or orally (figure 8). Consequently, we decided to focus on the AMR products that are administered intravenously in this stage and investigate their activity against the priority pathogens.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXer64cE4FXOVtE0MODjY0byu4Z8TX_I7AU0TUriwo6SMoBltSPuMK7YxXFwnUXJmVZ87JPYToNQYtz3NXHNYReY27AvYRACjVG2QfsIQzxbIW713yr9gd_ojdlumoqOvWac703vB3_GraQft85XEJMz6_V0?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 8.** Illustrates the distribution of AMR products in phase I

The data depicted in the heatmap (figure 9) indicates that TRL1068 has the highest activity against priority pathogens across the intravenous-administration phase I AMR products. Many of these products have activity against enterobacterals and the critical priority pathogens.

 ![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdJcuK4Fmqt2WDOFFuUV5sbI6pi967rqtwmHyDITDEyfLXgfiCMUa_HmqZDDBuul_InbYAjSALdM3MdsBB8kB63_oDIrLqTB9aDxoWYCDqKoZF55Z33MH35gHTzaZHGGk1HIRmugw30mi3PxK2RPV4DzRxy?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 9.** A Heatmap depicting the effect of the phase I products that are administered intravenously on the pathogens. 


## **Conclusion** 

The analysis of WHO AMR products data shows that the majority of products are in Phase I of development, indicating a focus on early-stage candidates.
Most products are administered intravenously, aimed at severe infections, with a smaller focus on oral routes. Phase I products show the highest activity against priority pathogens like Enterobacterales, with TRL1068 standing out as a key product to watch. Continued focus on these early-stage products is crucial for addressing AMR challenges.




<!--EndFragment-->
