/* Дефолтная схема для постов
{
    "_id": ObjectId(),
    "title": "string",
    "text": "string",
    "author": { 
        "id": UUID()
    },
    "created_at": ISODate(),
    "status": "published",      // "draft" | "published" | "archived" ...
    "location": {               // nullable
        "type": "Point",
        "coordinates": [        // [lon, lat]
            40.1521651,
            47.615563
        ]
    },
    "media": {
        "photos": [
            {
                "id": UUID(),
                "url": "string",
                "created_at": ISODate(),
                "is_preview": false
            }
        ]
    }
}
*/

db.posts.createIndex({ "author.id": 1, created_at: -1 });
db.posts.createIndex({ location: "2dsphere" });