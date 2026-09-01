# Document Store Architecture: MongoDB Product Catalog & Reviews

## 1. Stored Data Structures
MongoDB handles dynamic product attributes (e.g., technical specifications, apparel sizes, color arrays) and unbounded user customer reviews.

```json
{
  "_id": "65f1a2b3c4d5e6f7a8b9c0d1",
  "postgres_product_id": 1,
  "attributes": {
    "ram_gb": 32,
    "storage_ssd": "1TB",
    "processor": "Apple M3 Pro"
  },
  "reviews": [
    {
      "review_id": "r101",
      "user_id": 2,
      "rating": 5,
      "comment": "Outstanding build quality and fast build times!",
      "created_at": "2026-02-15T08:30:00Z"
    }
  ]
}
