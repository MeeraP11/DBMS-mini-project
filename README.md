# Film Actors Database Backup

This project contains a SQL dump file (`film_backup.sql`) of a MySQL database named **`film`**. It includes actor data with essential details such as names, birth dates, nationality, and gender.

## Database Overview

- **Database Name**: `film`
- **Table**: `actors`

### Table Schema

| Column       | Type          | Description            |
|--------------|---------------|------------------------|
| `ActorID`    | INT (Primary) | Unique identifier      |
| `Name`       | VARCHAR(20)   | Actor's full name      |
| `DOB`        | DATE          | Date of Birth          |
| `Nationality`| VARCHAR(20)   | Country of origin      |
| `Gender`     | VARCHAR(20)   | Gender                 |

### Sample Data

The table includes notable actors such as:

- Hritik Roshan (Indian)
- Deepika Padukone (Indian)
- Leonardo DiCaprio (American)
- Kate Winslet (British)

## Usage Instructions

1. **Restore the database**:
   ```bash
   mysql -u <username> -p < film_backup.sql
