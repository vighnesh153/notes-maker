### Meta
* Root path: `/api/`
* Custom status codes used and their interpretation
    - 419: Session Timeout

### Error code mappings (on client side)
* 401
```html
<Fragment>
Please login to continue.
</Fragment>
```
* 403
```html
<Fragment>
This is hosted by someone else. To host your own notes maker app, visit <a href="https://github.com/vighnesh153/notes-maker">Notes Maker</a>.
</Fragment>
```
* 419 
```html
<Fragment>
You have been logged out. Please login again.
</Fragment>
```

### Global responses
* Not authenticated to perform an action
```json
{
    "status": 401,
    "error": "Defined on the client side.",
    "data": {}
}
```
* Not an admin
```json
{
    "status": 403,
    "error": "Defined on the client side.",
    "data": {}
}
```
* Session Timeout
```json
{
    "status": 419,
    "error": "Defined on the client side.",
    "data": {}
}
```

### Folders endpoints
base-path: `/folders`

1. Read folder
    - sub-path: `/<FOLDER-ID`
    - method: `GET`
    - response:
        - Success
        ```json
        {
            "status": 200,
            "error": "",
            "data": [
                {
                    "id": "<FOLDER-ID>",
                    "type": "FOLDER",
                    "name": "<FOLDER-NAME>",
                    "section": "public"
                },
                {
                    "id": "<FILE-ID>",
                    "type": "FILE",
                    "name": "<FILE-NAME>",
                    "section": "private"
                },
                ...
            ]
        }
        ```
        - Folder not found
        ```json
        {
            "status": 404,
            "error": "Folder not found.",
            "data": {}
        }
        ```
        - Unauthenticated (for private folders): See global response

1. Read public or private sections
    - sub-path: `/sections/public` | `/sections/private`
    - method: `GET`
    - response:
        - Success
        ```json
        {
            "status": 200,
            "error": "",
            "data": [
                {
                    "id": "<FOLDER-ID>",
                    "type": "FOLDER",
                    "name": "<FOLDER-NAME>",
                    "section": "public"
                },
                {
                    "id": "<FILE-ID>",
                    "type": "FILE",
                    "name": "<FILE-NAME>",
                    "section": "private"
                },
                ...
            ]
        }
        ```
        - Section not found
        ```json
        {
            "status": 404,
            "error": "Section not found.",
            "data": {}
        }
        ```
        - Unauthenticated (for private section): See global responses


1. Create new folder
    - method: `POST`
    - body: 
    ```json
      {
        "name": "<FOLDER-NAME>",
        "parent_folder_id": "<PARENT-FOLDER-ID>"
      }
    ```
    - response:
        - Success
        ```json
        {
            "status": 201,
            "error": "",
            "data": {
                "id": "<FOLDER-ID>",
                "type": "FOLDER",
                "name": "<FOLDER-NAME>",
                "section": "public",
                "parent_folder_id": "<PARENT-FOLDER-ID>"
            }
        }
        ```
        - Parent folder not found
        ```json
        {
            "status": 404,
            "error": "Parent folder not found.",
            "data": {}
        }
        ```
        - Unauthenticated: See global responses


1. Update folder's name
    - sub-path: `/<FOLDER-ID`
    - method: `PATCH`
    - body: 
    ```json
    {
      "new_name": "<NEW-FOLDER-NAME>" 
    }
    ```
   - response:
       - Success
       ```json
       {
           "status": 200,
           "error": "",
           "data": {
               "id": "<FOLDER-ID>",
               "type": "FOLDER",
               "name": "<FOLDER-NAME>",
               "section": "public",
               "parent_folder_id": "<PARENT-FOLDER-ID>"
           }
       }
       ```
       - Folder not found
       ```json
       {
           "status": 404,
           "error": "Folder not found.",
           "data": {}
       }
       ```
       - Unauthenticated: See global responses

1. Delete folder
    - sub-path: `/<FOLDER-ID`
    - method: `DELETE`
    - response:
       - Success
       ```json
       {
           "status": 204,
           "error": "",
           "data": {}
       }
       ```
       - Folder not found
       ```json
       {
           "status": 404,
           "error": "Folder not found.",
           "data": {}
       }
       ```
       - Unauthenticated: See global responses


### Files endpoint
path: `/files`

1. Read file
    - sub-path: `/<FILE-ID`
    - method: `GET`
    - response:
        - Success
        ```json
        {
            "status": 200,
            "error": "",
            "data": {
                "id": "<FILE-ID",
                "content": "<TEXT>"
            }
        }
        ```
        - File not found
        ```json
        {
            "status": 404,
            "error": "File not found.",
            "data": {}
        }
        ```
        - Unauthenticated (for private file): See global response

1. Create new file.
    - method: `POST`
    - body: 
    ```json
    {
      "name": "<FILE-NAME>",
      "parent_folder_id": "<PARENT-FOLDER-ID>"
    }
    ```
    - response:
        - Success
        ```json
        {
            "status": 201,
            "error": "",
            "data": {
                "id": "<FILE-ID",
                "content": ""
            }
        }
        ```
        - Parent folder not found
        ```json
        {
            "status": 404,
            "error": "Parent folder not found.",
            "data": {}
        }
        ```
        - Unauthenticated: See global response

1. Update file name.
    - sub-path: `/<FILE-ID`
    - method: `PATCH`
    - body: 
    ```json
    {
      "new_name": "<NEW-FILE-NAME>"
    }
    ```
   - response:
       - Success
       ```json
       {
           "status": 200,
           "error": "",
           "data": {
               "id": "<FILE-ID",
               "name": "<FILE-NAME>"
           }
       }
       ```
       - File not found
       ```json
       {
           "status": 404,
           "error": "File not found.",
           "data": {}
       }
       ```
       - Unauthenticated: See global response

1. Update files' content.
    - sub-path: `/content`
    - method: `PATCH`
    - body: 
    ```json
    [
      {
        "file_id": "<FILE-ID>",
        "content": "<CONTENT-OF-THE-FILE>"
      },
      {
        "file_id": "<FILE-ID>",
        "content": "<CONTENT-OF-THE-FILE>"
      },
      ...
    ]
    ```
    - response
        - Success
        ```json
        {
            "status": 200,
            "error": "",
            "data": [
                {
                    "id": "<FILE-ID",
                    "content": "<TEXT>"
                },
                { 
                    "id": "<FILE-ID",
                    "content": "<TEXT>"
                },
                ...
            ]   
        }       
        ```
    - Unauthenticated: See global response

1. Delete file.
    - sub-path: `/<FILE-ID`
    - method: `DELETE`
    - response:
       - Success
       ```json
       {
           "status": 204,
           "error": "",
           "data": {}
       }
       ```
       - File not found
       ```json
       {
           "status": 404,
           "error": "File not found.",
           "data": {}
       }
       ```
       - Unauthenticated: See global responses


### Auth endpoints
path: `/oauth`

1. Github sign in
    - sub-path: `/github`
    - method: `GET`
    
    - Callback URL:
        - subpath: `/github/complete`
        - method: `GET`

    - on success, redirect to `/` (endpoint in the frontend side)
    - on failure, redirect to `/login?error=someErrorMessage` (endpoint in the frontend side)
