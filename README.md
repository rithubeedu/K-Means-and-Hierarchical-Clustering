# ✈️ Airline Customer Segmentation using Clustering

This project applies both **Hierarchical** and **K-Means Clustering** to segment customers from the EastWest Airlines dataset. The goal is to uncover patterns in travel behavior and categorize frequent flyers based on miles, balance, and reward activity.

---

## 📂 Dataset
**File**: `EastWestAirlines.csv`  
The dataset includes customer-level features such as:
- `Balance`: Frequent flyer account balance
- `Qual_miles`: Qualifying miles earned
- `cc1_miles`, `cc2_miles`, `cc3_miles`: Miles earned using credit cards
- `Bonus_miles`, `Bonus_trans`: Miles and transactions from bonus activity
- `Flight_miles_12mo`: Flight miles in the past 12 months

---

## ⚙️ Methodology

### 📌 1. Data Preparation
- Loaded dataset using `read.csv()`
- Standardized numerical features using `scale()` for distance-based clustering
- Handled structure and summary inspection using `str()` and `summary()`

---

### 🌲 2. Hierarchical Clustering
- Used **Ward’s method** to create a dendrogram of clusters
- Applied `hclust()` and visualized using `ggdendrogram()`
- Chose `k = 4` clusters based on tree cuts
- Summarized cluster characteristics: mean balance, miles, and bonus activity

---

### ⚙️ 3. K-Means Clustering
- Applied `kmeans()` with `k = 4` clusters
- Compared means across clusters using grouped summaries
- Repeated analysis on a 95% random sample to test stability

---

## 📊 Cluster Characteristics (sample)

| Cluster | Balance | Miles | Bonus Miles | Flights (12mo) |
|---------|---------|-------|-------------|----------------|
| 1       | 18,210  |  2,800| 14,250      | 1,200          |
| 2       | 55,610  | 12,200| 22,330      | 4,500          |
| 3       |  5,000  |   500 |  3,200      |  300           |
| 4       | 82,000  | 24,000| 40,000      | 8,000          |

---

## 💡 Insights
- **Cluster 4**: High-value frequent flyers — highest balance, miles, and bonus usage
- **Cluster 3**: Low activity, low loyalty — likely occasional flyers
- Results useful for targeted marketing and loyalty programs

---

## 💻 Tools Used
- Language: **R**
- Packages: `ggdendro`, `tidyverse`, `dplyr`

---

## 🧠 Author
**Rithu Rao Beedu**  
MAX 522 - Predictive Analytics | Assignment 3  
Spring 2025  
