<!--StartFragment-->


# **WHO AMR Products Data Analysis**

Authors (@slack): Merna Raafat Salem (@MernaSalem28), Yomna Khaled (@yomna98), Chijioke C. Uhegwu (@Chijioke001), Olorunfemi Omobolade (@Olorunfemi), Elizabeth Sayo (@Sayo)

This is a report about antimicrobial resistance (AMR) products data provided by World Health Organization (WHO). We are aiming to explore the product distribution, R\&D phases and pathogen activity. 

We found that 12.9% of the data was missing. After cleaning the data, we ended up with 10472 values out of 13380 with no missing values. Most of the AMR products provided in the data are antibiotics while the other products are non-traditional, as shown in figure 1. The majority of the products are still in phase I in R\&D, as illustrated in figure 2, followed by phase II, phase III, and preregistration. Therefore, we will focus on the products of phase I later in the report.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXepkWebWV-gDogM9wHISoNBjrCFCZt0N7WHFAO_8jJ-_Hg8Kt5bR22eFafWxhQg-YPYug2jS-RFhJqBx94SkaQENAmO16J-7VoFkCBRhf232dBmiwXPXHTiIvaZzH-Tw2v6gPfnF_9mFxQ8AspJ07Fu0hI?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 1** represents the distribution of product types.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdF3ryzctY7G4YR-TH_Buwcp3-It0YnH-CQi8dO61s54KPimApQX1vXy3XUXsrTz8kLNlFAnH6v9ntiuvIJtS0k2584g7uHxgwfhz1lAfWo4VGAZpMp84UGMrZ54_PNM4Qudr-ekhvcc-8zpQ_w9LbDs0f-?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 2.** Number of products in each R\&D phase.

As seen in figure 3, all the R\&D phases have AMR products that are administered intravenously, especially phase I. Whereas, only phase II has AMR products that are administered via inhalation, and only the preregistration phase has products that require colonoscopy.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcaQHcq_VesXOxcSQpHbsOlnvVwsIfRWbgT8G-aG2n4v__cAeelICWe20H0NHaOaYTO3pF6_dKn0mUceW4PzTjAzPLOfLOenNWXH-Hzx49DCkSUEP7cZOpz2IKlSv4_tS3APQ4HHBasfruFh_uS8j9W7_gD?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 3.** Distribution of products by route of administration and R\&D phase.

All the products are new chemical entities (figure 4). The highest number of the AMR products that have activity against priority pathogens are found in phase I, followed by phase II, phase III, and preregistration (figure 5).

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfBzct-ByCsThLDQs8FDPWjo5OR2GE_gIn2OznzwRsLKhpuS1pY1k7-hK87CMx321gzGpQr-JtbWjCVI3zP0ZNi8tt2aAZjhaXXUo7JaAYf5IxAYYq-91cI54gTemlLbLrr60yRvwv3BZtMzC5qBzx_lHR-?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 4.** Relation between product name and new chemical entity (NCE) status.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdVSf8O0RmNkmJKKnNKxR0gtHWp9GrZPXQetD522LeASeTL4pQVAiGUxOsum8IqqZlBsBO_c_9vPSOKsb7ogTWZ5_9Qf6S6K-QyIpBDmWsqhAmK6MnLR4Ro874QIuCLsa4xYmMI3rlDaixJD57S_2jMP08?key=5PtJDuPWXv5M3srZT2Fw7Q)**Figure 5** illustrates the efficacy of the AMR products against priority pathogens across the R\&D phases.

Among the pathogens mentioned in the data, the critical priority pathogens were less dominant than the other priority pathogens as seen in figure 6.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfF6OSUEwxFm5ERuZnrj26uKXmQPwDoZaUGr7Erh34lbyNWxhPy9-IhXtnf1ftq1dPMXqv5AUMmiZI8gahmJq7nrUqvbmeJTta1AAU4BDv-01o-7NAn9cXnPoWOytjnKnrkv1SeuPN5g3H96PLLqDlTetBg?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 6.**  The activity and the number of the pathogens across the data.

The pie chart in figure 7 demonstrates a wide variety in the antimicrobial classes, with bacteriophage as the major type among them.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeflHQcYZWiNAPpa7XBQN4suYMBHNyaXR5W9pdUL3jYKjfztNS6WIOjabvRFsOfh3nNd6izUE3b9vV4sW4UVFWfKG0bElzN9tDh1PMzAYI_lda7KhFus7az8fqfk10-PHmkbjr2H_ywlaBXa2cjDopWAAb1?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 7.** Antibacterial class distribution among the products.


## **Phase I: The initial stage of R\&D**

The vast majority of the AMR products are administered intravenously in most cases among the targeted pathogens, while the other products can be orally administered. Only TXA709 can be administered either intravenously or orally (figure 8). Consequently, we decided to focus on the AMR products that are administered intravenously in this stage and investigate their activity against the priority pathogens.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdXcVW0-cAukIUqxhBY891QaJgc6lE50tI3L7xJLlpwMJW-VAq_e1o6Hb8acmc5NZ94mpaYDRk5xzWaggXXL12wgvFExaeufv3Q_ZoQYOTv2BjwR1s5WmximzXKReLVY8HYn4RtTv-HoaJ4j4pzaDOR3LgC?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 8.** Illustrates the distribution of AMR products in phase I

The data depicted in the heatmap (figure 9) indicates that TRL1068 has the highest activity against priority pathogens across the intravenous-administration phase I AMR products. Many of these products have activity against enterobacterals and the critical priority pathogens.

 ![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXd1ITYFIkHKcqKna7LKW7zrKiuISNKFdiXjzuJb4p8JN-5Vfwd9SJuC640zdZDJf6CLyiBBufPpRsjzFvVEHfUpP73ui8JAeOZE6ZTlfPv5eOL2S_dHhsiAg8Et8IWmlOGLaduFjEX6OdG5ThoxFmcQZHRA?key=5PtJDuPWXv5M3srZT2Fw7Q)

**Figure 9.** A Heatmap depicting the effect of the phase I products that are administered intravenously on the pathogens. 


## **Conclusion** 

The analysis of WHO AMR products data shows that the majority of products are in Phase I of development, indicating a focus on early-stage candidates. Bacteriophages dominate in the antimicrobial class. Most products are administered intravenously, aimed at severe infections, with a smaller focus on oral routes. Phase I products show the highest activity against priority pathogens like Enterobacterales, with TRL1068 standing out as a key product to watch. Continued focus on these early-stage products is crucial for addressing AMR challenges.


<!--EndFragment-->
