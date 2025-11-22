Dataset Description
The dataset is sourced from Kaggle, originally scraped from Zepto’s official product listings. It closely resembles real e-commerce catalog data, where products often appear multiple times due to different package sizes, weights, or discounts.

Each row represents a single SKU (Stock Keeping Unit). Duplicate product names are expected, as variations help improve product visibility in actual retail systems.

🧾 Columns Included

sku_id: Synthetic unique identifier for each product

name: Product name as shown on the app

category: Category such as Fruits, Snacks, Beverages, etc.

mrp: Maximum Retail Price (originally in paise → converted to ₹)

discountPercent: Discount applied on the MRP

discountedSellingPrice: Final selling price after discount (in ₹)

availableQuantity: Inventory units available

weightInGms: Weight of the product in grams

outOfStock: Boolean indicator of stock status

quantity: Units per package (also mixed with weight-based values for loose items)


Data Exploration
Counted the total number of records in the dataset

Viewed a sample of the dataset to understand structure and content

Checked for null values across all columns

Identified distinct product categories available in the dataset

Compared in-stock vs out-of-stock product counts

Detected products present multiple times, representing different SKUs

Data Cleaning
Identified and removed rows where MRP or discounted selling price was zero

Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability

Business Insights
Found top 10 best-value products based on discount percentage

Identified high-MRP products that are currently out of stock

Estimated potential revenue for each product category

Filtered expensive products (MRP > ₹500) with minimal discount

Ranked top 5 categories offering highest average discounts

Calculated price per gram to identify value-for-money products

Grouped products based on weight into Low, Medium, and Bulk categories

Measured total inventory weight per product category
