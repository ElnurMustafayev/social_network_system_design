### Пост
``` sql
-- 150 + (60 * 3) = 330B

id: int (PK), -- ~4B
text: nvarchar(1000), -- ~200B
author_id: int (FK) (INDEX) -- ~4B
created_at: datetime (INDEX), -- ~8B
locationId: int (FK), -- ~4B
likesCount: int, -- ~4B
photos: [ -- x 3
	{
		id: int (PK), -- ~4B
		isPreview: bit?, -- ~1B
		path: varchar(100) -- ~50B
	}
]
```
### Фото
```
preview: ~100KB
compressed photo: ~500KB
```
### Реакция
``` sql
-- 40B

id: int (PK), -- ~4B
author_id: int (FK), -- ~4B
created_at: datetime (INDEX), -- ~8B
post_id: int (FK) -- ~4B

CLUSTERED INDEX (author_id, post_id)
```
### Комментарий
``` sql
-- 100B

id: int (PK), -- ~4B
text: nvarchar(500), -- ~70B
author_id: int (FK), -- ~4B
created_at: datetime (INDEX), -- ~8B
post_id: int (FK) (INDEX), -- ~4B
parent_id: int (FK) -- ~4B