### Common Fields (to all collections/tables)
* id: ObjectId
* created_at: datetime
* updated_at: datetime
* deleted_at: datetime

### Folders
* name: string
* parent (`NULL` if `exists in root` else `ID_OF_PARENT_FOLDER`)
* section: `public` | `private`

### Files
* name: string
* parent (`NULL` if `exists in root` else `ID_OF_PARENT_FOLDER`)
* content: text
* section: `public` | `private`
