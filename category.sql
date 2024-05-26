


WITH RECURSIVE CategoryHierarchy AS (
    SELECT category, parentCategory
    FROM rexroth_varioflow_categories
    WHERE category = 'Klemmförderer'
    UNION ALL
    SELECT c.category, c.parentCategory
    FROM rexroth_varioflow_categories c
    INNER JOIN CategoryHierarchy ch ON c.category = ch.parentCategory
)
SELECT parentCategory
FROM CategoryHierarchy
WHERE parentCategory IS NOT NULL;



WITH RECURSIVE CategoryHierarchy AS (
    SELECT category, parentCategory, 0 AS depth
    FROM rexroth_varioflow_categories
    WHERE category = 'Klemmförderer'
    UNION ALL
    SELECT c.category, c.parentCategory, ch.depth + 1
    FROM rexroth_varioflow_categories c
    INNER JOIN CategoryHierarchy ch ON c.category = ch.parentCategory
)
SELECT category, parentCategory, depth
FROM CategoryHierarchy
ORDER BY depth, parentCategory;



SELECT *
FROM rexroth_varioflow_categories
WHERE parentCategory = 'Montagetechnik';


Kettenfördersystem-VarioFlow-plus


SELECT *
FROM rexroth_varioflow_categories
WHERE parentCategory = 'Kettenfördersystem-VarioFlow-plus';



SELECT *
FROM rexroth_varioflow_categories
WHERE parentCategory <> 'Montagete';


SELECT *
FROM rexroth_varioflow_categories
WHERE parentCategory LIKE '%Vario%';


Förderkette


SELECT *
FROM rexroth_varioflow_categories
WHERE parentCategory LIKE '%Förderkette%';

Haftreibungskette

SELECT *
FROM rexroth_varioflow_categories
WHERE category LIKE '%Haftreibungskette%';

CREATE TABLE rexroth_varioflow_products (
    sku VARCHAR(50) PRIMARY KEY,
    productName VARCHAR(255),
    productLink VARCHAR(255),
    description TEXT,
    imageUrl VARCHAR(255),
    shippingInfo VARCHAR(255),
    price VARCHAR(50),
    stockStatus VARCHAR(50),
    category VARCHAR(255),
    CONSTRAINT fk_category
        FOREIGN KEY (category)
        REFERENCES rexroth_varioflow_categories(category)
);